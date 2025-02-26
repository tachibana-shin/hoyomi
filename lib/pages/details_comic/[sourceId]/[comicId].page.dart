import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:hoyomi/composable/use_user_async.dart';
import 'package:hoyomi/controller/history.dart';
import 'package:hoyomi/core_services/mixin/auth_mixin.dart';
import 'package:hoyomi/core_services/comic/mixin/comic_auth_mixin.dart';
import 'package:hoyomi/core_services/comic/comic_service.dart';
import 'package:hoyomi/core_services/comic/interfaces/comic_section.dart';
import 'package:hoyomi/core_services/interfaces/user.dart';

import 'package:hoyomi/core_services/comic/interfaces/meta_comic.dart';
import 'package:hoyomi/core_services/comic/interfaces/status_enum.dart';
import 'package:hoyomi/core_services/interfaces/o_image.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/errors/captcha_required_exception.dart';
import 'package:hoyomi/apis/show_snack_bar.dart';
import 'package:hoyomi/database/scheme/history_chap.dart';
import 'package:hoyomi/plugins/event_bus.dart';
import 'package:hoyomi/utils/format_number.dart';
import 'package:hoyomi/utils/format_time_ago.dart';
import 'package:hoyomi/widgets/comic/icon_button_follow.dart';
import 'package:hoyomi/widgets/comic/icon_button_open_browser.dart';
import 'package:hoyomi/widgets/comic/icon_button_share.dart';
import 'package:hoyomi/widgets/comments/widget/comments.dart';
import 'package:hoyomi/widgets/comic/horizontal_comic_list.dart';
import 'package:hoyomi/widgets/comic/sheet_chapters.dart';
import 'package:hoyomi/widgets/pull_refresh_page.dart';
import 'package:mediaquery_sizer/mediaquery_sizer.dart';
import 'package:signals/signals_flutter.dart';

class DetailsComic extends StatefulWidget {
  final String sourceId;
  final String comicId;

  const DetailsComic({
    super.key,
    required this.sourceId,
    required this.comicId,
  });

  @override
  createState() => _DetailsComicState();
}

class _DetailsComicState extends State<DetailsComic>
    with SingleTickerProviderStateMixin {
  Future<ComicSection>? _suggestFuture;
  late final ComicService _service;

  late final AnimationController _bottomSheetAnimationController;

  final ScrollController _scrollController = ScrollController();

  bool _isTitleVisible = false;
  String _title = "";
  MetaComic? _comic;

  // History data
  Map<String, HistoryChap>? _historyChapters;

  @override
  void initState() {
    super.initState();

    _bottomSheetAnimationController = AnimationController(vsync: this);

    _service = getComicService(widget.sourceId);

    _scrollController.addListener(_onScroll);
  }

  void _updateGetHistory() async {
    final history = HistoryController();
    final map = await history.getHistory(_service.uid, widget.comicId);

    if (mounted) {
      setState(() {
        if (map != null) {
          _historyChapters = {for (var item in map) item.chapterId: item};
        }
      });
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();

    super.dispose();
  }

  void _onScroll() {
    final isTitleVisible = _scrollController.offset > 50;

    if (_isTitleVisible != isTitleVisible) {
      setState(() {
        _isTitleVisible = isTitleVisible;
      });
    }
  }

  @override
  Widget build(BuildContext context2) {
    return PullRefreshPage(
      onLoadData:
          () => _service.getDetails(widget.comicId)..then((comic) {
            _title = comic.name;
            _comic = comic;
            _suggestFuture =
                _service.getSuggest == null
                    ? null
                    : _service.getSuggest!(_comic!);

            HistoryController().createComic(
              _service.uid,
              comicId: widget.comicId,
              comic: comic,
            );

            _updateGetHistory();
            eventBus.on<UpdatedHistory>().listen((event) {
              if (!mounted) return;
              // ignore: use_build_context_synchronously
              final name = GoRouter.of(context).state.name;

              // lazy call history
              if (event.comicId == widget.comicId &&
                  (name == "details_comic" || event.force)) {
                _updateGetHistory();
              }
            });
          }),
      onLoadFake: () => MetaComic.createFakeData(),
      builder:
          (comic, _) => Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              scrolledUnderElevation: 0.0,
              leading: IconButton(
                icon: const Icon(MaterialCommunityIcons.arrow_left),
                onPressed: () {
                  context.pop();
                },
              ),
              title: AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: _isTitleVisible ? 1.0 : 0.0,
                child: Text(_title),
              ),
              actions: [
                if (_service is ComicAuthMixin && _service is AuthMixin)
                  _AvatarUser(service: _service),
                IconButtonShare(),
                IconButtonFollow(
                  sourceId: widget.sourceId,
                  comicId: widget.comicId,
                  comic: _comic,
                ),
                PopupMenuButton<String>(
                  onSelected: (value) {
                    _handleMenuSelection(context, value);
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      _buildMenuItem('download', 'Download'),
                      _buildMenuItem('find_similar', 'Find similar'),
                      _buildMenuItem('open_browser', 'Open with browser'),
                      _buildMenuItem('create_shortcut', 'Create shortcut'),
                    ];
                  },
                ),
              ],
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.all(
                16.0,
              ).add(EdgeInsets.only(bottom: 15.h(context))),
              controller: _scrollController,
              child: _buildContainer(comic),
            ),
            bottomSheet:
                _comic == null
                    ? null
                    : BottomSheet(
                      animationController: _bottomSheetAnimationController,
                      showDragHandle: true,
                      builder: (context) => _buildSheetChapters()!,
                      onClosing: () {},
                    ),
          ),
    );
  }

  Widget _buildContainer(MetaComic comic) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left Column: Comic Image
            Expanded(
              flex: 1,
              child: AspectRatio(
                aspectRatio: 2 / 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: OImage.network(
                    comic.image.src,
                    sourceId: widget.sourceId,
                    headers: comic.image.headers,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            // Right Column: Comic Information
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    comic.name,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (comic.originalName != null) ...[
                    SizedBox(height: 4.0),
                    Text(
                      comic.originalName!,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Theme.of(context).colorScheme.secondary,
                        height: 1.2,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                  const SizedBox(height: 8.0),
                  if (comic.author != null)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(MaterialCommunityIcons.account, size: 18.0),
                        SizedBox(width: 8.0),
                        Expanded(
                          child: Text(
                            comic.author!,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  if (comic.translator != null)
                    Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(MaterialCommunityIcons.translate, size: 18.0),
                          SizedBox(width: 8.0),
                          Text(
                            comic.translator!,
                            style: const TextStyle(fontSize: 14.0),
                          ),
                        ],
                      ),
                    ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: comic.translator != null ? 2.0 : 8.0,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(MaterialCommunityIcons.play_outline, size: 18.0),
                        SizedBox(width: 8.0),
                        Text(
                          {
                                StatusEnum.ongoing: "On going",
                                StatusEnum.completed: "Completed",
                                StatusEnum.canceled: "Canceled",
                                StatusEnum.unknown: "Unknown",
                                StatusEnum.onHiatus: "On hiatus",
                                StatusEnum.publishingFinished:
                                    "Publishing finished",
                              }[comic.status] ??
                              comic.status.toString(),
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.lightGreen,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  if (comic.rate != null)
                    Row(
                      children: [
                        ...List.generate(
                          comic.rate!.value.floor(),
                          (index) => Icon(
                            Icons.star,
                            size: 16.0,
                            color: Colors.blue.shade200 /* Theme.of(context)
                                            .colorScheme
                                            .onPrimaryContainer,*/,
                          ),
                        ),
                        if (comic.rate!.value % 1 != 0)
                          Icon(
                            Icons.star_half,
                            size: 16.0,
                            color: Colors.blue.shade200,
                          ),
                        ...List.generate(
                          (comic.rate!.best - comic.rate!.value).floor(),
                          (index) => Icon(
                            Icons.star,
                            size: 16.0,
                            color: Theme.of(context)
                                .colorScheme
                                .onSurfaceVariant
                                .withValues(alpha: 0.5),
                          ),
                        ),
                        const SizedBox(width: 4.0),
                        Text(
                          "(${comic.rate!.count})",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Theme.of(context).colorScheme.inverseSurface,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      MaterialCommunityIcons.television,
                      size: 20.0,
                      color: Colors.blueGrey.shade100,
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      comic.views != null ? formatNumber(comic.views!) : '?',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.blueGrey.shade100,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: _ButtonLike(
                comic: comic,
                comicId: widget.comicId,
                service: _service,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      MaterialCommunityIcons.update,
                      size: 20.0,
                      color: Colors.blueGrey.shade100,
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      formatTimeAgo(comic.lastModified),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.blueGrey.shade100,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      MaterialCommunityIcons.star_outline,
                      size: 20.0,
                      color: Colors.blueGrey.shade100,
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      (comic.rate != null)
                          ? "${comic.rate!.value} / ${comic.rate!.best}"
                          : "?", // 星星評分
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.blueGrey.shade100,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        Row(
          children: [
            Expanded(child: _buildButtonRead(comic)),
            const SizedBox(width: 8.0),
            _buildButtonDownload(),
          ],
        ),
        const SizedBox(height: 20.0),

        // Comment
        if (_service is ComicAuthMixin &&
            (_service as ComicAuthMixin).getComments != null)
          Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Comments(
              getComments: ({page, parent}) {
                return (_service as ComicAuthMixin).getComments!(
                  comicId: widget.comicId,
                  page: page,
                  parent: parent,
                );
              },
              deleteComment: ({required comment, parent}) {
                return (_service as ComicAuthMixin).deleteComment!(
                  comicId: widget.comicId,
                  comment: comment,
                  parent: parent,
                );
              },
              setLikeComment: ({required comment, parent, required value}) {
                return (_service as ComicAuthMixin).setLikeComment!(
                  comicId: widget.comicId,
                  comment: comment,
                  parent: parent,
                  value: value,
                );
              },
              controller: null,
              activatorMode: true,
            ),
          ),

        // Description Section
        Text(
          'Description',
          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 7.0),
        Text(comic.description, style: TextStyle(fontSize: 14.0)),

        const SizedBox(height: 24.0),

        Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children:
              comic.genres.map((genre) {
                return InkWell(
                  onTap: () {
                    ///
                    context.push(
                      "/section_comic/${_service.uid}/${genre.genreId}",
                    );
                  },
                  child: Chip(label: Text(genre.name)),
                );
              }).toList(),
        ),
        SizedBox(height: 24.0),
        _buildSuggest(comic),
      ],
    );
  }

  Widget _buildButtonRead(MetaComic comic) {
    //    _historyChapters

    final current =
        _historyChapters?.entries.isNotEmpty == true
            ? _historyChapters?.entries.reduce(
              (a, b) => a.value.updatedAt.isAfter(b.value.updatedAt) ? a : b,
            )
            : null;
    final currentEpisodeIndex =
        current == null
            ? null
            : comic.chapters.toList().lastIndexWhere((chapter) {
              return current.key == chapter.chapterId;
            });
    final totalEpisodes = comic.chapters.length;

    return ClipRRect(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(35),
      child: InkWell(
        onTap: () {
          if (currentEpisodeIndex != null) {
            context.push(
              "/details_comic/${widget.sourceId}/${widget.comicId}/view?chap=${comic.chapters.elementAt(currentEpisodeIndex).chapterId}",
              extra: {'comic': comic},
            );
          } else {
            context.push(
              "/details_comic/${widget.sourceId}/${widget.comicId}/view?chap=${comic.chapters.last.chapterId}",
              extra: {'comic': comic},
            );
          }
        },
        borderRadius: BorderRadius.circular(35),
        child: Stack(
          children: [
            Container(
              height: 48,
              decoration: BoxDecoration(
                color: Theme.of(
                  context,
                ).colorScheme.tertiaryFixed.withValues(alpha: 0.3),
                //.tertiaryContainer,
                borderRadius: BorderRadius.circular(35),
              ),
            ),
            Container(
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  bottomLeft: Radius.circular(35),
                ),
              ),
              clipBehavior: Clip.antiAlias,
              child: AnimatedFractionallySizedBox(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                alignment: Alignment.centerLeft,
                widthFactor:
                    currentEpisodeIndex == null
                        ? 0
                        : (totalEpisodes - currentEpisodeIndex) / totalEpisodes,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.tertiaryFixedDim.withValues(alpha: 0.6),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      bottomLeft: Radius.circular(35),
                    ),
                  ),
                ),
              ),
            ),
            // Text content
            Container(
              height: 48,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    currentEpisodeIndex == null ? 'Read now' : 'Continue',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color:
                          Theme.of(
                            context,
                          ).colorScheme.onSurface, //.withValues(alpha: 0.6),
                    ),
                  ),
                  Text(
                    currentEpisodeIndex == null
                        ? '$totalEpisodes chapters'
                        : '${comic.chapters.elementAt(currentEpisodeIndex).name} of $totalEpisodes',
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.9),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonDownload() {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: Theme.of(
          context,
        ).colorScheme.tertiaryFixedDim.withValues(alpha: 0.44),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: IconButton(
          onPressed: () {},
          icon: Icon(MaterialCommunityIcons.download),
          iconSize: 48 / 2,
        ),
      ),
    );
  }

  Widget _buildSuggest(MetaComic comic) {
    if (_suggestFuture == null) return SizedBox.shrink();

    return HorizontalComicList(
      itemsFuture: _suggestFuture!.then(
        (value) =>
            value.items
                .map(
                  (comic) => ComicExtend(comic: comic, sourceId: _service.uid),
                )
                .toList(),
      ),
      // totalItems: _suggestFuture!.then((value) => value.totalItems),
      title: 'Suggest',
    );
  }

  PopupMenuItem<String> _buildMenuItem(String id, String text) {
    return PopupMenuItem<String>(value: id, child: Text(text));
  }

  void _handleMenuSelection(BuildContext context, String id) {
    switch (id) {
      case 'download':
        // _downloadContent(context);
        break;
      case 'find_similar':
        context.push(
          '/details_comic/${widget.sourceId}/${widget.comicId}/similar',
          extra: {'comic': _comic},
        );
        break;
      case 'open_browser':
        IconButtonOpenBrowser.open(_service.getURL(widget.comicId));
        // _openInBrowser(context);
        break;
      case 'create_shortcut':
        // _createShortcut(context);
        break;
    }
  }

  Widget? _buildSheetChapters() {
    if (_comic == null) return null;
    return SheetChapters(
      comic: _comic!,
      sourceId: widget.sourceId,
      comicId: widget.comicId,
      histories: _historyChapters,
      initialChildSize: 0.15,
    );
  }
}

// class _BackgroundCover extends ConsumerWidget {
//   const _BackgroundCover({
//     required this.thumbnailUrl,
//     required this.scrollController,
//   });

//   final String thumbnailUrl;
//   final ScrollController scrollController;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final theme = Theme.of(context);

//     return ListenableBuilder(
//       listenable: scrollController,
//       builder: (_, child) {
//         final offset =
//             scrollController.hasClients ? scrollController.offset : 0;
//         final opacity = 1 - (offset / 200).clamp(0, 1).toDouble();

//         return Opacity(
//           opacity: opacity,
//           child: child,
//         );
//       },
//       child: GradientImage(
//         height: 480,
//         image: CachedNetworkImageProvider(
//           thumbnailUrl,
//           cacheManager: ref.watch(cacheManagerProvider),
//         ),
//         gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [
//             theme.scaffoldBackgroundColor.withValues(alpha: 0.05),
//             theme.scaffoldBackgroundColor,
//           ],
//           stops: const [0, .3],
//         ),
//       ),
//     );
//   }
// }

class _ButtonLike extends StatefulWidget {
  final String comicId;
  final MetaComic comic;
  final ComicService service;

  const _ButtonLike({
    required this.comicId,
    required this.comic,
    required this.service,
  });

  @override
  createState() => _ButtonLikeState();
}

class _ButtonLikeState extends State<_ButtonLike> {
  bool? _liked;
  int? _likes = 0;

  @override
  void initState() {
    super.initState();
    _likes = widget.comic.likes;

    if (widget.service is ComicAuthMixin) {
      (widget.service as ComicAuthMixin)
          .isLiked(comicId: widget.comicId)
          .then((liked) {
            if (mounted) {
              setState(() {
                _liked = liked;
              });
            }
          })
          .catchError((error) {
            if (error is! CaptchaRequiredException) {
              showSnackBar(Text('Error: $error')); // 显示錯誤訊息
            }
          });
    }
  }

  void _onTap() {
    (widget.service as ComicAuthMixin)
        .setLike(comicId: widget.comicId, value: !(_liked ?? false))
        .then((value) {
          if (mounted) {
            setState(() {
              _liked = value;
              _likes =
                  value
                      ? (widget.comic.likes ?? 0) + 1
                      : widget.comic.likes! - 1;
            });
          }
        })
        .catchError((error) {
          if (error is! CaptchaRequiredException) {
            showSnackBar(Text('Error: $error')); // 显示錯誤訊息
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (widget.service is ComicAuthMixin) ? _onTap : null,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                _liked ?? false
                    ? MaterialCommunityIcons.thumb_up
                    : MaterialCommunityIcons.thumb_up_outline,
                size: 20.0,
                color: Colors.blueGrey.shade100,
              ),
              const SizedBox(height: 4.0),
              Text(
                _likes != null ? formatNumber(_likes!) : '?',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.blueGrey.shade100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AvatarUser extends StatefulWidget {
  final ComicService service;

  const _AvatarUser({required this.service});

  @override
  createState() => _AvatarUserState();
}

class _AvatarUserState extends State<_AvatarUser> {
  Signal<User?>? _user;
  Future<void> Function()? _refresh;
  Function()? _onDispose;

  @override
  void initState() {
    super.initState();

    useUserAsync(widget.service as AuthMixin).then((value) {
      if (mounted) {
        setState(() {
          _user = value.user;
          _refresh = value.refresh;

          _onDispose = value.error.subscribe((error) {
            if (error != null) {
              showSnackBar(Text('Sign in failed: $error'));
              value.user.value = null;
            }
          });
        });
      }
    });
  }

  @override
  void dispose() {
    if (_onDispose != null) _onDispose!();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return SizedBox.shrink();
    }

    return Watch((context) {
      final user = _user?.value;

      if (user != null) {
        return Tooltip(
          message: user.fullName,
          child: CircleAvatar(
            radius: 15,
            backgroundColor: Theme.of(context).colorScheme.onSurface,
            child: OImage.network(
              user.photoUrl,
              sourceId: widget.service.uid,
              fit: BoxFit.cover,
            ),
          ),
        );
      }

      return GestureDetector(
        onTap: () async {
          await context.push("/webview/${widget.service.uid}");
          _refresh!();
        },
        child: CircleAvatar(
          radius: 15,
          backgroundColor: Theme.of(context).colorScheme.onSurface,
          child: Icon(
            Icons.account_circle,
            color: Theme.of(context).colorScheme.primary,
            size: 30,
          ),
        ),
      );
    });
  }
}

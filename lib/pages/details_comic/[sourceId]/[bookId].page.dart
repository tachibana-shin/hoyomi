import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:honyomi/cache/get_user.dart';
import 'package:honyomi/controller/history.dart';
import 'package:honyomi/core_services/auth_service.dart';
import 'package:honyomi/core_services/base_service.dart';
import 'package:honyomi/core_services/interfaces/base_section.dart';
import 'package:honyomi/core_services/interfaces/basic_user.dart';

import 'package:honyomi/core_services/interfaces/meta_book.dart';
import 'package:honyomi/core_services/interfaces/status_enum.dart';
import 'package:honyomi/core_services/main.dart';
import 'package:honyomi/globals.dart';
import 'package:honyomi/models/history_chap.dart';
import 'package:honyomi/plugins/event_bus.dart';
import 'package:honyomi/utils/format_number.dart';
import 'package:honyomi/utils/format_time_ago.dart';
import 'package:honyomi/widgets/book/icon_button_follow.dart';
import 'package:honyomi/widgets/book/icon_button_open_browser.dart';
import 'package:honyomi/widgets/book/icon_button_share.dart';
import 'package:honyomi/widgets/horizontal_book_list.dart';
import 'package:honyomi/widgets/sheet_chapters.dart';

class DetailsComic extends StatefulWidget {
  final String sourceId;
  final String bookId;

  const DetailsComic({super.key, required this.sourceId, required this.bookId});

  @override
  createState() => _DetailsComicState();
}

class _DetailsComicState extends State<DetailsComic>
    with SingleTickerProviderStateMixin {
  late Future<MetaBook> _metaBookFuture;
  Future<BaseSection>? _suggestFuture;
  late final BaseService _service;

  late final AnimationController _bottomSheetAnimationController;

  final ScrollController _scrollController = ScrollController();
  bool _isTitleVisible = false;
  String _title = "";
  MetaBook? _book;

  // History data
  Map<String, HistoryChap>? _historyChapters;

  @override
  void initState() {
    super.initState();

    _bottomSheetAnimationController = AnimationController(vsync: this);

    _service = getService(widget.sourceId);
    _metaBookFuture = _service.getDetails(widget.bookId);
    _metaBookFuture.then((book) {
      setState(() {
        _title = book.name;
        _book = book;
        _suggestFuture =
            _service.getSuggest == null ? null : _service.getSuggest!(_book!);

        HistoryController(null)
            .createBook(_service.uid, bookId: widget.bookId, book: book);

        _updateGetHistory();
        eventBus.on<UpdatedHistory>().listen((event) {
          if (!mounted) return;
          // ignore: use_build_context_synchronously
          final name = GoRouter.of(context).state?.name;

          // lazy call history
          if (event.bookId == widget.bookId &&
              (name == "details_comic" || event.force)) {
            _updateGetHistory();
          }
        });
      });
    });

    _scrollController.addListener(_onScroll);
  }

  void _updateGetHistory() {
    setState(() {
      final history = HistoryController(null);
      final map = history.getHistory(_service.uid, widget.bookId);
      if (map != null) {
        _historyChapters = {for (var item in map) item.chapterId: item};
      }
    });
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
    return Scaffold(
        appBar: AppBar(
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
            if (_service is AuthService) _AvatarUser(service: (_service)),
            IconButtonShare(),
            if (_book != null)
              IconButtonFollow(
                  sourceId: widget.sourceId,
                  bookId: widget.bookId,
                  book: _book!),
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
        body: FutureBuilder<MetaBook>(
          future: _metaBookFuture,
          builder: (context2, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              if (_service.isCaptchaError(snapshot.error)) {
                return Center(child: _service.templateCaptchaResolver(context));
              }

              return Center(child: Text('Error: ${snapshot.error}'));
            }

            if (!snapshot.hasData) {
              return const Center(child: Text('No data available.'));
            }

            MetaBook book = snapshot.data!;

            return SingleChildScrollView(
                padding: EdgeInsets.all(16.0).add(EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.15)),
                controller: _scrollController,
                child: _buildContainer(book));
          },
        ),
        bottomSheet: _book == null
            ? null
            : BottomSheet(
                animationController: _bottomSheetAnimationController,
                builder: (context) => _buildSheetChapters()!,
                onClosing: () {},
              ));
  }

  Widget _buildContainer(MetaBook book) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left Column: Book Image
            Expanded(
              flex: 1,
              child: AspectRatio(
                aspectRatio: 2 / 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    book.image.src,
                    headers: book.image.headers,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            // Right Column: Book Information
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.name,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  ...book.originalName != null
                      ? [
                          SizedBox(height: 4.0),
                          Text(
                            book.originalName!,
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Theme.of(context).colorScheme.secondary,
                              height: 1.2,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )
                        ]
                      : [],
                  const SizedBox(height: 8.0),
                  if (book.author != null)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(MaterialCommunityIcons.account, size: 18.0),
                        SizedBox(width: 8.0),
                        Expanded(
                            child: Text(
                          book.author!,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                      ],
                    ),
                  if (book.translator != null)
                    Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(MaterialCommunityIcons.translate, size: 18.0),
                            SizedBox(width: 8.0),
                            Text(
                              book.translator!,
                              style: const TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        )),
                  Padding(
                      padding: EdgeInsets.only(
                          top: book.translator != null ? 2.0 : 8.0),
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
                                }[book.status] ??
                                book.status.toString(),
                            style: const TextStyle(
                                fontSize: 14.0, color: Colors.lightGreen),
                          ),
                        ],
                      )),
                  const SizedBox(height: 8.0),
                  if (book.rate != null)
                    Row(
                      children: [
                        ...List.generate(
                          book.rate!.value.floor(),
                          (index) => Icon(
                            Icons.star,
                            size: 16.0,
                            color: Colors.blue
                                .shade200, /* Theme.of(context)
                                            .colorScheme
                                            .onPrimaryContainer,*/
                          ),
                        ),
                        if (book.rate!.value % 1 != 0)
                          Icon(
                            Icons.star_half,
                            size: 16.0,
                            color: Colors.blue.shade200,
                          ),
                        ...List.generate(
                          (book.rate!.best - book.rate!.value).floor(),
                          (index) => Icon(
                            Icons.star,
                            size: 16.0,
                            color: Theme.of(context)
                                .colorScheme
                                .onSurfaceVariant
                                .withOpacity(0.5),
                          ),
                        ),
                        const SizedBox(width: 4.0),
                        Text(
                          "(${book.rate!.count})",
                          style: TextStyle(
                              fontSize: 14.0,
                              color:
                                  Theme.of(context).colorScheme.inverseSurface),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        Container(
          color: Colors.transparent,
          padding: EdgeInsets.zero,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(MaterialCommunityIcons.television,
                          size: 20.0, color: Colors.blueGrey.shade100),
                      const SizedBox(height: 4.0),
                      Text(
                        book.views != null ? formatNumber(book.views!) : '?',
                        style: TextStyle(
                            fontSize: 14.0, color: Colors.blueGrey.shade100),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: _ButtonLike(
                  book: book,
                  bookId: widget.bookId,
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
                      Icon(MaterialCommunityIcons.update,
                          size: 20.0, color: Colors.blueGrey.shade100),
                      const SizedBox(height: 4.0),
                      Text(
                        formatTimeAgo(book.lastModified),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 14.0, color: Colors.blueGrey.shade100),
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
                      Icon(MaterialCommunityIcons.star_outline,
                          size: 20.0, color: Colors.blueGrey.shade100),
                      const SizedBox(height: 4.0),
                      Text(
                        (book.rate != null)
                            ? "${book.rate!.value} / ${book.rate!.best}"
                            : "?", // 星星評分
                        style: TextStyle(
                            fontSize: 14.0, color: Colors.blueGrey.shade100),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        Row(children: [
          Expanded(child: _buildButtonRead(book)),
          const SizedBox(width: 8.0),
          _buildButtonDownload()
        ]),
        const SizedBox(height: 20.0),
        // Description Section
        Text(
          'Description',
          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 7.0),
        Text(book.description, style: TextStyle(fontSize: 14.0)),
        const SizedBox(height: 24.0),

        Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children: book.genres.map((genre) {
            return InkWell(
                onTap: () {
                  ///
                  context.push("/section/${_service.uid}/${genre.genreId}");
                },
                child: Chip(
                  padding: EdgeInsets.all(0),
                  label: Text(genre.name,
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ));
          }).toList(),
        ),
        SizedBox(height: 24.0),
        _buildSuggest(book)
      ],
    );
  }

  Widget _buildButtonRead(MetaBook book) {
    //    _historyChapters

    final current = _historyChapters?.entries.isNotEmpty == true
        ? _historyChapters?.entries.reduce(
            (a, b) => a.value.updatedAt.isAfter(b.value.updatedAt) ? a : b)
        : null;
    final currentEpisodeIndex = current == null
        ? null
        : book.chapters.toList().lastIndexWhere((chapter) {
            return current.key == chapter.chapterId;
          });
    final totalEpisodes = book.chapters.length;

    return ClipRRect(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(35),
        child: InkWell(
            onTap: () {
              if (currentEpisodeIndex != null) {
                context.push(
                    "/details_comic/${widget.sourceId}/${widget.bookId}/view?chap=${book.chapters.elementAt(currentEpisodeIndex).chapterId}");
              } else {
                context.push(
                    "/details_comic/${widget.sourceId}/${widget.bookId}/view?chap=${book.chapters.last.chapterId}");
              }
            },
            borderRadius: BorderRadius.circular(35),
            child: Stack(
              children: [
                Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .tertiaryFixed
                        .withOpacity(0.3),
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
                  clipBehavior: Clip.hardEdge,
                  child: AnimatedFractionallySizedBox(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    alignment: Alignment.centerLeft,
                    widthFactor: currentEpisodeIndex == null
                        ? 0
                        : (totalEpisodes - currentEpisodeIndex) / totalEpisodes,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .tertiaryFixedDim
                            .withOpacity(0.6),
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
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface, //.withOpacity(0.6),
                        ),
                      ),
                      Text(
                        currentEpisodeIndex == null
                            ? '$totalEpisodes chapters'
                            : '${book.chapters.elementAt(currentEpisodeIndex).name} of $totalEpisodes',
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }

  Widget _buildButtonDownload() {
    return Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color:
              Theme.of(context).colorScheme.tertiaryFixedDim.withOpacity(0.44),
          shape: BoxShape.circle,
        ),
        child: Center(
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  MaterialCommunityIcons.download,
                ),
                iconSize: 48 / 2)));
  }

  Widget _buildSuggest(MetaBook book) {
    if (_suggestFuture == null) return SizedBox.shrink();

    return HorizontalBookList(
        booksFuture: _suggestFuture!.then((value) => value.items),
        // totalItems: _suggestFuture!.then((value) => value.totalItems),
        service: _service,
        title: 'Suggest',
        more: null);
  }

  PopupMenuItem<String> _buildMenuItem(String id, String text) {
    return PopupMenuItem<String>(
      value: id,
      child: Text(text),
    );
  }

  void _handleMenuSelection(BuildContext context, String id) {
    switch (id) {
      case 'download':
        // _downloadContent(context);
        break;
      case 'find_similar':
        context.push(
            '/details_comic/${widget.sourceId}/${widget.bookId}/similar',
            extra: {'book': _book});
        break;
      case 'open_browser':
        IconButtonOpenBrowser.open(_service.getURL(widget.bookId));
        // _openInBrowser(context);
        break;
      case 'create_shortcut':
        // _createShortcut(context);
        break;
    }
  }

  Widget? _buildSheetChapters() {
    if (_book == null) return null;
    return SheetChapters(
      book: _book!,
      sourceId: widget.sourceId,
      bookId: widget.bookId,
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
//             theme.scaffoldBackgroundColor.withOpacity(0.05),
//             theme.scaffoldBackgroundColor,
//           ],
//           stops: const [0, .3],
//         ),
//       ),
//     );
//   }
// }

class _ButtonLike extends StatefulWidget {
  final String bookId;
  final MetaBook book;
  final BaseService service;

  const _ButtonLike(
      {required this.bookId, required this.book, required this.service});

  @override
  createState() => _ButtonLikeState();
}

class _ButtonLikeState extends State<_ButtonLike> {
  bool? _liked;
  int? _likes = 0;

  @override
  void initState() {
    super.initState();
    _likes = widget.book.likes;

    if (widget.service is AuthService) {
      (widget.service as AuthService)
          .isLiked(bookId: widget.bookId)
          .then((liked) {
        setState(() {
          _liked = liked;
        });
      }).catchError((error) {
        if (!widget.service.isCaptchaError(error)) {
          showSnackBar(Text('Error: $error')); // 显示錯誤訊息
        }
      });
    }
  }

  void _onTap() {
    (widget.service as AuthService)
        .setLike(bookId: widget.bookId, value: !(_liked ?? false))
        .then((value) {
      setState(() {
        _liked = value;
        _likes = value ? (widget.book.likes ?? 0) + 1 : widget.book.likes! - 1;
      });
    }).catchError((error) {
      if (!widget.service.isCaptchaError(error)) {
        showSnackBar(Text('Error: $error')); // 显示錯誤訊息
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (widget.service is AuthService) ? _onTap : null,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 4.0, vertical: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                      _liked ?? false
                          ? MaterialCommunityIcons.thumb_up
                          : MaterialCommunityIcons.thumb_up_outline,
                      size: 20.0,
                      color: Colors.blueGrey.shade100),
                  const SizedBox(height: 4.0),
                  Text(
                    _likes != null ? formatNumber(_likes!) : '?',
                    style: TextStyle(
                        fontSize: 14.0, color: Colors.blueGrey.shade100),
                  ),
                ],
              ),
            )));
  }
}

class _AvatarUser extends StatefulWidget {
  final BaseService service;

  const _AvatarUser({required this.service});

  @override
  createState() => _AvatarUserState();
}

class _AvatarUserState extends State<_AvatarUser> {
  late Future<BasicUser> _user;

  @override
  void initState() {
    super.initState();
    _user = getUser(widget.service);
  }

  void _updateUser() {
    setState(() {
      _user = getUser(widget.service);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _user,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Tooltip(
              message: snapshot.data!.fullName,
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Theme.of(context).colorScheme.onSurface,
                child: Image.network(
                  snapshot.data!.photoUrl,
                  fit: BoxFit.cover,
                ),
              ));
        }
        if (snapshot.hasError) {
          return GestureDetector(
            onTap: () async {
              await context.push("/webview/${widget.service.uid}");
              _updateUser();
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
        }

        return const CircularProgressIndicator();
      },
    );
  }
}

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi/core_services/comic/main.dart';
import 'package:hoyomi/env.dart';

part 'main.freezed.dart';
part 'main.g.dart';

class CuuTruyenService extends ABComicService with ComicCommentMixin {
  @override
  bool? get $isAuth => false;
  @override
  final init = ServiceInit(
    name: 'CuuTruyen',
    faviconUrl: OImage.from('https://i.imgur.com/2Vjm3S4.png'),
    rootUrl: 'https://cuutruyen5c844.site',
    fetchHeadless: false,
    fetchBaseUrl: '{BASE_URL}/api/v2/',
  );

  @override
  home() async {
    final all = await Future.wait([
      fetch('home_a'),
      fetch('mangas/top?duration=week&page=1&per_page=24'),
    ]);

    final data = HomeMangaResponse.fromJson(jsonDecode(all[0])['data']);
    final topWeek = MangaListResponse.fromJson(jsonDecode(all[1]));

    return ComicHome(
      carousel: ComicCarousel(
        aspectRatio: 679 / 350,
        maxHeightBuilder: 0.4,
        items:
            data.spotlightMangas
                .map(
                  (item) => ComicCarouselItem(
                    comicId: item.id.toString(),
                    name: item.name,
                    image: OImage.from(item.panoramaUrl),
                    description: item.description,
                  ),
                )
                .toList(),
      ),
      categories: [
        HomeComicCategory(
          items:
              data.newChapterMangas
                  .map(
                    (item) => Comic(
                      comicId: item.id.toString(),
                      name: item.name,
                      image: OImage.from(item.coverUrl),
                      lastChap: ComicChapter(
                        name: 'Chapter ${item.newestChapterNumber}',
                        chapterId: item.newestChapterId.toString(),
                        order: -1,
                      ),
                      lastUpdate: item.newestChapterCreatedAt,
                    ),
                  )
                  .toList(),
          name: 'Mới Cập Nhật',
          categoryId: 'recently_updated',
        ),

        HomeComicCategory(
          name: 'Top nổi bật tuần',
          gridView: true,
          items:
              topWeek.data
                  .map(
                    (item) => Comic(
                      comicId: item.id.toString(),
                      name: item.name,
                      image: OImage.from(item.coverUrl),
                      lastChap: ComicChapter(
                        name: 'Chapter ${item.newestChapterNumber}',
                        chapterId: item.newestChapterId.toString(),
                        order: -1,
                      ),
                      lastUpdate:
                          item.newestChapterCreatedAt != null
                              ? DateTime.parse(item.newestChapterCreatedAt!)
                              : null,
                    ),
                  )
                  .toList(),
        ),
      ],
    );
  }

  @override
  Future<MetaComic> getDetails(String comicId) async {
    final all = await Future.wait([
      fetch('mangas/$comicId'),
      fetch('mangas/$comicId/chapters'),
    ]);
    final data = MangaDetail.fromJson(jsonDecode(all[0])['data']);
    final chapters =
        (jsonDecode(all[1])['data'] as List)
            .map((item) => Chapter.fromJson(item))
            .toList();

    final name = data.name;
    final originalName = data.titles.map((title) => title.name).join(', ');
    final image = OImage.from(data.coverUrl);

    final author = data.author.name;
    final translator = data.team.name;
    final status$ =
        // _getInfoTale(tales, 'Trạng Thái:')?.textRaw()?.toLowerCase() ??
        'Unknown';
    final status =
        status$ == 'đang cập nhật'
            ? StatusEnum.ongoing
            : status$ == 'unknown'
            ? StatusEnum.unknown
            : StatusEnum.completed;
    final views = data.viewsCount;
    // final likes = int.tryParse(
    //   _getInfoTale(tales, 'Theo Dõi:')?.textRaw()?.replaceAll(',', '') ?? '',
    // );

    // final rate$ =
    //     JsonDecoder().convert(
    //           $(
    //                 'script[type=\'application/ld+json\']',
    //                 single: true,
    //               ).textRaw() ??
    //               '{}',
    //         )
    //         as Map<String, dynamic>;

    // final rate =
    //     rate$.containsKey('aggregateRating')
    //         ? RateValue(
    //           best: int.parse('${rate$['aggregateRating']['bestRating']}'),
    //           count: int.parse(rate$['aggregateRating']['ratingCount']),
    //           value: double.parse(rate$['aggregateRating']['ratingValue']),
    //         )
    //         : null;

    final genres =
        data.tags
            .map((tag) => Genre(name: tag.name, genreId: 'tag_${tag.slug}'))
            .toList();
    final description = data.fullDescription ?? data.description;
    final chaps =
        chapters
            .map(
              (chapter) => ComicChapter(
                name: 'Chapter ${chapter.number}',
                fullName: chapter.name,
                order: chapter.order,
                chapterId: chapter.id.toString(),
                extra: chapter.id.toString(),
              ),
            )
            .toList();

    final lastModified = chapters.fold(
      chapters.first.updatedAt,
      (prev, chapter) =>
          prev.isBefore(chapter.updatedAt) ? chapter.updatedAt : prev,
    );

    return MetaComic(
      name: name,
      originalName: originalName,
      image: image,
      author: author,
      translator: translator,
      status: status,
      views: views,
      // likes: likes,
      // rate: rate,
      genres: genres.toList(),
      description: description,
      chapters: chaps.toList(),
      lastModified: lastModified,
    );
  }

  @override
  getComicModes(comic) {
    if (comic.genres.any(
      (genre) => genre.name == 'manga' || genre.name == 'anime',
    )) {
      return ComicModes.rightToLeft;
    }

    return ComicModes.webToon;
  }

  @override
  Future<List<OImage>> getPages(String manga, String chap) async {
    final data = ChapterResponse.fromJson(
      jsonDecode(await fetch('chapters/$chap'))['data'],
    );

    return data.pages.map((page) {
      return OImage(src: page.imageUrl, extra: page.drmData);
    }).toList();
  }

  @override
  fetchPage(buffer, source) async {
    return _decodeAndBuildImage(buffer, source.extra!);
  }

  @override
  getSuggest(comic, {page = 1}) async {
    return (await getCategory(
      categoryId: comic.genres.first.genreId,
      page: page!,
      filters: {},
    )).items;
  }

  @override
  search({
    required keyword,
    required page,
    required filters,
    required quick,
  }) async {
    final data = SearchResultResponse.fromJson(
      jsonDecode(
        await fetch('mangas/search?q=$keyword&page=$page&per_page=30'),
      ),
    );

    final items =
        data.data
            .map(
              (item) => Comic(
                comicId: item.id.toString(),
                name: item.name,
                image: OImage.from(item.coverUrl),
                lastChap: ComicChapter(
                  name: 'Chapter ${item.newestChapterNumber}',
                  chapterId: item.newestChapterId.toString(),
                  order: -1,
                ),
                lastUpdate: item.newestChapterCreatedAt,
              ),
            )
            .toList();

    final maxPage = data.meta.totalPages;

    return ComicCategory(
      name: '',
      url: '$baseUrl/search/$keyword',
      items: items,
      page: page,
      totalItems: data.meta.perPage * maxPage,
      totalPages: maxPage,
    );
  }

  @override
  getCategory({required categoryId, required page, required filters}) async {
    final dataRaw = jsonDecode(
      await fetch(
        '${categoryId.replaceFirst('tag_', 'tags/').replaceFirst('recently_updated', 'mangas/recently_updated')}?page=$page&per_page=30',
      ),
    );

    final data = MangaTagResponse.fromJson(
      categoryId.contains('recently_updated')
          ? {
            'data': {
              'mangas': dataRaw['data'],
              'tag': <String, dynamic>{
                'name': 'Mới cập nhật',
                'slug': 'newest',
                'tagging_count': -1,
              },
            },
            '_metadata': dataRaw['_metadata'],
          }
          : dataRaw,
    );

    return ComicCategory(
      name: data.data.tag.name,
      url: '$baseUrl/${categoryId.replaceAll(r'_', '/')}',
      items:
          data.data.mangas
              .map(
                (manga) => Comic(
                  comicId: manga.id.toString(),
                  name: manga.name,
                  image: OImage.from(manga.coverUrl!),
                ),
              )
              .toList(),
      page: page,
      totalItems: data.metadata.perPage * data.metadata.totalPages,
      totalPages: data.metadata.totalPages,
      filters: const <Filter>[],
    );
  }

  @override
  getURL(String comicId, {String? chapterId}) async {
    if (chapterId == null) return '$baseUrl/mangas/$comicId';
    return '$baseUrl/mangas/$comicId/chapters/$chapterId';
  }

  @override
  Future<void> deleteComment(context, {required comment}) {
    // TODO: implement deleteComment
    throw UnimplementedError();
  }

  @override
  Future<ComicComments> getComments(context, {page = 1}) async {
    final data = CommentsResponse.fromJson(
      jsonDecode(
        await fetch(
          'chapters/${context.chapter?.extra! ?? context.metaComic.chapters.sortAsc.first.extra}/comments',
        ),
      ),
    );

    final parentMap = <String, String>{};
    for (final comment in data.data) {
      for (final repliedId in comment.repliedIds) {
        parentMap[repliedId.toString()] = comment.id.toString();
      }
    }

    final mapRawComments = Map.fromEntries(
      data.data.map((c) => MapEntry(c.id.toString(), c)),
    );
    final mapComments = Map.fromEntries(
      mapRawComments.entries.map(
        (entry) => MapEntry(
          entry.key,
          ComicComment(
            id: entry.value.id.toString(),
            userId: entry.value.user.id.toString(),
            photoUrl: null,
            name:
                entry.value.user.teams.firstOrNull != null
                    ? 'Team ${entry.value.user.teams.firstOrNull['name']}'
                    : entry.value.user.username,
            content: entry.value.processedContent,
            timeAgo: entry.value.createdAt,
            countReply: 0,
          ),
        ),
      ),
    );

    final repliesByRootId = <String, List<ComicComment>>{};
    final rootComments = <ComicComment>[];

    for (final comment in data.data) {
      final commentId = comment.id.toString();
      final parentId = parentMap[commentId];

      if (parentId == null) {
        rootComments.add(mapComments[commentId]!);
        continue;
      }

      String rootId = parentId;
      while (parentMap[rootId] != null) {
        rootId = parentMap[rootId]!;
      }

      final isDeepReply = parentId != rootId;
      final originalParent = mapRawComments[parentId];

      final modified =
          isDeepReply
              ? mapComments[commentId]!.copyWith(
                content:
                    "@${originalParent?.user.username ?? 'unknown'} ${mapComments[commentId]!.content}",
              )
              : mapComments[commentId]!;

      repliesByRootId.putIfAbsent(rootId, () => []).add(modified);
    }

    // Gán replies vào root comment
    final result =
        rootComments.map((root) {
          return root.copyWith(replies: repliesByRootId[root.id] ?? []);
        }).toList();

    return ComicComments(
      items: result,
      page: 1,
      totalItems: data.data.length,
      totalPages: 1,
    );
  }
}

/// ==============================================

@freezed
sealed class HomeMangaResponse with _$HomeMangaResponse {
  factory HomeMangaResponse({
    @JsonKey(name: 'spotlight_mangas')
    required List<_SpotlightManga> spotlightMangas,
    @JsonKey(name: 'new_chapter_mangas')
    required List<_NewChapterManga> newChapterMangas,
  }) = _HomeMangaResponse;

  factory HomeMangaResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeMangaResponseFromJson(json);
}

/// ピックアップ漫画（スポットライト漫画）
@freezed
sealed class SpotlightManga with _$SpotlightManga {
  const factory SpotlightManga({
    required int id,
    required String name,
    @JsonKey(name: 'panorama_url') required String panoramaUrl,
    @JsonKey(name: 'panorama_mobile_url') required String panoramaMobileUrl,
    @JsonKey(name: 'panorama_dominant_color') String? panoramaDominantColor,
    @JsonKey(name: 'panorama_dominant_color2') String? panoramaDominantColor2,
    required String description,
  }) = _SpotlightManga;

  factory SpotlightManga.fromJson(Map<String, dynamic> json) =>
      _$SpotlightMangaFromJson(json);
}

/// 新着チャプター付きの漫画
@freezed
sealed class NewChapterManga with _$NewChapterManga {
  const factory NewChapterManga({
    required int id,
    required String name,
    @JsonKey(name: 'cover_url') required String coverUrl,
    @JsonKey(name: 'cover_mobile_url') required String coverMobileUrl,
    @JsonKey(name: 'newest_chapter_number') required String newestChapterNumber,
    @JsonKey(name: 'newest_chapter_id') required int newestChapterId,
    @JsonKey(name: 'newest_chapter_created_at')
    required DateTime newestChapterCreatedAt,
  }) = _NewChapterManga;

  factory NewChapterManga.fromJson(Map<String, dynamic> json) =>
      _$NewChapterMangaFromJson(json);
}

@freezed
sealed class MangaListResponse with _$MangaListResponse {
  /// MangaListResponseのファクトリーコンストラクタ
  const factory MangaListResponse({required List<MangaItem> data}) =
      _MangaListResponse;

  /// JSONからMangaListResponseを生成する
  factory MangaListResponse.fromJson(Map<String, dynamic> json) =>
      _$MangaListResponseFromJson(json);
}

@freezed
sealed class MangaItem with _$MangaItem {
  /// MangaItemのファクトリーコンストラクタ
  const factory MangaItem({
    required int id,
    required String name,
    @JsonKey(name: 'cover_url') required String coverUrl,
    @JsonKey(name: 'cover_mobile_url') required String coverMobileUrl,
    @JsonKey(name: 'newest_chapter_number')
    required String? newestChapterNumber,
    @JsonKey(name: 'newest_chapter_id') required int? newestChapterId,
    @JsonKey(name: 'newest_chapter_created_at')
    required String? newestChapterCreatedAt,
    @JsonKey(name: 'views_count') required int viewsCount,
    @JsonKey(name: 'views_count_week') required int viewsCountWeek,
    @JsonKey(name: 'views_count_month') required int viewsCountMonth,
  }) = _MangaItem;

  /// JSONからMangaItemを生成する
  factory MangaItem.fromJson(Map<String, dynamic> json) =>
      _$MangaItemFromJson(json);
}

/// マンガの詳細情報
/// Manga detail information
@freezed
sealed class MangaDetail with _$MangaDetail {
  const factory MangaDetail({
    required int id, // マンガID / Manga ID
    required String name, // タイトル名 / Title name
    @JsonKey(name: 'cover_url')
    required String coverUrl, // 表紙URL（PC）/ Cover image URL (PC)
    @JsonKey(name: 'cover_mobile_url')
    required String coverMobileUrl, // 表紙URL（モバイル）/ Cover image URL (Mobile)
    @JsonKey(name: 'panorama_url')
    required String panoramaUrl, // パノラマURL（PC）/ Panorama URL (PC)
    @JsonKey(name: 'panorama_mobile_url')
    required String panoramaMobileUrl, // パノラマURL（モバイル）/ Panorama URL (Mobile)
    @JsonKey(name: 'newest_chapter_number')
    required String? newestChapterNumber, // 最新チャプター番号 / Latest chapter number
    @JsonKey(name: 'newest_chapter_id')
    required int? newestChapterId, // 最新チャプターID / Latest chapter ID
    @JsonKey(name: 'newest_chapter_created_at')
    required DateTime?
    newestChapterCreatedAt, // 最新チャプター作成日時 / Latest chapter creation datetime
    required Author author, // 作者情報 / Author info
    required String description, // 簡単な説明 / Short description
    @JsonKey(name: 'full_description')
    String? fullDescription, // 詳細説明 / Full description
    @JsonKey(name: 'official_url')
    required String officialUrl, // 公式URL / Official URL
    @JsonKey(name: 'is_region_limited')
    required bool isRegionLimited, // 地域制限あり？/ Region limited?
    @JsonKey(name: 'is_ads') required bool isAds, // 広告あり？/ Has advertisement?
    @JsonKey(name: 'chapters_count')
    required int chaptersCount, // チャプター数 / Number of chapters
    @JsonKey(name: 'views_count')
    required int viewsCount, // 閲覧数 / Number of views
    @JsonKey(name: 'is_nsfw') required bool isNsfw, // NSFW？/ Is NSFW?
    required List<Tag> tags, // タグリスト / List of tags
    required Team team, // 翻訳チーム情報 / Translation team info
    @JsonKey(name: 'is_following')
    required bool isFollowing, // フォロー済み？/ Is following?
    required List<Title> titles, // 別名タイトルリスト / List of alternative titles
    @JsonKey(name: 'created_at')
    required DateTime createdAt, // 作成日 / Created date
    @JsonKey(name: 'updated_at')
    required DateTime updatedAt, // 更新日 / Updated date
  }) = _MangaDetail;

  factory MangaDetail.fromJson(Map<String, dynamic> json) =>
      _$MangaDetailFromJson(json);
}

/// 作者情報
/// Author info
@freezed
sealed class Author with _$Author {
  const factory Author({
    required String name, // 作者名 / Author name
  }) = _Author;

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);
}

/// タグ情報
/// Tag info
@freezed
sealed class Tag with _$Tag {
  const factory Tag({
    required String name, // タグ名 / Tag name
    required String slug, // タグのスラッグ / Tag slug
    @JsonKey(name: 'tagging_count')
    required int taggingCount, // タグ付け数 / Number of taggings
  }) = _Tag;

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
}

/// 翻訳チーム情報
/// Translation team info
@freezed
sealed class Team with _$Team {
  const factory Team({
    required int id, // チームID / Team ID
    required String name, // チーム名 / Team name
    String? description, // 説明 / Description
    @JsonKey(name: 'is_ads') bool? isAds, // 広告あり？/ Has advertisement?
    @JsonKey(name: 'facebook_address')
    String? facebookAddress, // Facebookアドレス / Facebook address
    @JsonKey(name: 'views_count')
    int? viewsCount, // チームの閲覧数 / Views count for team
    @JsonKey(name: 'translations_count')
    int? translationsCount, // 翻訳数 / Number of translations
    @JsonKey(name: 'mangas_count') int? mangasCount,
    @JsonKey(name: 'created_at') DateTime? createdAt, // 作成日 / Created date
    @JsonKey(name: 'updated_at') DateTime? updatedAt, // 更新日 / Updated date
  }) = _Team;

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);
}

/// タイトル情報
/// Title info
@freezed
sealed class Title with _$Title {
  const factory Title({
    required int id, // タイトルID / Title ID
    required String name, // 名前 / Name
    required bool primary, // メインタイトル？/ Is primary title?
  }) = _Title;

  factory Title.fromJson(Map<String, dynamic> json) => _$TitleFromJson(json);
}

/// チャプター情報
/// Chapter information
@freezed
sealed class Chapter with _$Chapter {
  const factory Chapter({
    required int id, // チャプターID / Chapter ID
    required int order, // 表示順序 / Display order
    required String number, // チャプター番号 / Chapter number
    required String? name, // チャプター名 / Chapter name
    @JsonKey(name: 'views_count')
    required int viewsCount, // 閲覧数 / Number of views
    @JsonKey(name: 'comments_count')
    required int commentsCount, // コメント数 / Number of comments
    required String status, // ステータス / Status (例: "processed")
    @JsonKey(name: 'created_at')
    required DateTime createdAt, // 作成日時 / Created date
    @JsonKey(name: 'updated_at')
    required DateTime updatedAt, // 更新日時 / Updated date
  }) = _Chapter;

  factory Chapter.fromJson(Map<String, dynamic> json) =>
      _$ChapterFromJson(json);
}

@freezed
sealed class ChaptersResponse with _$ChaptersResponse {
  const factory ChaptersResponse({
    required List<Chapter> data, // チャプターリスト / List of chapters
  }) = _ChaptersResponse;

  factory ChaptersResponse.fromJson(Map<String, dynamic> json) =>
      _$ChaptersResponseFromJson(json);
}

@freezed
sealed class ChapterResponse with _$ChapterResponse {
  const factory ChapterResponse({
    required int id,
    required int order,
    required String number,
    required String? name,
    @JsonKey(name: 'views_count') required int viewsCount,
    @JsonKey(name: 'comments_count') required int commentsCount,
    required String status,
    @JsonKey(name: 'previous_chapter_id') int? previousChapterId,
    @JsonKey(name: 'previous_chapter_number') String? previousChapterNumber,
    @JsonKey(name: 'previous_chapter_name') String? previousChapterName,
    @JsonKey(name: 'next_chapter_id') int? nextChapterId,
    @JsonKey(name: 'next_chapter_number') String? nextChapterNumber,
    @JsonKey(name: 'next_chapter_name') String? nextChapterName,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    required Manga manga,
    required Team team,
    required List<Page> pages,
  }) = _ChapterResponse;

  factory ChapterResponse.fromJson(Map<String, dynamic> json) =>
      _$ChapterResponseFromJson(json);
}

/// マンガ情報
@freezed
sealed class Manga with _$Manga {
  const factory Manga({
    required int id,
    required String name,
    String? description,
    @JsonKey(name: 'cover_url') String? coverUrl,
    @JsonKey(name: 'panorama_url') String? panoramaUrl,
    bool? marginless,
    @JsonKey(name: 'is_region_limited') bool? isRegionLimited,
    String? direction,
    @JsonKey(name: 'is_nsfw') bool? isNsfw,

    @JsonKey(name: 'author_name') String? authorName,
    @JsonKey(name: 'cover_mobile_url') String? coverMobileUrl,
    @JsonKey(name: 'newest_chapter_number') String? newestChapterNumber,
    @JsonKey(name: 'newest_chapter_id') int? newestChapterId,
    @JsonKey(name: 'newest_chapter_created_at') String? newestChapterCreatedAt,
  }) = _Manga;

  factory Manga.fromJson(Map<String, dynamic> json) => _$MangaFromJson(json);
}

/// ページ情報
@freezed
sealed class Page with _$Page {
  const factory Page({
    required int id,
    required int order,
    required int width,
    required int height,
    required String status,
    @JsonKey(name: 'image_url') required String imageUrl,
    @JsonKey(name: 'image_path') required String imagePath,
    @JsonKey(name: 'image_url_size') int? imageUrlSize,
    @JsonKey(name: 'drm_data') String? drmData,
  }) = _Page;

  factory Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);
}

// sealed class で定義するデータモデル
@freezed
sealed class SearchResultManga with _$SearchResultManga {
  const factory SearchResultManga({
    required int id,
    required String name,
    @JsonKey(name: 'author_name') required String authorName,
    @JsonKey(name: 'cover_url') required String coverUrl,
    @JsonKey(name: 'cover_mobile_url') required String coverMobileUrl,
    @JsonKey(name: 'newest_chapter_number')
    required String? newestChapterNumber,
    @JsonKey(name: 'newest_chapter_id') required int? newestChapterId,
    @JsonKey(name: 'newest_chapter_created_at')
    required DateTime? newestChapterCreatedAt,
  }) = _SearchResultManga;

  factory SearchResultManga.fromJson(Map<String, dynamic> json) =>
      _$SearchResultMangaFromJson(json);
}

// 検索結果のメタデータモデル
@freezed
sealed class Metadata with _$Metadata {
  const factory Metadata({
    @JsonKey(name: 'total_count') required int totalCount,
    @JsonKey(name: 'total_pages') required int totalPages,
    @JsonKey(name: 'current_page') required int currentPage,
    @JsonKey(name: 'per_page') required int perPage,
  }) = _Metadata;

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);
}

// 検索結果全体（リスト + メタデータ）
@freezed
sealed class SearchResultResponse with _$SearchResultResponse {
  const factory SearchResultResponse({
    @JsonKey(name: 'data') required List<SearchResultManga> data,
    @JsonKey(name: '_metadata') required Metadata meta,
  }) = _SearchResultResponse;

  factory SearchResultResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResultResponseFromJson(json);
}

@freezed
sealed class MangaTagResponse with _$MangaTagResponse {
  const factory MangaTagResponse({
    required MangaListData data,
    @JsonKey(name: '_metadata') required Metadata metadata,
  }) = _MangaTagResponse;

  factory MangaTagResponse.fromJson(Map<String, dynamic> json) =>
      _$MangaTagResponseFromJson(json);
}

@freezed
sealed class MangaListData with _$MangaListData {
  const factory MangaListData({required List<Manga> mangas, required Tag tag}) =
      _MangaListData;

  factory MangaListData.fromJson(Map<String, dynamic> json) =>
      _$MangaListDataFromJson(json);
}

/// =============== utils ===================
// XOR decode
Uint8List _decodeXor(Uint8List data, String key) {
  final keyBytes = utf8.encode(key);
  final result = Uint8List(data.length);
  for (int i = 0; i < data.length; i++) {
    result[i] = data[i] ^ keyBytes[i % keyBytes.length];
  }
  return result;
}

// Decode DRM string
Future<List<RowBlock>> _decodeDrm(
  String drmBase64,
  String decryptionKey,
) async {
  final drmBytes = base64.decode(drmBase64.replaceAll('\n', ''));
  final decrypted = _decodeXor(drmBytes, decryptionKey);
  final decodedStr = utf8.decode(decrypted);

  if (!decodedStr.startsWith('#v4|')) {
    throw Exception('Invalid DRM format');
  }

  final parts = decodedStr.split('|').sublist(1);
  final blocks = <RowBlock>[];

  for (final part in parts) {
    final values = part.split('-');
    blocks.add(
      RowBlock(dy: int.parse(values[0]), height: int.parse(values[1])),
    );
  }

  return blocks;
}

// Main function to call
final _encryptedKey = Env.niceTruyenKey;
Future<Uint8List> _decodeAndBuildImage(Uint8List buffer, String drmData) async {
  final key = utf8.decode(
    base64.decode('${_encryptedKey.substring(0, _encryptedKey.length - 2)}=='),
  );

  final blocks = await _decodeDrm(drmData.trim(), key);
  return unscrambleImageRows(imageData: buffer, blocks: blocks, autoTrim: false);
}

@freezed
sealed class Comment with _$Comment {
  const factory Comment({
    required int id,
    required CommentUser user,
    @JsonKey(name: 'processed_content') required String processedContent,
    @JsonKey(name: 'is_shadow_removed') required bool isShadowRemoved,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'replied_ids') required List<int> repliedIds,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}

@freezed
sealed class CommentUser with _$CommentUser {
  const factory CommentUser({
    required int id,
    required String username,
    required List<dynamic> teams,
    required String level,
  }) = _CommentUser;

  factory CommentUser.fromJson(Map<String, dynamic> json) =>
      _$CommentUserFromJson(json);
}

@freezed
sealed class CommentsResponse with _$CommentsResponse {
  const factory CommentsResponse({
    required List<Comment> data,
    int? total,
    int? page,
    @JsonKey(name: 'page_size') int? pageSize,
  }) = _CommentsResponse;

  factory CommentsResponse.fromJson(Map<String, dynamic> json) =>
      _$CommentsResponseFromJson(json);
}

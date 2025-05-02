// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HomeMangaResponse _$HomeMangaResponseFromJson(Map<String, dynamic> json) =>
    _HomeMangaResponse(
      spotlightMangas:
          (json['spotlight_mangas'] as List<dynamic>)
              .map((e) => _SpotlightManga.fromJson(e as Map<String, dynamic>))
              .toList(),
      newChapterMangas:
          (json['new_chapter_mangas'] as List<dynamic>)
              .map((e) => _NewChapterManga.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$HomeMangaResponseToJson(_HomeMangaResponse instance) =>
    <String, dynamic>{
      'spotlight_mangas': instance.spotlightMangas,
      'new_chapter_mangas': instance.newChapterMangas,
    };

_SpotlightManga _$SpotlightMangaFromJson(Map<String, dynamic> json) =>
    _SpotlightManga(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      panoramaUrl: json['panorama_url'] as String,
      panoramaMobileUrl: json['panorama_mobile_url'] as String,
      panoramaDominantColor: json['panorama_dominant_color'] as String?,
      panoramaDominantColor2: json['panorama_dominant_color2'] as String?,
      description: json['description'] as String,
    );

Map<String, dynamic> _$SpotlightMangaToJson(_SpotlightManga instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'panorama_url': instance.panoramaUrl,
      'panorama_mobile_url': instance.panoramaMobileUrl,
      'panorama_dominant_color': instance.panoramaDominantColor,
      'panorama_dominant_color2': instance.panoramaDominantColor2,
      'description': instance.description,
    };

_NewChapterManga _$NewChapterMangaFromJson(Map<String, dynamic> json) =>
    _NewChapterManga(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      coverUrl: json['cover_url'] as String,
      coverMobileUrl: json['cover_mobile_url'] as String,
      newestChapterNumber: json['newest_chapter_number'] as String,
      newestChapterId: (json['newest_chapter_id'] as num).toInt(),
      newestChapterCreatedAt: DateTime.parse(
        json['newest_chapter_created_at'] as String,
      ),
    );

Map<String, dynamic> _$NewChapterMangaToJson(_NewChapterManga instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cover_url': instance.coverUrl,
      'cover_mobile_url': instance.coverMobileUrl,
      'newest_chapter_number': instance.newestChapterNumber,
      'newest_chapter_id': instance.newestChapterId,
      'newest_chapter_created_at':
          instance.newestChapterCreatedAt.toIso8601String(),
    };

_MangaListResponse _$MangaListResponseFromJson(Map<String, dynamic> json) =>
    _MangaListResponse(
      data:
          (json['data'] as List<dynamic>)
              .map((e) => MangaItem.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$MangaListResponseToJson(_MangaListResponse instance) =>
    <String, dynamic>{'data': instance.data};

_MangaItem _$MangaItemFromJson(Map<String, dynamic> json) => _MangaItem(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  coverUrl: json['cover_url'] as String,
  coverMobileUrl: json['cover_mobile_url'] as String,
  newestChapterNumber: json['newest_chapter_number'] as String,
  newestChapterId: (json['newest_chapter_id'] as num).toInt(),
  newestChapterCreatedAt: json['newest_chapter_created_at'] as String,
  viewsCount: (json['views_count'] as num).toInt(),
  viewsCountWeek: (json['views_count_week'] as num).toInt(),
  viewsCountMonth: (json['views_count_month'] as num).toInt(),
);

Map<String, dynamic> _$MangaItemToJson(_MangaItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cover_url': instance.coverUrl,
      'cover_mobile_url': instance.coverMobileUrl,
      'newest_chapter_number': instance.newestChapterNumber,
      'newest_chapter_id': instance.newestChapterId,
      'newest_chapter_created_at': instance.newestChapterCreatedAt,
      'views_count': instance.viewsCount,
      'views_count_week': instance.viewsCountWeek,
      'views_count_month': instance.viewsCountMonth,
    };

_MangaDetail _$MangaDetailFromJson(Map<String, dynamic> json) => _MangaDetail(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  coverUrl: json['cover_url'] as String,
  coverMobileUrl: json['cover_mobile_url'] as String,
  panoramaUrl: json['panorama_url'] as String,
  panoramaMobileUrl: json['panorama_mobile_url'] as String,
  newestChapterNumber: json['newest_chapter_number'] as String,
  newestChapterId: (json['newest_chapter_id'] as num).toInt(),
  newestChapterCreatedAt: DateTime.parse(
    json['newest_chapter_created_at'] as String,
  ),
  author: Author.fromJson(json['author'] as Map<String, dynamic>),
  description: json['description'] as String,
  fullDescription: json['full_description'] as String?,
  officialUrl: json['official_url'] as String,
  isRegionLimited: json['is_region_limited'] as bool,
  isAds: json['is_ads'] as bool,
  chaptersCount: (json['chapters_count'] as num).toInt(),
  viewsCount: (json['views_count'] as num).toInt(),
  isNsfw: json['is_nsfw'] as bool,
  tags:
      (json['tags'] as List<dynamic>)
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
  team: Team.fromJson(json['team'] as Map<String, dynamic>),
  isFollowing: json['is_following'] as bool,
  titles:
      (json['titles'] as List<dynamic>)
          .map((e) => Title.fromJson(e as Map<String, dynamic>))
          .toList(),
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$MangaDetailToJson(_MangaDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cover_url': instance.coverUrl,
      'cover_mobile_url': instance.coverMobileUrl,
      'panorama_url': instance.panoramaUrl,
      'panorama_mobile_url': instance.panoramaMobileUrl,
      'newest_chapter_number': instance.newestChapterNumber,
      'newest_chapter_id': instance.newestChapterId,
      'newest_chapter_created_at':
          instance.newestChapterCreatedAt.toIso8601String(),
      'author': instance.author,
      'description': instance.description,
      'full_description': instance.fullDescription,
      'official_url': instance.officialUrl,
      'is_region_limited': instance.isRegionLimited,
      'is_ads': instance.isAds,
      'chapters_count': instance.chaptersCount,
      'views_count': instance.viewsCount,
      'is_nsfw': instance.isNsfw,
      'tags': instance.tags,
      'team': instance.team,
      'is_following': instance.isFollowing,
      'titles': instance.titles,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

_Author _$AuthorFromJson(Map<String, dynamic> json) =>
    _Author(name: json['name'] as String);

Map<String, dynamic> _$AuthorToJson(_Author instance) => <String, dynamic>{
  'name': instance.name,
};

_Tag _$TagFromJson(Map<String, dynamic> json) => _Tag(
  name: json['name'] as String,
  slug: json['slug'] as String,
  taggingCount: (json['tagging_count'] as num).toInt(),
);

Map<String, dynamic> _$TagToJson(_Tag instance) => <String, dynamic>{
  'name': instance.name,
  'slug': instance.slug,
  'tagging_count': instance.taggingCount,
};

_Team _$TeamFromJson(Map<String, dynamic> json) => _Team(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String?,
  isAds: json['is_ads'] as bool?,
  facebookAddress: json['facebook_address'] as String?,
  viewsCount: (json['views_count'] as num?)?.toInt(),
  translationsCount: (json['translations_count'] as num?)?.toInt(),
  mangasCount: (json['mangas_count'] as num?)?.toInt(),
  createdAt:
      json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
  updatedAt:
      json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$TeamToJson(_Team instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'is_ads': instance.isAds,
  'facebook_address': instance.facebookAddress,
  'views_count': instance.viewsCount,
  'translations_count': instance.translationsCount,
  'mangas_count': instance.mangasCount,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};

_Title _$TitleFromJson(Map<String, dynamic> json) => _Title(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  primary: json['primary'] as bool,
);

Map<String, dynamic> _$TitleToJson(_Title instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'primary': instance.primary,
};

_Chapter _$ChapterFromJson(Map<String, dynamic> json) => _Chapter(
  id: (json['id'] as num).toInt(),
  order: (json['order'] as num).toInt(),
  number: json['number'] as String,
  name: json['name'] as String?,
  viewsCount: (json['views_count'] as num).toInt(),
  commentsCount: (json['comments_count'] as num).toInt(),
  status: json['status'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$ChapterToJson(_Chapter instance) => <String, dynamic>{
  'id': instance.id,
  'order': instance.order,
  'number': instance.number,
  'name': instance.name,
  'views_count': instance.viewsCount,
  'comments_count': instance.commentsCount,
  'status': instance.status,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};

_ChaptersResponse _$ChaptersResponseFromJson(Map<String, dynamic> json) =>
    _ChaptersResponse(
      data:
          (json['data'] as List<dynamic>)
              .map((e) => Chapter.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$ChaptersResponseToJson(_ChaptersResponse instance) =>
    <String, dynamic>{'data': instance.data};

_ChapterResponse _$ChapterResponseFromJson(Map<String, dynamic> json) =>
    _ChapterResponse(
      id: (json['id'] as num).toInt(),
      order: (json['order'] as num).toInt(),
      number: json['number'] as String,
      name: json['name'] as String?,
      viewsCount: (json['views_count'] as num).toInt(),
      commentsCount: (json['comments_count'] as num).toInt(),
      status: json['status'] as String,
      previousChapterId: (json['previous_chapter_id'] as num?)?.toInt(),
      previousChapterNumber: json['previous_chapter_number'] as String?,
      previousChapterName: json['previous_chapter_name'] as String?,
      nextChapterId: (json['next_chapter_id'] as num?)?.toInt(),
      nextChapterNumber: json['next_chapter_number'] as String?,
      nextChapterName: json['next_chapter_name'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      manga: Manga.fromJson(json['manga'] as Map<String, dynamic>),
      team: Team.fromJson(json['team'] as Map<String, dynamic>),
      pages:
          (json['pages'] as List<dynamic>)
              .map((e) => Page.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$ChapterResponseToJson(_ChapterResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'number': instance.number,
      'name': instance.name,
      'views_count': instance.viewsCount,
      'comments_count': instance.commentsCount,
      'status': instance.status,
      'previous_chapter_id': instance.previousChapterId,
      'previous_chapter_number': instance.previousChapterNumber,
      'previous_chapter_name': instance.previousChapterName,
      'next_chapter_id': instance.nextChapterId,
      'next_chapter_number': instance.nextChapterNumber,
      'next_chapter_name': instance.nextChapterName,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'manga': instance.manga,
      'team': instance.team,
      'pages': instance.pages,
    };

_Manga _$MangaFromJson(Map<String, dynamic> json) => _Manga(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String?,
  coverUrl: json['cover_url'] as String?,
  panoramaUrl: json['panorama_url'] as String?,
  marginless: json['marginless'] as bool?,
  isRegionLimited: json['is_region_limited'] as bool?,
  direction: json['direction'] as String?,
  isNsfw: json['is_nsfw'] as bool?,
  authorName: json['author_name'] as String?,
  coverMobileUrl: json['cover_mobile_url'] as String?,
  newestChapterNumber: json['newest_chapter_number'] as String?,
  newestChapterId: (json['newest_chapter_id'] as num?)?.toInt(),
  newestChapterCreatedAt: json['newest_chapter_created_at'] as String?,
);

Map<String, dynamic> _$MangaToJson(_Manga instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'cover_url': instance.coverUrl,
  'panorama_url': instance.panoramaUrl,
  'marginless': instance.marginless,
  'is_region_limited': instance.isRegionLimited,
  'direction': instance.direction,
  'is_nsfw': instance.isNsfw,
  'author_name': instance.authorName,
  'cover_mobile_url': instance.coverMobileUrl,
  'newest_chapter_number': instance.newestChapterNumber,
  'newest_chapter_id': instance.newestChapterId,
  'newest_chapter_created_at': instance.newestChapterCreatedAt,
};

_Page _$PageFromJson(Map<String, dynamic> json) => _Page(
  id: (json['id'] as num).toInt(),
  order: (json['order'] as num).toInt(),
  width: (json['width'] as num).toInt(),
  height: (json['height'] as num).toInt(),
  status: json['status'] as String,
  imageUrl: json['image_url'] as String,
  imagePath: json['image_path'] as String,
  imageUrlSize: (json['image_url_size'] as num?)?.toInt(),
  drmData: json['drm_data'] as String?,
);

Map<String, dynamic> _$PageToJson(_Page instance) => <String, dynamic>{
  'id': instance.id,
  'order': instance.order,
  'width': instance.width,
  'height': instance.height,
  'status': instance.status,
  'image_url': instance.imageUrl,
  'image_path': instance.imagePath,
  'image_url_size': instance.imageUrlSize,
  'drm_data': instance.drmData,
};

_SearchResultManga _$SearchResultMangaFromJson(Map<String, dynamic> json) =>
    _SearchResultManga(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      authorName: json['author_name'] as String,
      coverUrl: json['cover_url'] as String,
      coverMobileUrl: json['cover_mobile_url'] as String,
      newestChapterNumber: json['newest_chapter_number'] as String,
      newestChapterId: (json['newest_chapter_id'] as num).toInt(),
      newestChapterCreatedAt: DateTime.parse(
        json['newest_chapter_created_at'] as String,
      ),
    );

Map<String, dynamic> _$SearchResultMangaToJson(_SearchResultManga instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'author_name': instance.authorName,
      'cover_url': instance.coverUrl,
      'cover_mobile_url': instance.coverMobileUrl,
      'newest_chapter_number': instance.newestChapterNumber,
      'newest_chapter_id': instance.newestChapterId,
      'newest_chapter_created_at':
          instance.newestChapterCreatedAt.toIso8601String(),
    };

_Metadata _$MetadataFromJson(Map<String, dynamic> json) => _Metadata(
  totalCount: (json['total_count'] as num).toInt(),
  totalPages: (json['total_pages'] as num).toInt(),
  currentPage: (json['current_page'] as num).toInt(),
  perPage: (json['per_page'] as num).toInt(),
);

Map<String, dynamic> _$MetadataToJson(_Metadata instance) => <String, dynamic>{
  'total_count': instance.totalCount,
  'total_pages': instance.totalPages,
  'current_page': instance.currentPage,
  'per_page': instance.perPage,
};

_SearchResultResponse _$SearchResultResponseFromJson(
  Map<String, dynamic> json,
) => _SearchResultResponse(
  data:
      (json['data'] as List<dynamic>)
          .map((e) => SearchResultManga.fromJson(e as Map<String, dynamic>))
          .toList(),
  meta: Metadata.fromJson(json['_metadata'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SearchResultResponseToJson(
  _SearchResultResponse instance,
) => <String, dynamic>{'data': instance.data, '_metadata': instance.meta};

_MangaTagResponse _$MangaTagResponseFromJson(Map<String, dynamic> json) =>
    _MangaTagResponse(
      data: MangaListData.fromJson(json['data'] as Map<String, dynamic>),
      metadata: Metadata.fromJson(json['_metadata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MangaTagResponseToJson(_MangaTagResponse instance) =>
    <String, dynamic>{'data': instance.data, '_metadata': instance.metadata};

_MangaListData _$MangaListDataFromJson(Map<String, dynamic> json) =>
    _MangaListData(
      mangas:
          (json['mangas'] as List<dynamic>)
              .map((e) => Manga.fromJson(e as Map<String, dynamic>))
              .toList(),
      tag: Tag.fromJson(json['tag'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MangaListDataToJson(_MangaListData instance) =>
    <String, dynamic>{'mangas': instance.mangas, 'tag': instance.tag};

_Comment _$CommentFromJson(Map<String, dynamic> json) => _Comment(
  id: (json['id'] as num).toInt(),
  user: CommentUser.fromJson(json['user'] as Map<String, dynamic>),
  processedContent: json['processed_content'] as String,
  isShadowRemoved: json['is_shadow_removed'] as bool,
  createdAt: DateTime.parse(json['created_at'] as String),
  repliedIds:
      (json['replied_ids'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
);

Map<String, dynamic> _$CommentToJson(_Comment instance) => <String, dynamic>{
  'id': instance.id,
  'user': instance.user,
  'processed_content': instance.processedContent,
  'is_shadow_removed': instance.isShadowRemoved,
  'created_at': instance.createdAt.toIso8601String(),
  'replied_ids': instance.repliedIds,
};

_CommentUser _$CommentUserFromJson(Map<String, dynamic> json) => _CommentUser(
  id: (json['id'] as num).toInt(),
  username: json['username'] as String,
  teams: json['teams'] as List<dynamic>,
  level: json['level'] as String,
);

Map<String, dynamic> _$CommentUserToJson(_CommentUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'teams': instance.teams,
      'level': instance.level,
    };

_CommentsResponse _$CommentsResponseFromJson(Map<String, dynamic> json) =>
    _CommentsResponse(
      data:
          (json['data'] as List<dynamic>)
              .map((e) => Comment.fromJson(e as Map<String, dynamic>))
              .toList(),
      total: (json['total'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
      pageSize: (json['page_size'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CommentsResponseToJson(_CommentsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
      'page': instance.page,
      'page_size': instance.pageSize,
    };

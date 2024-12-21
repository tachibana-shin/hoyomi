// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetSettingsCollection on Isar {
  IsarCollection<int, Settings> get settings => this.collection();
}

const SettingsSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'Settings',
    idName: 'id',
    embedded: false,
    properties: [
      IsarPropertySchema(
        name: 'mangaReadLazyPage',
        type: IsarType.bool,
      ),
      IsarPropertySchema(
        name: 'pollingIntervalBook',
        type: IsarType.long,
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<int, Settings>(
    serialize: serializeSettings,
    deserialize: deserializeSettings,
    deserializeProperty: deserializeSettingsProp,
  ),
  embeddedSchemas: [],
);

@isarProtected
int serializeSettings(IsarWriter writer, Settings object) {
  IsarCore.writeBool(writer, 1, object.mangaReadLazyPage);
  IsarCore.writeLong(writer, 2, object.pollingIntervalBook);
  return object.id;
}

@isarProtected
Settings deserializeSettings(IsarReader reader) {
  final bool _mangaReadLazyPage;
  {
    if (IsarCore.readNull(reader, 1)) {
      _mangaReadLazyPage = true;
    } else {
      _mangaReadLazyPage = IsarCore.readBool(reader, 1);
    }
  }
  final object = Settings(
    mangaReadLazyPage: _mangaReadLazyPage,
  );
  object.id = IsarCore.readId(reader);
  object.pollingIntervalBook = IsarCore.readLong(reader, 2);
  return object;
}

@isarProtected
dynamic deserializeSettingsProp(IsarReader reader, int property) {
  switch (property) {
    case 0:
      return IsarCore.readId(reader);
    case 1:
      {
        if (IsarCore.readNull(reader, 1)) {
          return true;
        } else {
          return IsarCore.readBool(reader, 1);
        }
      }
    case 2:
      return IsarCore.readLong(reader, 2);
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _SettingsUpdate {
  bool call({
    required int id,
    bool? mangaReadLazyPage,
    int? pollingIntervalBook,
  });
}

class _SettingsUpdateImpl implements _SettingsUpdate {
  const _SettingsUpdateImpl(this.collection);

  final IsarCollection<int, Settings> collection;

  @override
  bool call({
    required int id,
    Object? mangaReadLazyPage = ignore,
    Object? pollingIntervalBook = ignore,
  }) {
    return collection.updateProperties([
          id
        ], {
          if (mangaReadLazyPage != ignore) 1: mangaReadLazyPage as bool?,
          if (pollingIntervalBook != ignore) 2: pollingIntervalBook as int?,
        }) >
        0;
  }
}

sealed class _SettingsUpdateAll {
  int call({
    required List<int> id,
    bool? mangaReadLazyPage,
    int? pollingIntervalBook,
  });
}

class _SettingsUpdateAllImpl implements _SettingsUpdateAll {
  const _SettingsUpdateAllImpl(this.collection);

  final IsarCollection<int, Settings> collection;

  @override
  int call({
    required List<int> id,
    Object? mangaReadLazyPage = ignore,
    Object? pollingIntervalBook = ignore,
  }) {
    return collection.updateProperties(id, {
      if (mangaReadLazyPage != ignore) 1: mangaReadLazyPage as bool?,
      if (pollingIntervalBook != ignore) 2: pollingIntervalBook as int?,
    });
  }
}

extension SettingsUpdate on IsarCollection<int, Settings> {
  _SettingsUpdate get update => _SettingsUpdateImpl(this);

  _SettingsUpdateAll get updateAll => _SettingsUpdateAllImpl(this);
}

sealed class _SettingsQueryUpdate {
  int call({
    bool? mangaReadLazyPage,
    int? pollingIntervalBook,
  });
}

class _SettingsQueryUpdateImpl implements _SettingsQueryUpdate {
  const _SettingsQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<Settings> query;
  final int? limit;

  @override
  int call({
    Object? mangaReadLazyPage = ignore,
    Object? pollingIntervalBook = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (mangaReadLazyPage != ignore) 1: mangaReadLazyPage as bool?,
      if (pollingIntervalBook != ignore) 2: pollingIntervalBook as int?,
    });
  }
}

extension SettingsQueryUpdate on IsarQuery<Settings> {
  _SettingsQueryUpdate get updateFirst =>
      _SettingsQueryUpdateImpl(this, limit: 1);

  _SettingsQueryUpdate get updateAll => _SettingsQueryUpdateImpl(this);
}

class _SettingsQueryBuilderUpdateImpl implements _SettingsQueryUpdate {
  const _SettingsQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<Settings, Settings, QOperations> query;
  final int? limit;

  @override
  int call({
    Object? mangaReadLazyPage = ignore,
    Object? pollingIntervalBook = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (mangaReadLazyPage != ignore) 1: mangaReadLazyPage as bool?,
        if (pollingIntervalBook != ignore) 2: pollingIntervalBook as int?,
      });
    } finally {
      q.close();
    }
  }
}

extension SettingsQueryBuilderUpdate
    on QueryBuilder<Settings, Settings, QOperations> {
  _SettingsQueryUpdate get updateFirst =>
      _SettingsQueryBuilderUpdateImpl(this, limit: 1);

  _SettingsQueryUpdate get updateAll => _SettingsQueryBuilderUpdateImpl(this);
}

extension SettingsQueryFilter
    on QueryBuilder<Settings, Settings, QFilterCondition> {
  QueryBuilder<Settings, Settings, QAfterFilterCondition> idEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> idGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      idGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> idLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> idLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> idBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 0,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      mangaReadLazyPageEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      pollingIntervalBookEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      pollingIntervalBookGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      pollingIntervalBookGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      pollingIntervalBookLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      pollingIntervalBookLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      pollingIntervalBookBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 2,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }
}

extension SettingsQueryObject
    on QueryBuilder<Settings, Settings, QFilterCondition> {}

extension SettingsQuerySortBy on QueryBuilder<Settings, Settings, QSortBy> {
  QueryBuilder<Settings, Settings, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByMangaReadLazyPage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByMangaReadLazyPageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByPollingIntervalBook() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy>
      sortByPollingIntervalBookDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }
}

extension SettingsQuerySortThenBy
    on QueryBuilder<Settings, Settings, QSortThenBy> {
  QueryBuilder<Settings, Settings, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByMangaReadLazyPage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByMangaReadLazyPageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByPollingIntervalBook() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy>
      thenByPollingIntervalBookDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }
}

extension SettingsQueryWhereDistinct
    on QueryBuilder<Settings, Settings, QDistinct> {
  QueryBuilder<Settings, Settings, QAfterDistinct>
      distinctByMangaReadLazyPage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1);
    });
  }

  QueryBuilder<Settings, Settings, QAfterDistinct>
      distinctByPollingIntervalBook() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2);
    });
  }
}

extension SettingsQueryProperty1
    on QueryBuilder<Settings, Settings, QProperty> {
  QueryBuilder<Settings, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<Settings, bool, QAfterProperty> mangaReadLazyPageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<Settings, int, QAfterProperty> pollingIntervalBookProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }
}

extension SettingsQueryProperty2<R>
    on QueryBuilder<Settings, R, QAfterProperty> {
  QueryBuilder<Settings, (R, int), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<Settings, (R, bool), QAfterProperty>
      mangaReadLazyPageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<Settings, (R, int), QAfterProperty>
      pollingIntervalBookProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }
}

extension SettingsQueryProperty3<R1, R2>
    on QueryBuilder<Settings, (R1, R2), QAfterProperty> {
  QueryBuilder<Settings, (R1, R2, int), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<Settings, (R1, R2, bool), QOperations>
      mangaReadLazyPageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<Settings, (R1, R2, int), QOperations>
      pollingIntervalBookProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }
}

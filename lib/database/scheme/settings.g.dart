// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSettingsCollection on Isar {
  IsarCollection<Settings> get settings => this.collection();
}

const SettingsSchema = CollectionSchema(
  name: r'Settings',
  id: -8656046621518759136,
  properties: {
    r'lastCheckUpdateApp': PropertySchema(
      id: 0,
      name: r'lastCheckUpdateApp',
      type: IsarType.string,
    ),
    r'mangaReadLazyPage': PropertySchema(
      id: 1,
      name: r'mangaReadLazyPage',
      type: IsarType.bool,
    ),
    r'pollingIntervalComic': PropertySchema(
      id: 2,
      name: r'pollingIntervalComic',
      type: IsarType.long,
    )
  },
  estimateSize: _settingsEstimateSize,
  serialize: _settingsSerialize,
  deserialize: _settingsDeserialize,
  deserializeProp: _settingsDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _settingsGetId,
  getLinks: _settingsGetLinks,
  attach: _settingsAttach,
  version: '3.1.0+1',
);

int _settingsEstimateSize(
  Settings object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.lastCheckUpdateApp;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _settingsSerialize(
  Settings object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.lastCheckUpdateApp);
  writer.writeBool(offsets[1], object.mangaReadLazyPage);
  writer.writeLong(offsets[2], object.pollingIntervalComic);
}

Settings _settingsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Settings(
    mangaReadLazyPage: reader.readBoolOrNull(offsets[1]) ?? true,
  );
  object.id = id;
  object.lastCheckUpdateApp = reader.readStringOrNull(offsets[0]);
  object.pollingIntervalComic = reader.readLong(offsets[2]);
  return object;
}

P _settingsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readBoolOrNull(offset) ?? true) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _settingsGetId(Settings object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _settingsGetLinks(Settings object) {
  return [];
}

void _settingsAttach(IsarCollection<dynamic> col, Id id, Settings object) {
  object.id = id;
}

extension SettingsQueryWhereSort on QueryBuilder<Settings, Settings, QWhere> {
  QueryBuilder<Settings, Settings, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SettingsQueryWhere on QueryBuilder<Settings, Settings, QWhereClause> {
  QueryBuilder<Settings, Settings, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Settings, Settings, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SettingsQueryFilter
    on QueryBuilder<Settings, Settings, QFilterCondition> {
  QueryBuilder<Settings, Settings, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      lastCheckUpdateAppIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastCheckUpdateApp',
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      lastCheckUpdateAppIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastCheckUpdateApp',
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      lastCheckUpdateAppEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastCheckUpdateApp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      lastCheckUpdateAppGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastCheckUpdateApp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      lastCheckUpdateAppLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastCheckUpdateApp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      lastCheckUpdateAppBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastCheckUpdateApp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      lastCheckUpdateAppStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lastCheckUpdateApp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      lastCheckUpdateAppEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lastCheckUpdateApp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      lastCheckUpdateAppContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lastCheckUpdateApp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      lastCheckUpdateAppMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lastCheckUpdateApp',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      lastCheckUpdateAppIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastCheckUpdateApp',
        value: '',
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      lastCheckUpdateAppIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lastCheckUpdateApp',
        value: '',
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      mangaReadLazyPageEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mangaReadLazyPage',
        value: value,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      pollingIntervalComicEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pollingIntervalComic',
        value: value,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      pollingIntervalComicGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pollingIntervalComic',
        value: value,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      pollingIntervalComicLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pollingIntervalComic',
        value: value,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      pollingIntervalComicBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pollingIntervalComic',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SettingsQueryObject
    on QueryBuilder<Settings, Settings, QFilterCondition> {}

extension SettingsQueryLinks
    on QueryBuilder<Settings, Settings, QFilterCondition> {}

extension SettingsQuerySortBy on QueryBuilder<Settings, Settings, QSortBy> {
  QueryBuilder<Settings, Settings, QAfterSortBy> sortByLastCheckUpdateApp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCheckUpdateApp', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy>
      sortByLastCheckUpdateAppDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCheckUpdateApp', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByMangaReadLazyPage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mangaReadLazyPage', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByMangaReadLazyPageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mangaReadLazyPage', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByPollingIntervalComic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pollingIntervalComic', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy>
      sortByPollingIntervalComicDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pollingIntervalComic', Sort.desc);
    });
  }
}

extension SettingsQuerySortThenBy
    on QueryBuilder<Settings, Settings, QSortThenBy> {
  QueryBuilder<Settings, Settings, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByLastCheckUpdateApp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCheckUpdateApp', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy>
      thenByLastCheckUpdateAppDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCheckUpdateApp', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByMangaReadLazyPage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mangaReadLazyPage', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByMangaReadLazyPageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mangaReadLazyPage', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByPollingIntervalComic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pollingIntervalComic', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy>
      thenByPollingIntervalComicDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pollingIntervalComic', Sort.desc);
    });
  }
}

extension SettingsQueryWhereDistinct
    on QueryBuilder<Settings, Settings, QDistinct> {
  QueryBuilder<Settings, Settings, QDistinct> distinctByLastCheckUpdateApp(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastCheckUpdateApp',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByMangaReadLazyPage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mangaReadLazyPage');
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByPollingIntervalComic() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pollingIntervalComic');
    });
  }
}

extension SettingsQueryProperty
    on QueryBuilder<Settings, Settings, QQueryProperty> {
  QueryBuilder<Settings, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Settings, String?, QQueryOperations>
      lastCheckUpdateAppProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastCheckUpdateApp');
    });
  }

  QueryBuilder<Settings, bool, QQueryOperations> mangaReadLazyPageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mangaReadLazyPage');
    });
  }

  QueryBuilder<Settings, int, QQueryOperations> pollingIntervalComicProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pollingIntervalComic');
    });
  }
}

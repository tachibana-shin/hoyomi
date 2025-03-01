// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cookie_manager.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCookieManagerCollection on Isar {
  IsarCollection<CookieManager> get cookieManagers => this.collection();
}

const CookieManagerSchema = CollectionSchema(
  name: r'CookieManager',
  id: 7786245726833838657,
  properties: {
    r'cookie': PropertySchema(id: 0, name: r'cookie', type: IsarType.string),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'sourceId': PropertySchema(
      id: 2,
      name: r'sourceId',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 3,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'user': PropertySchema(id: 4, name: r'user', type: IsarType.string),
    r'userAgent': PropertySchema(
      id: 5,
      name: r'userAgent',
      type: IsarType.string,
    ),
    r'userUpdatedAt': PropertySchema(
      id: 6,
      name: r'userUpdatedAt',
      type: IsarType.dateTime,
    ),
  },
  estimateSize: _cookieManagerEstimateSize,
  serialize: _cookieManagerSerialize,
  deserialize: _cookieManagerDeserialize,
  deserializeProp: _cookieManagerDeserializeProp,
  idName: r'id',
  indexes: {
    r'sourceId': IndexSchema(
      id: 2155220942429093580,
      name: r'sourceId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'sourceId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'createdAt': IndexSchema(
      id: -3433535483987302584,
      name: r'createdAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'createdAt',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},
  getId: _cookieManagerGetId,
  getLinks: _cookieManagerGetLinks,
  attach: _cookieManagerAttach,
  version: '3.1.0+1',
);

int _cookieManagerEstimateSize(
  CookieManager object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.cookie;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.sourceId.length * 3;
  {
    final value = object.user;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.userAgent;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _cookieManagerSerialize(
  CookieManager object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.cookie);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.sourceId);
  writer.writeDateTime(offsets[3], object.updatedAt);
  writer.writeString(offsets[4], object.user);
  writer.writeString(offsets[5], object.userAgent);
  writer.writeDateTime(offsets[6], object.userUpdatedAt);
}

CookieManager _cookieManagerDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CookieManager(
    cookie: reader.readStringOrNull(offsets[0]),
    createdAt: reader.readDateTime(offsets[1]),
    sourceId: reader.readString(offsets[2]),
    updatedAt: reader.readDateTime(offsets[3]),
    user: reader.readStringOrNull(offsets[4]),
    userAgent: reader.readStringOrNull(offsets[5]),
    userUpdatedAt: reader.readDateTime(offsets[6]),
  );
  object.id = id;
  return object;
}

P _cookieManagerDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _cookieManagerGetId(CookieManager object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _cookieManagerGetLinks(CookieManager object) {
  return [];
}

void _cookieManagerAttach(
  IsarCollection<dynamic> col,
  Id id,
  CookieManager object,
) {
  object.id = id;
}

extension CookieManagerByIndex on IsarCollection<CookieManager> {
  Future<CookieManager?> getBySourceId(String sourceId) {
    return getByIndex(r'sourceId', [sourceId]);
  }

  CookieManager? getBySourceIdSync(String sourceId) {
    return getByIndexSync(r'sourceId', [sourceId]);
  }

  Future<bool> deleteBySourceId(String sourceId) {
    return deleteByIndex(r'sourceId', [sourceId]);
  }

  bool deleteBySourceIdSync(String sourceId) {
    return deleteByIndexSync(r'sourceId', [sourceId]);
  }

  Future<List<CookieManager?>> getAllBySourceId(List<String> sourceIdValues) {
    final values = sourceIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'sourceId', values);
  }

  List<CookieManager?> getAllBySourceIdSync(List<String> sourceIdValues) {
    final values = sourceIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'sourceId', values);
  }

  Future<int> deleteAllBySourceId(List<String> sourceIdValues) {
    final values = sourceIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'sourceId', values);
  }

  int deleteAllBySourceIdSync(List<String> sourceIdValues) {
    final values = sourceIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'sourceId', values);
  }

  Future<Id> putBySourceId(CookieManager object) {
    return putByIndex(r'sourceId', object);
  }

  Id putBySourceIdSync(CookieManager object, {bool saveLinks = true}) {
    return putByIndexSync(r'sourceId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllBySourceId(List<CookieManager> objects) {
    return putAllByIndex(r'sourceId', objects);
  }

  List<Id> putAllBySourceIdSync(
    List<CookieManager> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'sourceId', objects, saveLinks: saveLinks);
  }
}

extension CookieManagerQueryWhereSort
    on QueryBuilder<CookieManager, CookieManager, QWhere> {
  QueryBuilder<CookieManager, CookieManager, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterWhere> anyCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'createdAt'),
      );
    });
  }
}

extension CookieManagerQueryWhere
    on QueryBuilder<CookieManager, CookieManager, QWhereClause> {
  QueryBuilder<CookieManager, CookieManager, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterWhereClause> idNotEqualTo(
    Id id,
  ) {
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

  QueryBuilder<CookieManager, CookieManager, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterWhereClause> sourceIdEqualTo(
    String sourceId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'sourceId', value: [sourceId]),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterWhereClause>
      sourceIdNotEqualTo(String sourceId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'sourceId',
                lower: [],
                upper: [sourceId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'sourceId',
                lower: [sourceId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'sourceId',
                lower: [sourceId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'sourceId',
                lower: [],
                upper: [sourceId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterWhereClause>
      createdAtEqualTo(DateTime createdAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'createdAt', value: [createdAt]),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterWhereClause>
      createdAtNotEqualTo(DateTime createdAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'createdAt',
                lower: [],
                upper: [createdAt],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'createdAt',
                lower: [createdAt],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'createdAt',
                lower: [createdAt],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'createdAt',
                lower: [],
                upper: [createdAt],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterWhereClause>
      createdAtGreaterThan(DateTime createdAt, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'createdAt',
          lower: [createdAt],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterWhereClause>
      createdAtLessThan(DateTime createdAt, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'createdAt',
          lower: [],
          upper: [createdAt],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterWhereClause>
      createdAtBetween(
    DateTime lowerCreatedAt,
    DateTime upperCreatedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'createdAt',
          lower: [lowerCreatedAt],
          includeLower: includeLower,
          upper: [upperCreatedAt],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension CookieManagerQueryFilter
    on QueryBuilder<CookieManager, CookieManager, QFilterCondition> {
  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      cookieIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'cookie'),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      cookieIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'cookie'),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      cookieEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'cookie',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      cookieGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'cookie',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      cookieLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'cookie',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      cookieBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'cookie',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      cookieStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'cookie',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      cookieEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'cookie',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      cookieContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'cookie',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      cookieMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'cookie',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      cookieIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'cookie', value: ''),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      cookieIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'cookie', value: ''),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      createdAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      createdAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'createdAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'id'),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'id'),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition> idEqualTo(
    Id? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      idGreaterThan(Id? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition> idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      sourceIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'sourceId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      sourceIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'sourceId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      sourceIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'sourceId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      sourceIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'sourceId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      sourceIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'sourceId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      sourceIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'sourceId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      sourceIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'sourceId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      sourceIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'sourceId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      sourceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'sourceId', value: ''),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      sourceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'sourceId', value: ''),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: value),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      updatedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      updatedAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'updatedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      userIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'user'),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      userIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'user'),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition> userEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'user',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      userGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'user',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      userLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'user',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition> userBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'user',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      userStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'user',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      userEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'user',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      userContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'user',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition> userMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'user',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      userIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'user', value: ''),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      userIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'user', value: ''),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      userAgentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'userAgent'),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      userAgentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'userAgent'),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      userAgentEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'userAgent',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      userAgentGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'userAgent',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      userAgentLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'userAgent',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      userAgentBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'userAgent',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      userAgentStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'userAgent',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      userAgentEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'userAgent',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      userAgentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'userAgent',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      userAgentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'userAgent',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      userAgentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'userAgent', value: ''),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      userAgentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'userAgent', value: ''),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      userUpdatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'userUpdatedAt', value: value),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      userUpdatedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'userUpdatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      userUpdatedAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'userUpdatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterFilterCondition>
      userUpdatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'userUpdatedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension CookieManagerQueryObject
    on QueryBuilder<CookieManager, CookieManager, QFilterCondition> {}

extension CookieManagerQueryLinks
    on QueryBuilder<CookieManager, CookieManager, QFilterCondition> {}

extension CookieManagerQuerySortBy
    on QueryBuilder<CookieManager, CookieManager, QSortBy> {
  QueryBuilder<CookieManager, CookieManager, QAfterSortBy> sortByCookie() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cookie', Sort.asc);
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterSortBy> sortByCookieDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cookie', Sort.desc);
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterSortBy> sortBySourceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceId', Sort.asc);
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterSortBy>
      sortBySourceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceId', Sort.desc);
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterSortBy> sortByUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'user', Sort.asc);
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterSortBy> sortByUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'user', Sort.desc);
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterSortBy> sortByUserAgent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userAgent', Sort.asc);
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterSortBy>
      sortByUserAgentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userAgent', Sort.desc);
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterSortBy>
      sortByUserUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userUpdatedAt', Sort.asc);
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterSortBy>
      sortByUserUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userUpdatedAt', Sort.desc);
    });
  }
}

extension CookieManagerQuerySortThenBy
    on QueryBuilder<CookieManager, CookieManager, QSortThenBy> {
  QueryBuilder<CookieManager, CookieManager, QAfterSortBy> thenByCookie() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cookie', Sort.asc);
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterSortBy> thenByCookieDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cookie', Sort.desc);
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterSortBy> thenBySourceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceId', Sort.asc);
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterSortBy>
      thenBySourceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceId', Sort.desc);
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterSortBy> thenByUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'user', Sort.asc);
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterSortBy> thenByUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'user', Sort.desc);
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterSortBy> thenByUserAgent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userAgent', Sort.asc);
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterSortBy>
      thenByUserAgentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userAgent', Sort.desc);
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterSortBy>
      thenByUserUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userUpdatedAt', Sort.asc);
    });
  }

  QueryBuilder<CookieManager, CookieManager, QAfterSortBy>
      thenByUserUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userUpdatedAt', Sort.desc);
    });
  }
}

extension CookieManagerQueryWhereDistinct
    on QueryBuilder<CookieManager, CookieManager, QDistinct> {
  QueryBuilder<CookieManager, CookieManager, QDistinct> distinctByCookie({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cookie', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CookieManager, CookieManager, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<CookieManager, CookieManager, QDistinct> distinctBySourceId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sourceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CookieManager, CookieManager, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<CookieManager, CookieManager, QDistinct> distinctByUser({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'user', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CookieManager, CookieManager, QDistinct> distinctByUserAgent({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userAgent', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CookieManager, CookieManager, QDistinct>
      distinctByUserUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userUpdatedAt');
    });
  }
}

extension CookieManagerQueryProperty
    on QueryBuilder<CookieManager, CookieManager, QQueryProperty> {
  QueryBuilder<CookieManager, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CookieManager, String?, QQueryOperations> cookieProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cookie');
    });
  }

  QueryBuilder<CookieManager, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<CookieManager, String, QQueryOperations> sourceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sourceId');
    });
  }

  QueryBuilder<CookieManager, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<CookieManager, String?, QQueryOperations> userProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'user');
    });
  }

  QueryBuilder<CookieManager, String?, QQueryOperations> userAgentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userAgent');
    });
  }

  QueryBuilder<CookieManager, DateTime, QQueryOperations>
      userUpdatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userUpdatedAt');
    });
  }
}

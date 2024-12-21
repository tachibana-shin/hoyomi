// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_chap.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetHistoryChapCollection on Isar {
  IsarCollection<int, HistoryChap> get historyChaps => this.collection();
}

const HistoryChapSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'HistoryChap',
    idName: 'id',
    embedded: false,
    properties: [
      IsarPropertySchema(
        name: 'book',
        type: IsarType.long,
      ),
      IsarPropertySchema(
        name: 'chapterId',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'currentPage',
        type: IsarType.double,
      ),
      IsarPropertySchema(
        name: 'maxPage',
        type: IsarType.long,
      ),
      IsarPropertySchema(
        name: 'createdAt',
        type: IsarType.dateTime,
      ),
      IsarPropertySchema(
        name: 'updatedAt',
        type: IsarType.dateTime,
      ),
    ],
    indexes: [
      IsarIndexSchema(
        name: 'chapterId',
        properties: [
          "chapterId",
        ],
        unique: false,
        hash: false,
      ),
      IsarIndexSchema(
        name: 'createdAt',
        properties: [
          "createdAt",
        ],
        unique: false,
        hash: false,
      ),
    ],
  ),
  converter: IsarObjectConverter<int, HistoryChap>(
    serialize: serializeHistoryChap,
    deserialize: deserializeHistoryChap,
    deserializeProperty: deserializeHistoryChapProp,
  ),
  embeddedSchemas: [],
);

@isarProtected
int serializeHistoryChap(IsarWriter writer, HistoryChap object) {
  IsarCore.writeLong(writer, 1, object.book);
  IsarCore.writeString(writer, 2, object.chapterId);
  IsarCore.writeDouble(writer, 3, object.currentPage);
  IsarCore.writeLong(writer, 4, object.maxPage);
  IsarCore.writeLong(
      writer, 5, object.createdAt.toUtc().microsecondsSinceEpoch);
  IsarCore.writeLong(
      writer, 6, object.updatedAt.toUtc().microsecondsSinceEpoch);
  return object.id;
}

@isarProtected
HistoryChap deserializeHistoryChap(IsarReader reader) {
  final String _chapterId;
  _chapterId = IsarCore.readString(reader, 2) ?? '';
  final double _currentPage;
  _currentPage = IsarCore.readDouble(reader, 3);
  final int _maxPage;
  _maxPage = IsarCore.readLong(reader, 4);
  final DateTime _createdAt;
  {
    final value = IsarCore.readLong(reader, 5);
    if (value == -9223372036854775808) {
      _createdAt =
          DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
    } else {
      _createdAt =
          DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true).toLocal();
    }
  }
  final DateTime _updatedAt;
  {
    final value = IsarCore.readLong(reader, 6);
    if (value == -9223372036854775808) {
      _updatedAt =
          DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
    } else {
      _updatedAt =
          DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true).toLocal();
    }
  }
  final object = HistoryChap(
    chapterId: _chapterId,
    currentPage: _currentPage,
    maxPage: _maxPage,
    createdAt: _createdAt,
    updatedAt: _updatedAt,
  );
  object.id = IsarCore.readId(reader);
  object.book = IsarCore.readLong(reader, 1);
  return object;
}

@isarProtected
dynamic deserializeHistoryChapProp(IsarReader reader, int property) {
  switch (property) {
    case 0:
      return IsarCore.readId(reader);
    case 1:
      return IsarCore.readLong(reader, 1);
    case 2:
      return IsarCore.readString(reader, 2) ?? '';
    case 3:
      return IsarCore.readDouble(reader, 3);
    case 4:
      return IsarCore.readLong(reader, 4);
    case 5:
      {
        final value = IsarCore.readLong(reader, 5);
        if (value == -9223372036854775808) {
          return DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
        } else {
          return DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true)
              .toLocal();
        }
      }
    case 6:
      {
        final value = IsarCore.readLong(reader, 6);
        if (value == -9223372036854775808) {
          return DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
        } else {
          return DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true)
              .toLocal();
        }
      }
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _HistoryChapUpdate {
  bool call({
    required int id,
    int? book,
    String? chapterId,
    double? currentPage,
    int? maxPage,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

class _HistoryChapUpdateImpl implements _HistoryChapUpdate {
  const _HistoryChapUpdateImpl(this.collection);

  final IsarCollection<int, HistoryChap> collection;

  @override
  bool call({
    required int id,
    Object? book = ignore,
    Object? chapterId = ignore,
    Object? currentPage = ignore,
    Object? maxPage = ignore,
    Object? createdAt = ignore,
    Object? updatedAt = ignore,
  }) {
    return collection.updateProperties([
          id
        ], {
          if (book != ignore) 1: book as int?,
          if (chapterId != ignore) 2: chapterId as String?,
          if (currentPage != ignore) 3: currentPage as double?,
          if (maxPage != ignore) 4: maxPage as int?,
          if (createdAt != ignore) 5: createdAt as DateTime?,
          if (updatedAt != ignore) 6: updatedAt as DateTime?,
        }) >
        0;
  }
}

sealed class _HistoryChapUpdateAll {
  int call({
    required List<int> id,
    int? book,
    String? chapterId,
    double? currentPage,
    int? maxPage,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

class _HistoryChapUpdateAllImpl implements _HistoryChapUpdateAll {
  const _HistoryChapUpdateAllImpl(this.collection);

  final IsarCollection<int, HistoryChap> collection;

  @override
  int call({
    required List<int> id,
    Object? book = ignore,
    Object? chapterId = ignore,
    Object? currentPage = ignore,
    Object? maxPage = ignore,
    Object? createdAt = ignore,
    Object? updatedAt = ignore,
  }) {
    return collection.updateProperties(id, {
      if (book != ignore) 1: book as int?,
      if (chapterId != ignore) 2: chapterId as String?,
      if (currentPage != ignore) 3: currentPage as double?,
      if (maxPage != ignore) 4: maxPage as int?,
      if (createdAt != ignore) 5: createdAt as DateTime?,
      if (updatedAt != ignore) 6: updatedAt as DateTime?,
    });
  }
}

extension HistoryChapUpdate on IsarCollection<int, HistoryChap> {
  _HistoryChapUpdate get update => _HistoryChapUpdateImpl(this);

  _HistoryChapUpdateAll get updateAll => _HistoryChapUpdateAllImpl(this);
}

sealed class _HistoryChapQueryUpdate {
  int call({
    int? book,
    String? chapterId,
    double? currentPage,
    int? maxPage,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

class _HistoryChapQueryUpdateImpl implements _HistoryChapQueryUpdate {
  const _HistoryChapQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<HistoryChap> query;
  final int? limit;

  @override
  int call({
    Object? book = ignore,
    Object? chapterId = ignore,
    Object? currentPage = ignore,
    Object? maxPage = ignore,
    Object? createdAt = ignore,
    Object? updatedAt = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (book != ignore) 1: book as int?,
      if (chapterId != ignore) 2: chapterId as String?,
      if (currentPage != ignore) 3: currentPage as double?,
      if (maxPage != ignore) 4: maxPage as int?,
      if (createdAt != ignore) 5: createdAt as DateTime?,
      if (updatedAt != ignore) 6: updatedAt as DateTime?,
    });
  }
}

extension HistoryChapQueryUpdate on IsarQuery<HistoryChap> {
  _HistoryChapQueryUpdate get updateFirst =>
      _HistoryChapQueryUpdateImpl(this, limit: 1);

  _HistoryChapQueryUpdate get updateAll => _HistoryChapQueryUpdateImpl(this);
}

class _HistoryChapQueryBuilderUpdateImpl implements _HistoryChapQueryUpdate {
  const _HistoryChapQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<HistoryChap, HistoryChap, QOperations> query;
  final int? limit;

  @override
  int call({
    Object? book = ignore,
    Object? chapterId = ignore,
    Object? currentPage = ignore,
    Object? maxPage = ignore,
    Object? createdAt = ignore,
    Object? updatedAt = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (book != ignore) 1: book as int?,
        if (chapterId != ignore) 2: chapterId as String?,
        if (currentPage != ignore) 3: currentPage as double?,
        if (maxPage != ignore) 4: maxPage as int?,
        if (createdAt != ignore) 5: createdAt as DateTime?,
        if (updatedAt != ignore) 6: updatedAt as DateTime?,
      });
    } finally {
      q.close();
    }
  }
}

extension HistoryChapQueryBuilderUpdate
    on QueryBuilder<HistoryChap, HistoryChap, QOperations> {
  _HistoryChapQueryUpdate get updateFirst =>
      _HistoryChapQueryBuilderUpdateImpl(this, limit: 1);

  _HistoryChapQueryUpdate get updateAll =>
      _HistoryChapQueryBuilderUpdateImpl(this);
}

extension HistoryChapQueryFilter
    on QueryBuilder<HistoryChap, HistoryChap, QFilterCondition> {
  QueryBuilder<HistoryChap, HistoryChap, QAfterFilterCondition> idEqualTo(
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

  QueryBuilder<HistoryChap, HistoryChap, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<HistoryChap, HistoryChap, QAfterFilterCondition>
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

  QueryBuilder<HistoryChap, HistoryChap, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<HistoryChap, HistoryChap, QAfterFilterCondition>
      idLessThanOrEqualTo(
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

  QueryBuilder<HistoryChap, HistoryChap, QAfterFilterCondition> idBetween(
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

  QueryBuilder<HistoryChap, HistoryChap, QAfterFilterCondition> bookEqualTo(
    int value,
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

  QueryBuilder<HistoryChap, HistoryChap, QAfterFilterCondition> bookGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterFilterCondition>
      bookGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterFilterCondition> bookLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterFilterCondition>
      bookLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterFilterCondition> bookBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterFilterCondition>
      chapterIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterFilterCondition>
      chapterIdGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterFilterCondition>
      chapterIdGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterFilterCondition>
      chapterIdLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterFilterCondition>
      chapterIdLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterFilterCondition>
      chapterIdBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 2,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterFilterCondition>
      chapterIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterFilterCondition>
      chapterIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterFilterCondition>
      chapterIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterFilterCondition>
      chapterIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 2,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterFilterCondition>
      chapterIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterFilterCondition>
      chapterIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterFilterCondition>
      currentPageEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 3,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterFilterCondition>
      currentPageGreaterThan(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 3,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterFilterCondition>
      currentPageGreaterThanOrEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 3,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterFilterCondition>
      currentPageLessThan(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 3,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterFilterCondition>
      currentPageLessThanOrEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 3,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterFilterCondition>
      currentPageBetween(
    double lower,
    double upper, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 3,
          lower: lower,
          upper: upper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterFilterCondition> maxPageEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 4,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterFilterCondition>
      maxPageGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 4,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterFilterCondition>
      maxPageGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 4,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterFilterCondition> maxPageLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 4,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterFilterCondition>
      maxPageLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 4,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterFilterCondition> maxPageBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 4,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterFilterCondition>
      createdAtEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterFilterCondition>
      createdAtGreaterThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterFilterCondition>
      createdAtLessThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 5,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterFilterCondition>
      updatedAtEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 6,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 6,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterFilterCondition>
      updatedAtGreaterThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 6,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterFilterCondition>
      updatedAtLessThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 6,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterFilterCondition>
      updatedAtLessThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 6,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterFilterCondition>
      updatedAtBetween(
    DateTime lower,
    DateTime upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 6,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }
}

extension HistoryChapQueryObject
    on QueryBuilder<HistoryChap, HistoryChap, QFilterCondition> {}

extension HistoryChapQuerySortBy
    on QueryBuilder<HistoryChap, HistoryChap, QSortBy> {
  QueryBuilder<HistoryChap, HistoryChap, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterSortBy> sortByBook() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1);
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterSortBy> sortByBookDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc);
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterSortBy> sortByChapterId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterSortBy> sortByChapterIdDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterSortBy> sortByCurrentPage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterSortBy> sortByCurrentPageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterSortBy> sortByMaxPage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4);
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterSortBy> sortByMaxPageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, sort: Sort.desc);
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5);
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, sort: Sort.desc);
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6);
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6, sort: Sort.desc);
    });
  }
}

extension HistoryChapQuerySortThenBy
    on QueryBuilder<HistoryChap, HistoryChap, QSortThenBy> {
  QueryBuilder<HistoryChap, HistoryChap, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterSortBy> thenByBook() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1);
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterSortBy> thenByBookDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc);
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterSortBy> thenByChapterId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterSortBy> thenByChapterIdDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterSortBy> thenByCurrentPage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterSortBy> thenByCurrentPageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterSortBy> thenByMaxPage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4);
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterSortBy> thenByMaxPageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, sort: Sort.desc);
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5);
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, sort: Sort.desc);
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6);
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6, sort: Sort.desc);
    });
  }
}

extension HistoryChapQueryWhereDistinct
    on QueryBuilder<HistoryChap, HistoryChap, QDistinct> {
  QueryBuilder<HistoryChap, HistoryChap, QAfterDistinct> distinctByBook() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1);
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterDistinct> distinctByChapterId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterDistinct>
      distinctByCurrentPage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(3);
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterDistinct> distinctByMaxPage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(4);
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(5);
    });
  }

  QueryBuilder<HistoryChap, HistoryChap, QAfterDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(6);
    });
  }
}

extension HistoryChapQueryProperty1
    on QueryBuilder<HistoryChap, HistoryChap, QProperty> {
  QueryBuilder<HistoryChap, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<HistoryChap, int, QAfterProperty> bookProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<HistoryChap, String, QAfterProperty> chapterIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<HistoryChap, double, QAfterProperty> currentPageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<HistoryChap, int, QAfterProperty> maxPageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<HistoryChap, DateTime, QAfterProperty> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<HistoryChap, DateTime, QAfterProperty> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }
}

extension HistoryChapQueryProperty2<R>
    on QueryBuilder<HistoryChap, R, QAfterProperty> {
  QueryBuilder<HistoryChap, (R, int), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<HistoryChap, (R, int), QAfterProperty> bookProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<HistoryChap, (R, String), QAfterProperty> chapterIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<HistoryChap, (R, double), QAfterProperty> currentPageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<HistoryChap, (R, int), QAfterProperty> maxPageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<HistoryChap, (R, DateTime), QAfterProperty> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<HistoryChap, (R, DateTime), QAfterProperty> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }
}

extension HistoryChapQueryProperty3<R1, R2>
    on QueryBuilder<HistoryChap, (R1, R2), QAfterProperty> {
  QueryBuilder<HistoryChap, (R1, R2, int), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<HistoryChap, (R1, R2, int), QOperations> bookProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<HistoryChap, (R1, R2, String), QOperations> chapterIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<HistoryChap, (R1, R2, double), QOperations>
      currentPageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<HistoryChap, (R1, R2, int), QOperations> maxPageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<HistoryChap, (R1, R2, DateTime), QOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<HistoryChap, (R1, R2, DateTime), QOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }
}

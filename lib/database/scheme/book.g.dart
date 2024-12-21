// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetBookCollection on Isar {
  IsarCollection<int, Book> get books => this.collection();
}

const BookSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'Book',
    idName: 'id',
    embedded: false,
    properties: [
      IsarPropertySchema(
        name: 'uid',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'sourceId',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'bookId',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'status',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'meta',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'followedAt',
        type: IsarType.dateTime,
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
        name: 'uid',
        properties: [
          "uid",
        ],
        unique: true,
        hash: false,
      ),
      IsarIndexSchema(
        name: 'sourceId',
        properties: [
          "sourceId",
        ],
        unique: false,
        hash: false,
      ),
      IsarIndexSchema(
        name: 'bookId',
        properties: [
          "bookId",
        ],
        unique: false,
        hash: false,
      ),
      IsarIndexSchema(
        name: 'followedAt',
        properties: [
          "followedAt",
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
  converter: IsarObjectConverter<int, Book>(
    serialize: serializeBook,
    deserialize: deserializeBook,
    deserializeProperty: deserializeBookProp,
  ),
  embeddedSchemas: [],
);

@isarProtected
int serializeBook(IsarWriter writer, Book object) {
  IsarCore.writeString(writer, 1, object.uid);
  IsarCore.writeString(writer, 2, object.sourceId);
  IsarCore.writeString(writer, 3, object.bookId);
  IsarCore.writeString(writer, 4, object.status);
  IsarCore.writeString(writer, 5, object.meta);
  IsarCore.writeLong(
      writer,
      6,
      object.followedAt?.toUtc().microsecondsSinceEpoch ??
          -9223372036854775808);
  IsarCore.writeLong(
      writer, 7, object.createdAt.toUtc().microsecondsSinceEpoch);
  IsarCore.writeLong(
      writer, 8, object.updatedAt.toUtc().microsecondsSinceEpoch);
  return object.id;
}

@isarProtected
Book deserializeBook(IsarReader reader) {
  final String _sourceId;
  _sourceId = IsarCore.readString(reader, 2) ?? '';
  final String _bookId;
  _bookId = IsarCore.readString(reader, 3) ?? '';
  final String _status;
  _status = IsarCore.readString(reader, 4) ?? '';
  final String _meta;
  _meta = IsarCore.readString(reader, 5) ?? '';
  final DateTime? _followedAt;
  {
    final value = IsarCore.readLong(reader, 6);
    if (value == -9223372036854775808) {
      _followedAt = null;
    } else {
      _followedAt =
          DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true).toLocal();
    }
  }
  final DateTime _createdAt;
  {
    final value = IsarCore.readLong(reader, 7);
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
    final value = IsarCore.readLong(reader, 8);
    if (value == -9223372036854775808) {
      _updatedAt =
          DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
    } else {
      _updatedAt =
          DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true).toLocal();
    }
  }
  final object = Book(
    sourceId: _sourceId,
    bookId: _bookId,
    status: _status,
    meta: _meta,
    followedAt: _followedAt,
    createdAt: _createdAt,
    updatedAt: _updatedAt,
  );
  object.id = IsarCore.readId(reader);
  object.uid = IsarCore.readString(reader, 1) ?? '';
  return object;
}

@isarProtected
dynamic deserializeBookProp(IsarReader reader, int property) {
  switch (property) {
    case 0:
      return IsarCore.readId(reader);
    case 1:
      return IsarCore.readString(reader, 1) ?? '';
    case 2:
      return IsarCore.readString(reader, 2) ?? '';
    case 3:
      return IsarCore.readString(reader, 3) ?? '';
    case 4:
      return IsarCore.readString(reader, 4) ?? '';
    case 5:
      return IsarCore.readString(reader, 5) ?? '';
    case 6:
      {
        final value = IsarCore.readLong(reader, 6);
        if (value == -9223372036854775808) {
          return null;
        } else {
          return DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true)
              .toLocal();
        }
      }
    case 7:
      {
        final value = IsarCore.readLong(reader, 7);
        if (value == -9223372036854775808) {
          return DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
        } else {
          return DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true)
              .toLocal();
        }
      }
    case 8:
      {
        final value = IsarCore.readLong(reader, 8);
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

sealed class _BookUpdate {
  bool call({
    required int id,
    String? uid,
    String? sourceId,
    String? bookId,
    String? status,
    String? meta,
    DateTime? followedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

class _BookUpdateImpl implements _BookUpdate {
  const _BookUpdateImpl(this.collection);

  final IsarCollection<int, Book> collection;

  @override
  bool call({
    required int id,
    Object? uid = ignore,
    Object? sourceId = ignore,
    Object? bookId = ignore,
    Object? status = ignore,
    Object? meta = ignore,
    Object? followedAt = ignore,
    Object? createdAt = ignore,
    Object? updatedAt = ignore,
  }) {
    return collection.updateProperties([
          id
        ], {
          if (uid != ignore) 1: uid as String?,
          if (sourceId != ignore) 2: sourceId as String?,
          if (bookId != ignore) 3: bookId as String?,
          if (status != ignore) 4: status as String?,
          if (meta != ignore) 5: meta as String?,
          if (followedAt != ignore) 6: followedAt as DateTime?,
          if (createdAt != ignore) 7: createdAt as DateTime?,
          if (updatedAt != ignore) 8: updatedAt as DateTime?,
        }) >
        0;
  }
}

sealed class _BookUpdateAll {
  int call({
    required List<int> id,
    String? uid,
    String? sourceId,
    String? bookId,
    String? status,
    String? meta,
    DateTime? followedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

class _BookUpdateAllImpl implements _BookUpdateAll {
  const _BookUpdateAllImpl(this.collection);

  final IsarCollection<int, Book> collection;

  @override
  int call({
    required List<int> id,
    Object? uid = ignore,
    Object? sourceId = ignore,
    Object? bookId = ignore,
    Object? status = ignore,
    Object? meta = ignore,
    Object? followedAt = ignore,
    Object? createdAt = ignore,
    Object? updatedAt = ignore,
  }) {
    return collection.updateProperties(id, {
      if (uid != ignore) 1: uid as String?,
      if (sourceId != ignore) 2: sourceId as String?,
      if (bookId != ignore) 3: bookId as String?,
      if (status != ignore) 4: status as String?,
      if (meta != ignore) 5: meta as String?,
      if (followedAt != ignore) 6: followedAt as DateTime?,
      if (createdAt != ignore) 7: createdAt as DateTime?,
      if (updatedAt != ignore) 8: updatedAt as DateTime?,
    });
  }
}

extension BookUpdate on IsarCollection<int, Book> {
  _BookUpdate get update => _BookUpdateImpl(this);

  _BookUpdateAll get updateAll => _BookUpdateAllImpl(this);
}

sealed class _BookQueryUpdate {
  int call({
    String? uid,
    String? sourceId,
    String? bookId,
    String? status,
    String? meta,
    DateTime? followedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

class _BookQueryUpdateImpl implements _BookQueryUpdate {
  const _BookQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<Book> query;
  final int? limit;

  @override
  int call({
    Object? uid = ignore,
    Object? sourceId = ignore,
    Object? bookId = ignore,
    Object? status = ignore,
    Object? meta = ignore,
    Object? followedAt = ignore,
    Object? createdAt = ignore,
    Object? updatedAt = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (uid != ignore) 1: uid as String?,
      if (sourceId != ignore) 2: sourceId as String?,
      if (bookId != ignore) 3: bookId as String?,
      if (status != ignore) 4: status as String?,
      if (meta != ignore) 5: meta as String?,
      if (followedAt != ignore) 6: followedAt as DateTime?,
      if (createdAt != ignore) 7: createdAt as DateTime?,
      if (updatedAt != ignore) 8: updatedAt as DateTime?,
    });
  }
}

extension BookQueryUpdate on IsarQuery<Book> {
  _BookQueryUpdate get updateFirst => _BookQueryUpdateImpl(this, limit: 1);

  _BookQueryUpdate get updateAll => _BookQueryUpdateImpl(this);
}

class _BookQueryBuilderUpdateImpl implements _BookQueryUpdate {
  const _BookQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<Book, Book, QOperations> query;
  final int? limit;

  @override
  int call({
    Object? uid = ignore,
    Object? sourceId = ignore,
    Object? bookId = ignore,
    Object? status = ignore,
    Object? meta = ignore,
    Object? followedAt = ignore,
    Object? createdAt = ignore,
    Object? updatedAt = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (uid != ignore) 1: uid as String?,
        if (sourceId != ignore) 2: sourceId as String?,
        if (bookId != ignore) 3: bookId as String?,
        if (status != ignore) 4: status as String?,
        if (meta != ignore) 5: meta as String?,
        if (followedAt != ignore) 6: followedAt as DateTime?,
        if (createdAt != ignore) 7: createdAt as DateTime?,
        if (updatedAt != ignore) 8: updatedAt as DateTime?,
      });
    } finally {
      q.close();
    }
  }
}

extension BookQueryBuilderUpdate on QueryBuilder<Book, Book, QOperations> {
  _BookQueryUpdate get updateFirst =>
      _BookQueryBuilderUpdateImpl(this, limit: 1);

  _BookQueryUpdate get updateAll => _BookQueryBuilderUpdateImpl(this);
}

extension BookQueryFilter on QueryBuilder<Book, Book, QFilterCondition> {
  QueryBuilder<Book, Book, QAfterFilterCondition> idEqualTo(
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

  QueryBuilder<Book, Book, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Book, Book, QAfterFilterCondition> idGreaterThanOrEqualTo(
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

  QueryBuilder<Book, Book, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Book, Book, QAfterFilterCondition> idLessThanOrEqualTo(
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

  QueryBuilder<Book, Book, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Book, Book, QAfterFilterCondition> uidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> uidGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> uidGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> uidLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> uidLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> uidBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> uidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> uidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> uidContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> uidMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 1,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> uidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> uidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> sourceIdEqualTo(
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

  QueryBuilder<Book, Book, QAfterFilterCondition> sourceIdGreaterThan(
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

  QueryBuilder<Book, Book, QAfterFilterCondition> sourceIdGreaterThanOrEqualTo(
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

  QueryBuilder<Book, Book, QAfterFilterCondition> sourceIdLessThan(
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

  QueryBuilder<Book, Book, QAfterFilterCondition> sourceIdLessThanOrEqualTo(
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

  QueryBuilder<Book, Book, QAfterFilterCondition> sourceIdBetween(
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

  QueryBuilder<Book, Book, QAfterFilterCondition> sourceIdStartsWith(
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

  QueryBuilder<Book, Book, QAfterFilterCondition> sourceIdEndsWith(
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

  QueryBuilder<Book, Book, QAfterFilterCondition> sourceIdContains(String value,
      {bool caseSensitive = true}) {
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

  QueryBuilder<Book, Book, QAfterFilterCondition> sourceIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
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

  QueryBuilder<Book, Book, QAfterFilterCondition> sourceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> sourceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> bookIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> bookIdGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> bookIdGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> bookIdLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> bookIdLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> bookIdBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 3,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> bookIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> bookIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> bookIdContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> bookIdMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 3,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> bookIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> bookIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> statusEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> statusGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> statusGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> statusLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> statusLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> statusBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 4,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> statusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> statusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> statusContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> statusMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 4,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 4,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 4,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> metaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> metaGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> metaGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> metaLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> metaLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> metaBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 5,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> metaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> metaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> metaContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> metaMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 5,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> metaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 5,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> metaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 5,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> followedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 6));
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> followedAtIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 6));
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> followedAtEqualTo(
    DateTime? value,
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

  QueryBuilder<Book, Book, QAfterFilterCondition> followedAtGreaterThan(
    DateTime? value,
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

  QueryBuilder<Book, Book, QAfterFilterCondition>
      followedAtGreaterThanOrEqualTo(
    DateTime? value,
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

  QueryBuilder<Book, Book, QAfterFilterCondition> followedAtLessThan(
    DateTime? value,
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

  QueryBuilder<Book, Book, QAfterFilterCondition> followedAtLessThanOrEqualTo(
    DateTime? value,
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

  QueryBuilder<Book, Book, QAfterFilterCondition> followedAtBetween(
    DateTime? lower,
    DateTime? upper,
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

  QueryBuilder<Book, Book, QAfterFilterCondition> createdAtEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 7,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> createdAtGreaterThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 7,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> createdAtGreaterThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 7,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> createdAtLessThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 7,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> createdAtLessThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 7,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> createdAtBetween(
    DateTime lower,
    DateTime upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 7,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> updatedAtEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 8,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> updatedAtGreaterThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 8,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> updatedAtGreaterThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 8,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> updatedAtLessThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 8,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> updatedAtLessThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 8,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> updatedAtBetween(
    DateTime lower,
    DateTime upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 8,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }
}

extension BookQueryObject on QueryBuilder<Book, Book, QFilterCondition> {}

extension BookQuerySortBy on QueryBuilder<Book, Book, QSortBy> {
  QueryBuilder<Book, Book, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<Book, Book, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<Book, Book, QAfterSortBy> sortByUid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Book, Book, QAfterSortBy> sortByUidDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Book, Book, QAfterSortBy> sortBySourceId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Book, Book, QAfterSortBy> sortBySourceIdDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Book, Book, QAfterSortBy> sortByBookId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        3,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Book, Book, QAfterSortBy> sortByBookIdDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        3,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Book, Book, QAfterSortBy> sortByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        4,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Book, Book, QAfterSortBy> sortByStatusDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        4,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Book, Book, QAfterSortBy> sortByMeta(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        5,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Book, Book, QAfterSortBy> sortByMetaDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        5,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Book, Book, QAfterSortBy> sortByFollowedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6);
    });
  }

  QueryBuilder<Book, Book, QAfterSortBy> sortByFollowedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6, sort: Sort.desc);
    });
  }

  QueryBuilder<Book, Book, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(7);
    });
  }

  QueryBuilder<Book, Book, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(7, sort: Sort.desc);
    });
  }

  QueryBuilder<Book, Book, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(8);
    });
  }

  QueryBuilder<Book, Book, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(8, sort: Sort.desc);
    });
  }
}

extension BookQuerySortThenBy on QueryBuilder<Book, Book, QSortThenBy> {
  QueryBuilder<Book, Book, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<Book, Book, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<Book, Book, QAfterSortBy> thenByUid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Book, Book, QAfterSortBy> thenByUidDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Book, Book, QAfterSortBy> thenBySourceId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Book, Book, QAfterSortBy> thenBySourceIdDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Book, Book, QAfterSortBy> thenByBookId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Book, Book, QAfterSortBy> thenByBookIdDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Book, Book, QAfterSortBy> thenByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Book, Book, QAfterSortBy> thenByStatusDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Book, Book, QAfterSortBy> thenByMeta(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Book, Book, QAfterSortBy> thenByMetaDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Book, Book, QAfterSortBy> thenByFollowedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6);
    });
  }

  QueryBuilder<Book, Book, QAfterSortBy> thenByFollowedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6, sort: Sort.desc);
    });
  }

  QueryBuilder<Book, Book, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(7);
    });
  }

  QueryBuilder<Book, Book, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(7, sort: Sort.desc);
    });
  }

  QueryBuilder<Book, Book, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(8);
    });
  }

  QueryBuilder<Book, Book, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(8, sort: Sort.desc);
    });
  }
}

extension BookQueryWhereDistinct on QueryBuilder<Book, Book, QDistinct> {
  QueryBuilder<Book, Book, QAfterDistinct> distinctByUid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Book, Book, QAfterDistinct> distinctBySourceId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Book, Book, QAfterDistinct> distinctByBookId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(3, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Book, Book, QAfterDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(4, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Book, Book, QAfterDistinct> distinctByMeta(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(5, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Book, Book, QAfterDistinct> distinctByFollowedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(6);
    });
  }

  QueryBuilder<Book, Book, QAfterDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(7);
    });
  }

  QueryBuilder<Book, Book, QAfterDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(8);
    });
  }
}

extension BookQueryProperty1 on QueryBuilder<Book, Book, QProperty> {
  QueryBuilder<Book, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<Book, String, QAfterProperty> uidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<Book, String, QAfterProperty> sourceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<Book, String, QAfterProperty> bookIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<Book, String, QAfterProperty> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<Book, String, QAfterProperty> metaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<Book, DateTime?, QAfterProperty> followedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<Book, DateTime, QAfterProperty> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }

  QueryBuilder<Book, DateTime, QAfterProperty> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(8);
    });
  }
}

extension BookQueryProperty2<R> on QueryBuilder<Book, R, QAfterProperty> {
  QueryBuilder<Book, (R, int), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<Book, (R, String), QAfterProperty> uidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<Book, (R, String), QAfterProperty> sourceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<Book, (R, String), QAfterProperty> bookIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<Book, (R, String), QAfterProperty> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<Book, (R, String), QAfterProperty> metaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<Book, (R, DateTime?), QAfterProperty> followedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<Book, (R, DateTime), QAfterProperty> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }

  QueryBuilder<Book, (R, DateTime), QAfterProperty> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(8);
    });
  }
}

extension BookQueryProperty3<R1, R2>
    on QueryBuilder<Book, (R1, R2), QAfterProperty> {
  QueryBuilder<Book, (R1, R2, int), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<Book, (R1, R2, String), QOperations> uidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<Book, (R1, R2, String), QOperations> sourceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<Book, (R1, R2, String), QOperations> bookIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<Book, (R1, R2, String), QOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<Book, (R1, R2, String), QOperations> metaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<Book, (R1, R2, DateTime?), QOperations> followedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<Book, (R1, R2, DateTime), QOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }

  QueryBuilder<Book, (R1, R2, DateTime), QOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(8);
    });
  }
}

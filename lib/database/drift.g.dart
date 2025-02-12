// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift.dart';

// ignore_for_file: type=lint
class $BooksTable extends Books with TableInfo<$BooksTable, Book> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BooksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _sourceIdMeta =
      const VerificationMeta('sourceId');
  @override
  late final GeneratedColumn<String> sourceId = GeneratedColumn<String>(
      'source_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _bookIdMeta = const VerificationMeta('bookId');
  @override
  late final GeneratedColumn<String> bookId = GeneratedColumn<String>(
      'book_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _metaMeta = const VerificationMeta('meta');
  @override
  late final GeneratedColumn<String> meta = GeneratedColumn<String>(
      'meta', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _followedAtMeta =
      const VerificationMeta('followedAt');
  @override
  late final GeneratedColumn<DateTime> followedAt = GeneratedColumn<DateTime>(
      'followed_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, sourceId, bookId, status, meta, followedAt, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'books';
  @override
  VerificationContext validateIntegrity(Insertable<Book> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('source_id')) {
      context.handle(_sourceIdMeta,
          sourceId.isAcceptableOrUnknown(data['source_id']!, _sourceIdMeta));
    } else if (isInserting) {
      context.missing(_sourceIdMeta);
    }
    if (data.containsKey('book_id')) {
      context.handle(_bookIdMeta,
          bookId.isAcceptableOrUnknown(data['book_id']!, _bookIdMeta));
    } else if (isInserting) {
      context.missing(_bookIdMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('meta')) {
      context.handle(
          _metaMeta, meta.isAcceptableOrUnknown(data['meta']!, _metaMeta));
    } else if (isInserting) {
      context.missing(_metaMeta);
    }
    if (data.containsKey('followed_at')) {
      context.handle(
          _followedAtMeta,
          followedAt.isAcceptableOrUnknown(
              data['followed_at']!, _followedAtMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Book map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Book(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      sourceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source_id'])!,
      bookId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}book_id'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      meta: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}meta'])!,
      followedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}followed_at']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $BooksTable createAlias(String alias) {
    return $BooksTable(attachedDatabase, alias);
  }
}

class Book extends DataClass implements Insertable<Book> {
  final int id;
  final String sourceId;
  final String bookId;
  final String status;
  final String meta;
  final DateTime? followedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Book(
      {required this.id,
      required this.sourceId,
      required this.bookId,
      required this.status,
      required this.meta,
      this.followedAt,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['source_id'] = Variable<String>(sourceId);
    map['book_id'] = Variable<String>(bookId);
    map['status'] = Variable<String>(status);
    map['meta'] = Variable<String>(meta);
    if (!nullToAbsent || followedAt != null) {
      map['followed_at'] = Variable<DateTime>(followedAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  BooksCompanion toCompanion(bool nullToAbsent) {
    return BooksCompanion(
      id: Value(id),
      sourceId: Value(sourceId),
      bookId: Value(bookId),
      status: Value(status),
      meta: Value(meta),
      followedAt: followedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(followedAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Book.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Book(
      id: serializer.fromJson<int>(json['id']),
      sourceId: serializer.fromJson<String>(json['sourceId']),
      bookId: serializer.fromJson<String>(json['bookId']),
      status: serializer.fromJson<String>(json['status']),
      meta: serializer.fromJson<String>(json['meta']),
      followedAt: serializer.fromJson<DateTime?>(json['followedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sourceId': serializer.toJson<String>(sourceId),
      'bookId': serializer.toJson<String>(bookId),
      'status': serializer.toJson<String>(status),
      'meta': serializer.toJson<String>(meta),
      'followedAt': serializer.toJson<DateTime?>(followedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Book copyWith(
          {int? id,
          String? sourceId,
          String? bookId,
          String? status,
          String? meta,
          Value<DateTime?> followedAt = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      Book(
        id: id ?? this.id,
        sourceId: sourceId ?? this.sourceId,
        bookId: bookId ?? this.bookId,
        status: status ?? this.status,
        meta: meta ?? this.meta,
        followedAt: followedAt.present ? followedAt.value : this.followedAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Book copyWithCompanion(BooksCompanion data) {
    return Book(
      id: data.id.present ? data.id.value : this.id,
      sourceId: data.sourceId.present ? data.sourceId.value : this.sourceId,
      bookId: data.bookId.present ? data.bookId.value : this.bookId,
      status: data.status.present ? data.status.value : this.status,
      meta: data.meta.present ? data.meta.value : this.meta,
      followedAt:
          data.followedAt.present ? data.followedAt.value : this.followedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Book(')
          ..write('id: $id, ')
          ..write('sourceId: $sourceId, ')
          ..write('bookId: $bookId, ')
          ..write('status: $status, ')
          ..write('meta: $meta, ')
          ..write('followedAt: $followedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, sourceId, bookId, status, meta, followedAt, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Book &&
          other.id == this.id &&
          other.sourceId == this.sourceId &&
          other.bookId == this.bookId &&
          other.status == this.status &&
          other.meta == this.meta &&
          other.followedAt == this.followedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class BooksCompanion extends UpdateCompanion<Book> {
  final Value<int> id;
  final Value<String> sourceId;
  final Value<String> bookId;
  final Value<String> status;
  final Value<String> meta;
  final Value<DateTime?> followedAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const BooksCompanion({
    this.id = const Value.absent(),
    this.sourceId = const Value.absent(),
    this.bookId = const Value.absent(),
    this.status = const Value.absent(),
    this.meta = const Value.absent(),
    this.followedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  BooksCompanion.insert({
    this.id = const Value.absent(),
    required String sourceId,
    required String bookId,
    required String status,
    required String meta,
    this.followedAt = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
  })  : sourceId = Value(sourceId),
        bookId = Value(bookId),
        status = Value(status),
        meta = Value(meta),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Book> custom({
    Expression<int>? id,
    Expression<String>? sourceId,
    Expression<String>? bookId,
    Expression<String>? status,
    Expression<String>? meta,
    Expression<DateTime>? followedAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sourceId != null) 'source_id': sourceId,
      if (bookId != null) 'book_id': bookId,
      if (status != null) 'status': status,
      if (meta != null) 'meta': meta,
      if (followedAt != null) 'followed_at': followedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  BooksCompanion copyWith(
      {Value<int>? id,
      Value<String>? sourceId,
      Value<String>? bookId,
      Value<String>? status,
      Value<String>? meta,
      Value<DateTime?>? followedAt,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return BooksCompanion(
      id: id ?? this.id,
      sourceId: sourceId ?? this.sourceId,
      bookId: bookId ?? this.bookId,
      status: status ?? this.status,
      meta: meta ?? this.meta,
      followedAt: followedAt ?? this.followedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sourceId.present) {
      map['source_id'] = Variable<String>(sourceId.value);
    }
    if (bookId.present) {
      map['book_id'] = Variable<String>(bookId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (meta.present) {
      map['meta'] = Variable<String>(meta.value);
    }
    if (followedAt.present) {
      map['followed_at'] = Variable<DateTime>(followedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BooksCompanion(')
          ..write('id: $id, ')
          ..write('sourceId: $sourceId, ')
          ..write('bookId: $bookId, ')
          ..write('status: $status, ')
          ..write('meta: $meta, ')
          ..write('followedAt: $followedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $HistoryChapsTable extends HistoryChaps
    with TableInfo<$HistoryChapsTable, HistoryChap> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HistoryChapsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _bookMeta = const VerificationMeta('book');
  @override
  late final GeneratedColumn<int> book = GeneratedColumn<int>(
      'book', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _chapterIdMeta =
      const VerificationMeta('chapterId');
  @override
  late final GeneratedColumn<String> chapterId = GeneratedColumn<String>(
      'chapter_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _currentPageMeta =
      const VerificationMeta('currentPage');
  @override
  late final GeneratedColumn<double> currentPage = GeneratedColumn<double>(
      'current_page', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _maxPageMeta =
      const VerificationMeta('maxPage');
  @override
  late final GeneratedColumn<int> maxPage = GeneratedColumn<int>(
      'max_page', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, book, chapterId, currentPage, maxPage, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'history_chaps';
  @override
  VerificationContext validateIntegrity(Insertable<HistoryChap> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('book')) {
      context.handle(
          _bookMeta, book.isAcceptableOrUnknown(data['book']!, _bookMeta));
    } else if (isInserting) {
      context.missing(_bookMeta);
    }
    if (data.containsKey('chapter_id')) {
      context.handle(_chapterIdMeta,
          chapterId.isAcceptableOrUnknown(data['chapter_id']!, _chapterIdMeta));
    } else if (isInserting) {
      context.missing(_chapterIdMeta);
    }
    if (data.containsKey('current_page')) {
      context.handle(
          _currentPageMeta,
          currentPage.isAcceptableOrUnknown(
              data['current_page']!, _currentPageMeta));
    } else if (isInserting) {
      context.missing(_currentPageMeta);
    }
    if (data.containsKey('max_page')) {
      context.handle(_maxPageMeta,
          maxPage.isAcceptableOrUnknown(data['max_page']!, _maxPageMeta));
    } else if (isInserting) {
      context.missing(_maxPageMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HistoryChap map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HistoryChap(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      book: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}book'])!,
      chapterId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}chapter_id'])!,
      currentPage: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}current_page'])!,
      maxPage: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}max_page'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $HistoryChapsTable createAlias(String alias) {
    return $HistoryChapsTable(attachedDatabase, alias);
  }
}

class HistoryChap extends DataClass implements Insertable<HistoryChap> {
  final int id;
  final int book;
  final String chapterId;
  final double currentPage;
  final int maxPage;
  final DateTime createdAt;
  final DateTime updatedAt;
  const HistoryChap(
      {required this.id,
      required this.book,
      required this.chapterId,
      required this.currentPage,
      required this.maxPage,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['book'] = Variable<int>(book);
    map['chapter_id'] = Variable<String>(chapterId);
    map['current_page'] = Variable<double>(currentPage);
    map['max_page'] = Variable<int>(maxPage);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  HistoryChapsCompanion toCompanion(bool nullToAbsent) {
    return HistoryChapsCompanion(
      id: Value(id),
      book: Value(book),
      chapterId: Value(chapterId),
      currentPage: Value(currentPage),
      maxPage: Value(maxPage),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory HistoryChap.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HistoryChap(
      id: serializer.fromJson<int>(json['id']),
      book: serializer.fromJson<int>(json['book']),
      chapterId: serializer.fromJson<String>(json['chapterId']),
      currentPage: serializer.fromJson<double>(json['currentPage']),
      maxPage: serializer.fromJson<int>(json['maxPage']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'book': serializer.toJson<int>(book),
      'chapterId': serializer.toJson<String>(chapterId),
      'currentPage': serializer.toJson<double>(currentPage),
      'maxPage': serializer.toJson<int>(maxPage),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  HistoryChap copyWith(
          {int? id,
          int? book,
          String? chapterId,
          double? currentPage,
          int? maxPage,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      HistoryChap(
        id: id ?? this.id,
        book: book ?? this.book,
        chapterId: chapterId ?? this.chapterId,
        currentPage: currentPage ?? this.currentPage,
        maxPage: maxPage ?? this.maxPage,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  HistoryChap copyWithCompanion(HistoryChapsCompanion data) {
    return HistoryChap(
      id: data.id.present ? data.id.value : this.id,
      book: data.book.present ? data.book.value : this.book,
      chapterId: data.chapterId.present ? data.chapterId.value : this.chapterId,
      currentPage:
          data.currentPage.present ? data.currentPage.value : this.currentPage,
      maxPage: data.maxPage.present ? data.maxPage.value : this.maxPage,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HistoryChap(')
          ..write('id: $id, ')
          ..write('book: $book, ')
          ..write('chapterId: $chapterId, ')
          ..write('currentPage: $currentPage, ')
          ..write('maxPage: $maxPage, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, book, chapterId, currentPage, maxPage, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HistoryChap &&
          other.id == this.id &&
          other.book == this.book &&
          other.chapterId == this.chapterId &&
          other.currentPage == this.currentPage &&
          other.maxPage == this.maxPage &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class HistoryChapsCompanion extends UpdateCompanion<HistoryChap> {
  final Value<int> id;
  final Value<int> book;
  final Value<String> chapterId;
  final Value<double> currentPage;
  final Value<int> maxPage;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const HistoryChapsCompanion({
    this.id = const Value.absent(),
    this.book = const Value.absent(),
    this.chapterId = const Value.absent(),
    this.currentPage = const Value.absent(),
    this.maxPage = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  HistoryChapsCompanion.insert({
    this.id = const Value.absent(),
    required int book,
    required String chapterId,
    required double currentPage,
    required int maxPage,
    required DateTime createdAt,
    required DateTime updatedAt,
  })  : book = Value(book),
        chapterId = Value(chapterId),
        currentPage = Value(currentPage),
        maxPage = Value(maxPage),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<HistoryChap> custom({
    Expression<int>? id,
    Expression<int>? book,
    Expression<String>? chapterId,
    Expression<double>? currentPage,
    Expression<int>? maxPage,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (book != null) 'book': book,
      if (chapterId != null) 'chapter_id': chapterId,
      if (currentPage != null) 'current_page': currentPage,
      if (maxPage != null) 'max_page': maxPage,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  HistoryChapsCompanion copyWith(
      {Value<int>? id,
      Value<int>? book,
      Value<String>? chapterId,
      Value<double>? currentPage,
      Value<int>? maxPage,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return HistoryChapsCompanion(
      id: id ?? this.id,
      book: book ?? this.book,
      chapterId: chapterId ?? this.chapterId,
      currentPage: currentPage ?? this.currentPage,
      maxPage: maxPage ?? this.maxPage,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (book.present) {
      map['book'] = Variable<int>(book.value);
    }
    if (chapterId.present) {
      map['chapter_id'] = Variable<String>(chapterId.value);
    }
    if (currentPage.present) {
      map['current_page'] = Variable<double>(currentPage.value);
    }
    if (maxPage.present) {
      map['max_page'] = Variable<int>(maxPage.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HistoryChapsCompanion(')
          ..write('id: $id, ')
          ..write('book: $book, ')
          ..write('chapterId: $chapterId, ')
          ..write('currentPage: $currentPage, ')
          ..write('maxPage: $maxPage, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $CookieManagersTable extends CookieManagers
    with TableInfo<$CookieManagersTable, CookieManager> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CookieManagersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _sourceIdMeta =
      const VerificationMeta('sourceId');
  @override
  late final GeneratedColumn<String> sourceId = GeneratedColumn<String>(
      'source_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _cookieMeta = const VerificationMeta('cookie');
  @override
  late final GeneratedColumn<String> cookie = GeneratedColumn<String>(
      'cookie', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _userAgentMeta =
      const VerificationMeta('userAgent');
  @override
  late final GeneratedColumn<String> userAgent = GeneratedColumn<String>(
      'user_agent', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _userMeta = const VerificationMeta('user');
  @override
  late final GeneratedColumn<String> user = GeneratedColumn<String>(
      'user', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _userUpdatedAtMeta =
      const VerificationMeta('userUpdatedAt');
  @override
  late final GeneratedColumn<DateTime> userUpdatedAt =
      GeneratedColumn<DateTime>('user_updated_at', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        sourceId,
        cookie,
        userAgent,
        user,
        createdAt,
        userUpdatedAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cookie_managers';
  @override
  VerificationContext validateIntegrity(Insertable<CookieManager> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('source_id')) {
      context.handle(_sourceIdMeta,
          sourceId.isAcceptableOrUnknown(data['source_id']!, _sourceIdMeta));
    } else if (isInserting) {
      context.missing(_sourceIdMeta);
    }
    if (data.containsKey('cookie')) {
      context.handle(_cookieMeta,
          cookie.isAcceptableOrUnknown(data['cookie']!, _cookieMeta));
    }
    if (data.containsKey('user_agent')) {
      context.handle(_userAgentMeta,
          userAgent.isAcceptableOrUnknown(data['user_agent']!, _userAgentMeta));
    }
    if (data.containsKey('user')) {
      context.handle(
          _userMeta, user.isAcceptableOrUnknown(data['user']!, _userMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('user_updated_at')) {
      context.handle(
          _userUpdatedAtMeta,
          userUpdatedAt.isAcceptableOrUnknown(
              data['user_updated_at']!, _userUpdatedAtMeta));
    } else if (isInserting) {
      context.missing(_userUpdatedAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CookieManager map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CookieManager(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      sourceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source_id'])!,
      cookie: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cookie']),
      userAgent: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_agent']),
      user: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      userUpdatedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}user_updated_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $CookieManagersTable createAlias(String alias) {
    return $CookieManagersTable(attachedDatabase, alias);
  }
}

class CookieManager extends DataClass implements Insertable<CookieManager> {
  final int id;
  final String sourceId;
  final String? cookie;
  final String? userAgent;
  final String? user;
  final DateTime createdAt;
  final DateTime userUpdatedAt;
  final DateTime updatedAt;
  const CookieManager(
      {required this.id,
      required this.sourceId,
      this.cookie,
      this.userAgent,
      this.user,
      required this.createdAt,
      required this.userUpdatedAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['source_id'] = Variable<String>(sourceId);
    if (!nullToAbsent || cookie != null) {
      map['cookie'] = Variable<String>(cookie);
    }
    if (!nullToAbsent || userAgent != null) {
      map['user_agent'] = Variable<String>(userAgent);
    }
    if (!nullToAbsent || user != null) {
      map['user'] = Variable<String>(user);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['user_updated_at'] = Variable<DateTime>(userUpdatedAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CookieManagersCompanion toCompanion(bool nullToAbsent) {
    return CookieManagersCompanion(
      id: Value(id),
      sourceId: Value(sourceId),
      cookie:
          cookie == null && nullToAbsent ? const Value.absent() : Value(cookie),
      userAgent: userAgent == null && nullToAbsent
          ? const Value.absent()
          : Value(userAgent),
      user: user == null && nullToAbsent ? const Value.absent() : Value(user),
      createdAt: Value(createdAt),
      userUpdatedAt: Value(userUpdatedAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory CookieManager.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CookieManager(
      id: serializer.fromJson<int>(json['id']),
      sourceId: serializer.fromJson<String>(json['sourceId']),
      cookie: serializer.fromJson<String?>(json['cookie']),
      userAgent: serializer.fromJson<String?>(json['userAgent']),
      user: serializer.fromJson<String?>(json['user']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      userUpdatedAt: serializer.fromJson<DateTime>(json['userUpdatedAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sourceId': serializer.toJson<String>(sourceId),
      'cookie': serializer.toJson<String?>(cookie),
      'userAgent': serializer.toJson<String?>(userAgent),
      'user': serializer.toJson<String?>(user),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'userUpdatedAt': serializer.toJson<DateTime>(userUpdatedAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  CookieManager copyWith(
          {int? id,
          String? sourceId,
          Value<String?> cookie = const Value.absent(),
          Value<String?> userAgent = const Value.absent(),
          Value<String?> user = const Value.absent(),
          DateTime? createdAt,
          DateTime? userUpdatedAt,
          DateTime? updatedAt}) =>
      CookieManager(
        id: id ?? this.id,
        sourceId: sourceId ?? this.sourceId,
        cookie: cookie.present ? cookie.value : this.cookie,
        userAgent: userAgent.present ? userAgent.value : this.userAgent,
        user: user.present ? user.value : this.user,
        createdAt: createdAt ?? this.createdAt,
        userUpdatedAt: userUpdatedAt ?? this.userUpdatedAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  CookieManager copyWithCompanion(CookieManagersCompanion data) {
    return CookieManager(
      id: data.id.present ? data.id.value : this.id,
      sourceId: data.sourceId.present ? data.sourceId.value : this.sourceId,
      cookie: data.cookie.present ? data.cookie.value : this.cookie,
      userAgent: data.userAgent.present ? data.userAgent.value : this.userAgent,
      user: data.user.present ? data.user.value : this.user,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      userUpdatedAt: data.userUpdatedAt.present
          ? data.userUpdatedAt.value
          : this.userUpdatedAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CookieManager(')
          ..write('id: $id, ')
          ..write('sourceId: $sourceId, ')
          ..write('cookie: $cookie, ')
          ..write('userAgent: $userAgent, ')
          ..write('user: $user, ')
          ..write('createdAt: $createdAt, ')
          ..write('userUpdatedAt: $userUpdatedAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, sourceId, cookie, userAgent, user,
      createdAt, userUpdatedAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CookieManager &&
          other.id == this.id &&
          other.sourceId == this.sourceId &&
          other.cookie == this.cookie &&
          other.userAgent == this.userAgent &&
          other.user == this.user &&
          other.createdAt == this.createdAt &&
          other.userUpdatedAt == this.userUpdatedAt &&
          other.updatedAt == this.updatedAt);
}

class CookieManagersCompanion extends UpdateCompanion<CookieManager> {
  final Value<int> id;
  final Value<String> sourceId;
  final Value<String?> cookie;
  final Value<String?> userAgent;
  final Value<String?> user;
  final Value<DateTime> createdAt;
  final Value<DateTime> userUpdatedAt;
  final Value<DateTime> updatedAt;
  const CookieManagersCompanion({
    this.id = const Value.absent(),
    this.sourceId = const Value.absent(),
    this.cookie = const Value.absent(),
    this.userAgent = const Value.absent(),
    this.user = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.userUpdatedAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  CookieManagersCompanion.insert({
    this.id = const Value.absent(),
    required String sourceId,
    this.cookie = const Value.absent(),
    this.userAgent = const Value.absent(),
    this.user = const Value.absent(),
    required DateTime createdAt,
    required DateTime userUpdatedAt,
    required DateTime updatedAt,
  })  : sourceId = Value(sourceId),
        createdAt = Value(createdAt),
        userUpdatedAt = Value(userUpdatedAt),
        updatedAt = Value(updatedAt);
  static Insertable<CookieManager> custom({
    Expression<int>? id,
    Expression<String>? sourceId,
    Expression<String>? cookie,
    Expression<String>? userAgent,
    Expression<String>? user,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? userUpdatedAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sourceId != null) 'source_id': sourceId,
      if (cookie != null) 'cookie': cookie,
      if (userAgent != null) 'user_agent': userAgent,
      if (user != null) 'user': user,
      if (createdAt != null) 'created_at': createdAt,
      if (userUpdatedAt != null) 'user_updated_at': userUpdatedAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  CookieManagersCompanion copyWith(
      {Value<int>? id,
      Value<String>? sourceId,
      Value<String?>? cookie,
      Value<String?>? userAgent,
      Value<String?>? user,
      Value<DateTime>? createdAt,
      Value<DateTime>? userUpdatedAt,
      Value<DateTime>? updatedAt}) {
    return CookieManagersCompanion(
      id: id ?? this.id,
      sourceId: sourceId ?? this.sourceId,
      cookie: cookie ?? this.cookie,
      userAgent: userAgent ?? this.userAgent,
      user: user ?? this.user,
      createdAt: createdAt ?? this.createdAt,
      userUpdatedAt: userUpdatedAt ?? this.userUpdatedAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sourceId.present) {
      map['source_id'] = Variable<String>(sourceId.value);
    }
    if (cookie.present) {
      map['cookie'] = Variable<String>(cookie.value);
    }
    if (userAgent.present) {
      map['user_agent'] = Variable<String>(userAgent.value);
    }
    if (user.present) {
      map['user'] = Variable<String>(user.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (userUpdatedAt.present) {
      map['user_updated_at'] = Variable<DateTime>(userUpdatedAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CookieManagersCompanion(')
          ..write('id: $id, ')
          ..write('sourceId: $sourceId, ')
          ..write('cookie: $cookie, ')
          ..write('userAgent: $userAgent, ')
          ..write('user: $user, ')
          ..write('createdAt: $createdAt, ')
          ..write('userUpdatedAt: $userUpdatedAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $SettingsTable extends Settings with TableInfo<$SettingsTable, Setting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _mangaReadLazyPageMeta =
      const VerificationMeta('mangaReadLazyPage');
  @override
  late final GeneratedColumn<bool> mangaReadLazyPage = GeneratedColumn<bool>(
      'manga_read_lazy_page', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("manga_read_lazy_page" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _pollingIntervalBookMeta =
      const VerificationMeta('pollingIntervalBook');
  @override
  late final GeneratedColumn<int> pollingIntervalBook = GeneratedColumn<int>(
      'polling_interval_book', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: Constant(60 * 60 * 3));
  @override
  List<GeneratedColumn> get $columns =>
      [id, mangaReadLazyPage, pollingIntervalBook];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settings';
  @override
  VerificationContext validateIntegrity(Insertable<Setting> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('manga_read_lazy_page')) {
      context.handle(
          _mangaReadLazyPageMeta,
          mangaReadLazyPage.isAcceptableOrUnknown(
              data['manga_read_lazy_page']!, _mangaReadLazyPageMeta));
    }
    if (data.containsKey('polling_interval_book')) {
      context.handle(
          _pollingIntervalBookMeta,
          pollingIntervalBook.isAcceptableOrUnknown(
              data['polling_interval_book']!, _pollingIntervalBookMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Setting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Setting(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      mangaReadLazyPage: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}manga_read_lazy_page'])!,
      pollingIntervalBook: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}polling_interval_book'])!,
    );
  }

  @override
  $SettingsTable createAlias(String alias) {
    return $SettingsTable(attachedDatabase, alias);
  }
}

class Setting extends DataClass implements Insertable<Setting> {
  final int id;
  final bool mangaReadLazyPage;
  final int pollingIntervalBook;
  const Setting(
      {required this.id,
      required this.mangaReadLazyPage,
      required this.pollingIntervalBook});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['manga_read_lazy_page'] = Variable<bool>(mangaReadLazyPage);
    map['polling_interval_book'] = Variable<int>(pollingIntervalBook);
    return map;
  }

  SettingsCompanion toCompanion(bool nullToAbsent) {
    return SettingsCompanion(
      id: Value(id),
      mangaReadLazyPage: Value(mangaReadLazyPage),
      pollingIntervalBook: Value(pollingIntervalBook),
    );
  }

  factory Setting.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Setting(
      id: serializer.fromJson<int>(json['id']),
      mangaReadLazyPage: serializer.fromJson<bool>(json['mangaReadLazyPage']),
      pollingIntervalBook:
          serializer.fromJson<int>(json['pollingIntervalBook']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'mangaReadLazyPage': serializer.toJson<bool>(mangaReadLazyPage),
      'pollingIntervalBook': serializer.toJson<int>(pollingIntervalBook),
    };
  }

  Setting copyWith(
          {int? id, bool? mangaReadLazyPage, int? pollingIntervalBook}) =>
      Setting(
        id: id ?? this.id,
        mangaReadLazyPage: mangaReadLazyPage ?? this.mangaReadLazyPage,
        pollingIntervalBook: pollingIntervalBook ?? this.pollingIntervalBook,
      );
  Setting copyWithCompanion(SettingsCompanion data) {
    return Setting(
      id: data.id.present ? data.id.value : this.id,
      mangaReadLazyPage: data.mangaReadLazyPage.present
          ? data.mangaReadLazyPage.value
          : this.mangaReadLazyPage,
      pollingIntervalBook: data.pollingIntervalBook.present
          ? data.pollingIntervalBook.value
          : this.pollingIntervalBook,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Setting(')
          ..write('id: $id, ')
          ..write('mangaReadLazyPage: $mangaReadLazyPage, ')
          ..write('pollingIntervalBook: $pollingIntervalBook')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, mangaReadLazyPage, pollingIntervalBook);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Setting &&
          other.id == this.id &&
          other.mangaReadLazyPage == this.mangaReadLazyPage &&
          other.pollingIntervalBook == this.pollingIntervalBook);
}

class SettingsCompanion extends UpdateCompanion<Setting> {
  final Value<int> id;
  final Value<bool> mangaReadLazyPage;
  final Value<int> pollingIntervalBook;
  const SettingsCompanion({
    this.id = const Value.absent(),
    this.mangaReadLazyPage = const Value.absent(),
    this.pollingIntervalBook = const Value.absent(),
  });
  SettingsCompanion.insert({
    this.id = const Value.absent(),
    this.mangaReadLazyPage = const Value.absent(),
    this.pollingIntervalBook = const Value.absent(),
  });
  static Insertable<Setting> custom({
    Expression<int>? id,
    Expression<bool>? mangaReadLazyPage,
    Expression<int>? pollingIntervalBook,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (mangaReadLazyPage != null) 'manga_read_lazy_page': mangaReadLazyPage,
      if (pollingIntervalBook != null)
        'polling_interval_book': pollingIntervalBook,
    });
  }

  SettingsCompanion copyWith(
      {Value<int>? id,
      Value<bool>? mangaReadLazyPage,
      Value<int>? pollingIntervalBook}) {
    return SettingsCompanion(
      id: id ?? this.id,
      mangaReadLazyPage: mangaReadLazyPage ?? this.mangaReadLazyPage,
      pollingIntervalBook: pollingIntervalBook ?? this.pollingIntervalBook,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (mangaReadLazyPage.present) {
      map['manga_read_lazy_page'] = Variable<bool>(mangaReadLazyPage.value);
    }
    if (pollingIntervalBook.present) {
      map['polling_interval_book'] = Variable<int>(pollingIntervalBook.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsCompanion(')
          ..write('id: $id, ')
          ..write('mangaReadLazyPage: $mangaReadLazyPage, ')
          ..write('pollingIntervalBook: $pollingIntervalBook')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $BooksTable books = $BooksTable(this);
  late final $HistoryChapsTable historyChaps = $HistoryChapsTable(this);
  late final $CookieManagersTable cookieManagers = $CookieManagersTable(this);
  late final $SettingsTable settings = $SettingsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [books, historyChaps, cookieManagers, settings];
}

typedef $$BooksTableCreateCompanionBuilder = BooksCompanion Function({
  Value<int> id,
  required String sourceId,
  required String bookId,
  required String status,
  required String meta,
  Value<DateTime?> followedAt,
  required DateTime createdAt,
  required DateTime updatedAt,
});
typedef $$BooksTableUpdateCompanionBuilder = BooksCompanion Function({
  Value<int> id,
  Value<String> sourceId,
  Value<String> bookId,
  Value<String> status,
  Value<String> meta,
  Value<DateTime?> followedAt,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

class $$BooksTableFilterComposer extends Composer<_$AppDatabase, $BooksTable> {
  $$BooksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sourceId => $composableBuilder(
      column: $table.sourceId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get bookId => $composableBuilder(
      column: $table.bookId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get meta => $composableBuilder(
      column: $table.meta, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get followedAt => $composableBuilder(
      column: $table.followedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$BooksTableOrderingComposer
    extends Composer<_$AppDatabase, $BooksTable> {
  $$BooksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sourceId => $composableBuilder(
      column: $table.sourceId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get bookId => $composableBuilder(
      column: $table.bookId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get meta => $composableBuilder(
      column: $table.meta, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get followedAt => $composableBuilder(
      column: $table.followedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$BooksTableAnnotationComposer
    extends Composer<_$AppDatabase, $BooksTable> {
  $$BooksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get sourceId =>
      $composableBuilder(column: $table.sourceId, builder: (column) => column);

  GeneratedColumn<String> get bookId =>
      $composableBuilder(column: $table.bookId, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get meta =>
      $composableBuilder(column: $table.meta, builder: (column) => column);

  GeneratedColumn<DateTime> get followedAt => $composableBuilder(
      column: $table.followedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$BooksTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BooksTable,
    Book,
    $$BooksTableFilterComposer,
    $$BooksTableOrderingComposer,
    $$BooksTableAnnotationComposer,
    $$BooksTableCreateCompanionBuilder,
    $$BooksTableUpdateCompanionBuilder,
    (Book, BaseReferences<_$AppDatabase, $BooksTable, Book>),
    Book,
    PrefetchHooks Function()> {
  $$BooksTableTableManager(_$AppDatabase db, $BooksTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BooksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BooksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BooksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> sourceId = const Value.absent(),
            Value<String> bookId = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String> meta = const Value.absent(),
            Value<DateTime?> followedAt = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              BooksCompanion(
            id: id,
            sourceId: sourceId,
            bookId: bookId,
            status: status,
            meta: meta,
            followedAt: followedAt,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String sourceId,
            required String bookId,
            required String status,
            required String meta,
            Value<DateTime?> followedAt = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
          }) =>
              BooksCompanion.insert(
            id: id,
            sourceId: sourceId,
            bookId: bookId,
            status: status,
            meta: meta,
            followedAt: followedAt,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$BooksTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $BooksTable,
    Book,
    $$BooksTableFilterComposer,
    $$BooksTableOrderingComposer,
    $$BooksTableAnnotationComposer,
    $$BooksTableCreateCompanionBuilder,
    $$BooksTableUpdateCompanionBuilder,
    (Book, BaseReferences<_$AppDatabase, $BooksTable, Book>),
    Book,
    PrefetchHooks Function()>;
typedef $$HistoryChapsTableCreateCompanionBuilder = HistoryChapsCompanion
    Function({
  Value<int> id,
  required int book,
  required String chapterId,
  required double currentPage,
  required int maxPage,
  required DateTime createdAt,
  required DateTime updatedAt,
});
typedef $$HistoryChapsTableUpdateCompanionBuilder = HistoryChapsCompanion
    Function({
  Value<int> id,
  Value<int> book,
  Value<String> chapterId,
  Value<double> currentPage,
  Value<int> maxPage,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

class $$HistoryChapsTableFilterComposer
    extends Composer<_$AppDatabase, $HistoryChapsTable> {
  $$HistoryChapsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get book => $composableBuilder(
      column: $table.book, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get chapterId => $composableBuilder(
      column: $table.chapterId, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get currentPage => $composableBuilder(
      column: $table.currentPage, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get maxPage => $composableBuilder(
      column: $table.maxPage, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$HistoryChapsTableOrderingComposer
    extends Composer<_$AppDatabase, $HistoryChapsTable> {
  $$HistoryChapsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get book => $composableBuilder(
      column: $table.book, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get chapterId => $composableBuilder(
      column: $table.chapterId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get currentPage => $composableBuilder(
      column: $table.currentPage, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get maxPage => $composableBuilder(
      column: $table.maxPage, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$HistoryChapsTableAnnotationComposer
    extends Composer<_$AppDatabase, $HistoryChapsTable> {
  $$HistoryChapsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get book =>
      $composableBuilder(column: $table.book, builder: (column) => column);

  GeneratedColumn<String> get chapterId =>
      $composableBuilder(column: $table.chapterId, builder: (column) => column);

  GeneratedColumn<double> get currentPage => $composableBuilder(
      column: $table.currentPage, builder: (column) => column);

  GeneratedColumn<int> get maxPage =>
      $composableBuilder(column: $table.maxPage, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$HistoryChapsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $HistoryChapsTable,
    HistoryChap,
    $$HistoryChapsTableFilterComposer,
    $$HistoryChapsTableOrderingComposer,
    $$HistoryChapsTableAnnotationComposer,
    $$HistoryChapsTableCreateCompanionBuilder,
    $$HistoryChapsTableUpdateCompanionBuilder,
    (
      HistoryChap,
      BaseReferences<_$AppDatabase, $HistoryChapsTable, HistoryChap>
    ),
    HistoryChap,
    PrefetchHooks Function()> {
  $$HistoryChapsTableTableManager(_$AppDatabase db, $HistoryChapsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HistoryChapsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HistoryChapsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HistoryChapsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> book = const Value.absent(),
            Value<String> chapterId = const Value.absent(),
            Value<double> currentPage = const Value.absent(),
            Value<int> maxPage = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              HistoryChapsCompanion(
            id: id,
            book: book,
            chapterId: chapterId,
            currentPage: currentPage,
            maxPage: maxPage,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int book,
            required String chapterId,
            required double currentPage,
            required int maxPage,
            required DateTime createdAt,
            required DateTime updatedAt,
          }) =>
              HistoryChapsCompanion.insert(
            id: id,
            book: book,
            chapterId: chapterId,
            currentPage: currentPage,
            maxPage: maxPage,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$HistoryChapsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $HistoryChapsTable,
    HistoryChap,
    $$HistoryChapsTableFilterComposer,
    $$HistoryChapsTableOrderingComposer,
    $$HistoryChapsTableAnnotationComposer,
    $$HistoryChapsTableCreateCompanionBuilder,
    $$HistoryChapsTableUpdateCompanionBuilder,
    (
      HistoryChap,
      BaseReferences<_$AppDatabase, $HistoryChapsTable, HistoryChap>
    ),
    HistoryChap,
    PrefetchHooks Function()>;
typedef $$CookieManagersTableCreateCompanionBuilder = CookieManagersCompanion
    Function({
  Value<int> id,
  required String sourceId,
  Value<String?> cookie,
  Value<String?> userAgent,
  Value<String?> user,
  required DateTime createdAt,
  required DateTime userUpdatedAt,
  required DateTime updatedAt,
});
typedef $$CookieManagersTableUpdateCompanionBuilder = CookieManagersCompanion
    Function({
  Value<int> id,
  Value<String> sourceId,
  Value<String?> cookie,
  Value<String?> userAgent,
  Value<String?> user,
  Value<DateTime> createdAt,
  Value<DateTime> userUpdatedAt,
  Value<DateTime> updatedAt,
});

class $$CookieManagersTableFilterComposer
    extends Composer<_$AppDatabase, $CookieManagersTable> {
  $$CookieManagersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sourceId => $composableBuilder(
      column: $table.sourceId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cookie => $composableBuilder(
      column: $table.cookie, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userAgent => $composableBuilder(
      column: $table.userAgent, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get user => $composableBuilder(
      column: $table.user, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get userUpdatedAt => $composableBuilder(
      column: $table.userUpdatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$CookieManagersTableOrderingComposer
    extends Composer<_$AppDatabase, $CookieManagersTable> {
  $$CookieManagersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sourceId => $composableBuilder(
      column: $table.sourceId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cookie => $composableBuilder(
      column: $table.cookie, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userAgent => $composableBuilder(
      column: $table.userAgent, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get user => $composableBuilder(
      column: $table.user, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get userUpdatedAt => $composableBuilder(
      column: $table.userUpdatedAt,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$CookieManagersTableAnnotationComposer
    extends Composer<_$AppDatabase, $CookieManagersTable> {
  $$CookieManagersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get sourceId =>
      $composableBuilder(column: $table.sourceId, builder: (column) => column);

  GeneratedColumn<String> get cookie =>
      $composableBuilder(column: $table.cookie, builder: (column) => column);

  GeneratedColumn<String> get userAgent =>
      $composableBuilder(column: $table.userAgent, builder: (column) => column);

  GeneratedColumn<String> get user =>
      $composableBuilder(column: $table.user, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get userUpdatedAt => $composableBuilder(
      column: $table.userUpdatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$CookieManagersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CookieManagersTable,
    CookieManager,
    $$CookieManagersTableFilterComposer,
    $$CookieManagersTableOrderingComposer,
    $$CookieManagersTableAnnotationComposer,
    $$CookieManagersTableCreateCompanionBuilder,
    $$CookieManagersTableUpdateCompanionBuilder,
    (
      CookieManager,
      BaseReferences<_$AppDatabase, $CookieManagersTable, CookieManager>
    ),
    CookieManager,
    PrefetchHooks Function()> {
  $$CookieManagersTableTableManager(
      _$AppDatabase db, $CookieManagersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CookieManagersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CookieManagersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CookieManagersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> sourceId = const Value.absent(),
            Value<String?> cookie = const Value.absent(),
            Value<String?> userAgent = const Value.absent(),
            Value<String?> user = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> userUpdatedAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              CookieManagersCompanion(
            id: id,
            sourceId: sourceId,
            cookie: cookie,
            userAgent: userAgent,
            user: user,
            createdAt: createdAt,
            userUpdatedAt: userUpdatedAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String sourceId,
            Value<String?> cookie = const Value.absent(),
            Value<String?> userAgent = const Value.absent(),
            Value<String?> user = const Value.absent(),
            required DateTime createdAt,
            required DateTime userUpdatedAt,
            required DateTime updatedAt,
          }) =>
              CookieManagersCompanion.insert(
            id: id,
            sourceId: sourceId,
            cookie: cookie,
            userAgent: userAgent,
            user: user,
            createdAt: createdAt,
            userUpdatedAt: userUpdatedAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CookieManagersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CookieManagersTable,
    CookieManager,
    $$CookieManagersTableFilterComposer,
    $$CookieManagersTableOrderingComposer,
    $$CookieManagersTableAnnotationComposer,
    $$CookieManagersTableCreateCompanionBuilder,
    $$CookieManagersTableUpdateCompanionBuilder,
    (
      CookieManager,
      BaseReferences<_$AppDatabase, $CookieManagersTable, CookieManager>
    ),
    CookieManager,
    PrefetchHooks Function()>;
typedef $$SettingsTableCreateCompanionBuilder = SettingsCompanion Function({
  Value<int> id,
  Value<bool> mangaReadLazyPage,
  Value<int> pollingIntervalBook,
});
typedef $$SettingsTableUpdateCompanionBuilder = SettingsCompanion Function({
  Value<int> id,
  Value<bool> mangaReadLazyPage,
  Value<int> pollingIntervalBook,
});

class $$SettingsTableFilterComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get mangaReadLazyPage => $composableBuilder(
      column: $table.mangaReadLazyPage,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get pollingIntervalBook => $composableBuilder(
      column: $table.pollingIntervalBook,
      builder: (column) => ColumnFilters(column));
}

class $$SettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get mangaReadLazyPage => $composableBuilder(
      column: $table.mangaReadLazyPage,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get pollingIntervalBook => $composableBuilder(
      column: $table.pollingIntervalBook,
      builder: (column) => ColumnOrderings(column));
}

class $$SettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get mangaReadLazyPage => $composableBuilder(
      column: $table.mangaReadLazyPage, builder: (column) => column);

  GeneratedColumn<int> get pollingIntervalBook => $composableBuilder(
      column: $table.pollingIntervalBook, builder: (column) => column);
}

class $$SettingsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SettingsTable,
    Setting,
    $$SettingsTableFilterComposer,
    $$SettingsTableOrderingComposer,
    $$SettingsTableAnnotationComposer,
    $$SettingsTableCreateCompanionBuilder,
    $$SettingsTableUpdateCompanionBuilder,
    (Setting, BaseReferences<_$AppDatabase, $SettingsTable, Setting>),
    Setting,
    PrefetchHooks Function()> {
  $$SettingsTableTableManager(_$AppDatabase db, $SettingsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<bool> mangaReadLazyPage = const Value.absent(),
            Value<int> pollingIntervalBook = const Value.absent(),
          }) =>
              SettingsCompanion(
            id: id,
            mangaReadLazyPage: mangaReadLazyPage,
            pollingIntervalBook: pollingIntervalBook,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<bool> mangaReadLazyPage = const Value.absent(),
            Value<int> pollingIntervalBook = const Value.absent(),
          }) =>
              SettingsCompanion.insert(
            id: id,
            mangaReadLazyPage: mangaReadLazyPage,
            pollingIntervalBook: pollingIntervalBook,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SettingsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SettingsTable,
    Setting,
    $$SettingsTableFilterComposer,
    $$SettingsTableOrderingComposer,
    $$SettingsTableAnnotationComposer,
    $$SettingsTableCreateCompanionBuilder,
    $$SettingsTableUpdateCompanionBuilder,
    (Setting, BaseReferences<_$AppDatabase, $SettingsTable, Setting>),
    Setting,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$BooksTableTableManager get books =>
      $$BooksTableTableManager(_db, _db.books);
  $$HistoryChapsTableTableManager get historyChaps =>
      $$HistoryChapsTableTableManager(_db, _db.historyChaps);
  $$CookieManagersTableTableManager get cookieManagers =>
      $$CookieManagersTableTableManager(_db, _db.cookieManagers);
  $$SettingsTableTableManager get settings =>
      $$SettingsTableTableManager(_db, _db.settings);
}

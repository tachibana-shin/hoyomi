// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SettingsStore on SettingsStoreBase, Store {
  late final _$pollingIntervalBookAtom =
      Atom(name: 'SettingsStoreBase.pollingIntervalBook', context: context);

  @override
  int get pollingIntervalBook {
    _$pollingIntervalBookAtom.reportRead();
    return super.pollingIntervalBook;
  }

  @override
  set pollingIntervalBook(int value) {
    _$pollingIntervalBookAtom.reportWrite(value, super.pollingIntervalBook, () {
      super.pollingIntervalBook = value;
    });
  }

  @override
  String toString() {
    return '''
pollingIntervalBook: ${pollingIntervalBook}
    ''';
  }
}

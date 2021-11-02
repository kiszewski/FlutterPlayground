// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watch_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WatchStore on _WatchStoreBase, Store {
  final _$diffSmallPointerAtom = Atom(name: '_WatchStoreBase.diffSmallPointer');

  @override
  double get diffSmallPointer {
    _$diffSmallPointerAtom.reportRead();
    return super.diffSmallPointer;
  }

  @override
  set diffSmallPointer(double value) {
    _$diffSmallPointerAtom.reportWrite(value, super.diffSmallPointer, () {
      super.diffSmallPointer = value;
    });
  }

  final _$diffBiggerPointerAtom =
      Atom(name: '_WatchStoreBase.diffBiggerPointer');

  @override
  double get diffBiggerPointer {
    _$diffBiggerPointerAtom.reportRead();
    return super.diffBiggerPointer;
  }

  @override
  set diffBiggerPointer(double value) {
    _$diffBiggerPointerAtom.reportWrite(value, super.diffBiggerPointer, () {
      super.diffBiggerPointer = value;
    });
  }

  final _$startPositionAtom = Atom(name: '_WatchStoreBase.startPosition');

  @override
  ClockPositions get startPosition {
    _$startPositionAtom.reportRead();
    return super.startPosition;
  }

  @override
  set startPosition(ClockPositions value) {
    _$startPositionAtom.reportWrite(value, super.startPosition, () {
      super.startPosition = value;
    });
  }

  final _$endPositionAtom = Atom(name: '_WatchStoreBase.endPosition');

  @override
  ClockPositions get endPosition {
    _$endPositionAtom.reportRead();
    return super.endPosition;
  }

  @override
  set endPosition(ClockPositions value) {
    _$endPositionAtom.reportWrite(value, super.endPosition, () {
      super.endPosition = value;
    });
  }

  final _$_WatchStoreBaseActionController =
      ActionController(name: '_WatchStoreBase');

  @override
  dynamic setStartPosition(ClockPositions value) {
    final _$actionInfo = _$_WatchStoreBaseActionController.startAction(
        name: '_WatchStoreBase.setStartPosition');
    try {
      return super.setStartPosition(value);
    } finally {
      _$_WatchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEndPosition(ClockPositions end) {
    final _$actionInfo = _$_WatchStoreBaseActionController.startAction(
        name: '_WatchStoreBase.setEndPosition');
    try {
      return super.setEndPosition(end);
    } finally {
      _$_WatchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
diffSmallPointer: ${diffSmallPointer},
diffBiggerPointer: ${diffBiggerPointer},
startPosition: ${startPosition},
endPosition: ${endPosition}
    ''';
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watch_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WatchStore on _WatchStoreBase, Store {
  final _$piAlreadyWalkedAtom = Atom(name: '_WatchStoreBase.piAlreadyWalked');

  @override
  double get piAlreadyWalked {
    _$piAlreadyWalkedAtom.reportRead();
    return super.piAlreadyWalked;
  }

  @override
  set piAlreadyWalked(double value) {
    _$piAlreadyWalkedAtom.reportWrite(value, super.piAlreadyWalked, () {
      super.piAlreadyWalked = value;
    });
  }

  final _$qtdPiToWalkAtom = Atom(name: '_WatchStoreBase.qtdPiToWalk');

  @override
  double get qtdPiToWalk {
    _$qtdPiToWalkAtom.reportRead();
    return super.qtdPiToWalk;
  }

  @override
  set qtdPiToWalk(double value) {
    _$qtdPiToWalkAtom.reportWrite(value, super.qtdPiToWalk, () {
      super.qtdPiToWalk = value;
    });
  }

  final _$piAlreadyWalkedBiggerPointerAtom =
      Atom(name: '_WatchStoreBase.piAlreadyWalkedBiggerPointer');

  @override
  double get piAlreadyWalkedBiggerPointer {
    _$piAlreadyWalkedBiggerPointerAtom.reportRead();
    return super.piAlreadyWalkedBiggerPointer;
  }

  @override
  set piAlreadyWalkedBiggerPointer(double value) {
    _$piAlreadyWalkedBiggerPointerAtom
        .reportWrite(value, super.piAlreadyWalkedBiggerPointer, () {
      super.piAlreadyWalkedBiggerPointer = value;
    });
  }

  final _$qtdPiToWalkBiggerPointerAtom =
      Atom(name: '_WatchStoreBase.qtdPiToWalkBiggerPointer');

  @override
  double get qtdPiToWalkBiggerPointer {
    _$qtdPiToWalkBiggerPointerAtom.reportRead();
    return super.qtdPiToWalkBiggerPointer;
  }

  @override
  set qtdPiToWalkBiggerPointer(double value) {
    _$qtdPiToWalkBiggerPointerAtom
        .reportWrite(value, super.qtdPiToWalkBiggerPointer, () {
      super.qtdPiToWalkBiggerPointer = value;
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
  dynamic setEndPosition(ClockPositions value) {
    final _$actionInfo = _$_WatchStoreBaseActionController.startAction(
        name: '_WatchStoreBase.setEndPosition');
    try {
      return super.setEndPosition(value);
    } finally {
      _$_WatchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic moveHalfQuarter() {
    final _$actionInfo = _$_WatchStoreBaseActionController.startAction(
        name: '_WatchStoreBase.moveHalfQuarter');
    try {
      return super.moveHalfQuarter();
    } finally {
      _$_WatchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic moveOneQuarter() {
    final _$actionInfo = _$_WatchStoreBaseActionController.startAction(
        name: '_WatchStoreBase.moveOneQuarter');
    try {
      return super.moveOneQuarter();
    } finally {
      _$_WatchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic moveTwoQuarter() {
    final _$actionInfo = _$_WatchStoreBaseActionController.startAction(
        name: '_WatchStoreBase.moveTwoQuarter');
    try {
      return super.moveTwoQuarter();
    } finally {
      _$_WatchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic moveThreeQuarter() {
    final _$actionInfo = _$_WatchStoreBaseActionController.startAction(
        name: '_WatchStoreBase.moveThreeQuarter');
    try {
      return super.moveThreeQuarter();
    } finally {
      _$_WatchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic moveHalfQuarterBiggerPointer() {
    final _$actionInfo = _$_WatchStoreBaseActionController.startAction(
        name: '_WatchStoreBase.moveHalfQuarterBiggerPointer');
    try {
      return super.moveHalfQuarterBiggerPointer();
    } finally {
      _$_WatchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic moveOneQuarterBiggerPointer() {
    final _$actionInfo = _$_WatchStoreBaseActionController.startAction(
        name: '_WatchStoreBase.moveOneQuarterBiggerPointer');
    try {
      return super.moveOneQuarterBiggerPointer();
    } finally {
      _$_WatchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic moveTwoQuarterBiggerPointer() {
    final _$actionInfo = _$_WatchStoreBaseActionController.startAction(
        name: '_WatchStoreBase.moveTwoQuarterBiggerPointer');
    try {
      return super.moveTwoQuarterBiggerPointer();
    } finally {
      _$_WatchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic moveThreeQuarterBiggerPointer() {
    final _$actionInfo = _$_WatchStoreBaseActionController.startAction(
        name: '_WatchStoreBase.moveThreeQuarterBiggerPointer');
    try {
      return super.moveThreeQuarterBiggerPointer();
    } finally {
      _$_WatchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic calculate() {
    final _$actionInfo = _$_WatchStoreBaseActionController.startAction(
        name: '_WatchStoreBase.calculate');
    try {
      return super.calculate();
    } finally {
      _$_WatchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
piAlreadyWalked: ${piAlreadyWalked},
qtdPiToWalk: ${qtdPiToWalk},
piAlreadyWalkedBiggerPointer: ${piAlreadyWalkedBiggerPointer},
qtdPiToWalkBiggerPointer: ${qtdPiToWalkBiggerPointer},
startPosition: ${startPosition},
endPosition: ${endPosition}
    ''';
  }
}

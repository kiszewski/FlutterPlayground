// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CounterStore on _CounterStoreBase, Store {
  Computed<String>? _$minuteComputed;

  @override
  String get minute =>
      (_$minuteComputed ??= Computed<String>(() => super.minute,
              name: '_CounterStoreBase.minute'))
          .value;
  Computed<String>? _$secondComputed;

  @override
  String get second =>
      (_$secondComputed ??= Computed<String>(() => super.second,
              name: '_CounterStoreBase.second'))
          .value;
  Computed<String>? _$previousSecondComputed;

  @override
  String get previousSecond =>
      (_$previousSecondComputed ??= Computed<String>(() => super.previousSecond,
              name: '_CounterStoreBase.previousSecond'))
          .value;

  final _$_minutesAtom = Atom(name: '_CounterStoreBase._minutes');

  @override
  int get _minutes {
    _$_minutesAtom.reportRead();
    return super._minutes;
  }

  @override
  set _minutes(int value) {
    _$_minutesAtom.reportWrite(value, super._minutes, () {
      super._minutes = value;
    });
  }

  final _$_secondsAtom = Atom(name: '_CounterStoreBase._seconds');

  @override
  int get _seconds {
    _$_secondsAtom.reportRead();
    return super._seconds;
  }

  @override
  set _seconds(int value) {
    _$_secondsAtom.reportWrite(value, super._seconds, () {
      super._seconds = value;
    });
  }

  final _$isDecreasingAtom = Atom(name: '_CounterStoreBase.isDecreasing');

  @override
  bool get isDecreasing {
    _$isDecreasingAtom.reportRead();
    return super.isDecreasing;
  }

  @override
  set isDecreasing(bool value) {
    _$isDecreasingAtom.reportWrite(value, super.isDecreasing, () {
      super.isDecreasing = value;
    });
  }

  final _$previousMinuteAtom = Atom(name: '_CounterStoreBase.previousMinute');

  @override
  String get previousMinute {
    _$previousMinuteAtom.reportRead();
    return super.previousMinute;
  }

  @override
  set previousMinute(String value) {
    _$previousMinuteAtom.reportWrite(value, super.previousMinute, () {
      super.previousMinute = value;
    });
  }

  final _$decrementAsyncAction = AsyncAction('_CounterStoreBase.decrement');

  @override
  Future<dynamic> decrement() {
    return _$decrementAsyncAction.run(() => super.decrement());
  }

  final _$_CounterStoreBaseActionController =
      ActionController(name: '_CounterStoreBase');

  @override
  dynamic setMinutes(int value) {
    final _$actionInfo = _$_CounterStoreBaseActionController.startAction(
        name: '_CounterStoreBase.setMinutes');
    try {
      return super.setMinutes(value);
    } finally {
      _$_CounterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSeconds(int value) {
    final _$actionInfo = _$_CounterStoreBaseActionController.startAction(
        name: '_CounterStoreBase.setSeconds');
    try {
      return super.setSeconds(value);
    } finally {
      _$_CounterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic stopCounter() {
    final _$actionInfo = _$_CounterStoreBaseActionController.startAction(
        name: '_CounterStoreBase.stopCounter');
    try {
      return super.stopCounter();
    } finally {
      _$_CounterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isDecreasing: ${isDecreasing},
previousMinute: ${previousMinute},
minute: ${minute},
second: ${second},
previousSecond: ${previousSecond}
    ''';
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CounterStore on _CounterStoreBase, Store {
  Computed<String>? _$_textCounterComputed;

  @override
  String get _textCounter =>
      (_$_textCounterComputed ??= Computed<String>(() => super._textCounter,
              name: '_CounterStoreBase._textCounter'))
          .value;
  Computed<String>? _$rightCounterComputed;

  @override
  String get rightCounter =>
      (_$rightCounterComputed ??= Computed<String>(() => super.rightCounter,
              name: '_CounterStoreBase.rightCounter'))
          .value;
  Computed<String>? _$leftCounterComputed;

  @override
  String get leftCounter =>
      (_$leftCounterComputed ??= Computed<String>(() => super.leftCounter,
              name: '_CounterStoreBase.leftCounter'))
          .value;
  Computed<String>? _$_previousTextCounterComputed;

  @override
  String get _previousTextCounter => (_$_previousTextCounterComputed ??=
          Computed<String>(() => super._previousTextCounter,
              name: '_CounterStoreBase._previousTextCounter'))
      .value;
  Computed<String>? _$previousRightCounterComputed;

  @override
  String get previousRightCounter => (_$previousRightCounterComputed ??=
          Computed<String>(() => super.previousRightCounter,
              name: '_CounterStoreBase.previousRightCounter'))
      .value;
  Computed<String>? _$previousLeftCounterComputed;

  @override
  String get previousLeftCounter => (_$previousLeftCounterComputed ??=
          Computed<String>(() => super.previousLeftCounter,
              name: '_CounterStoreBase.previousLeftCounter'))
      .value;

  final _$counterAtom = Atom(name: '_CounterStoreBase.counter');

  @override
  int get counter {
    _$counterAtom.reportRead();
    return super.counter;
  }

  @override
  set counter(int value) {
    _$counterAtom.reportWrite(value, super.counter, () {
      super.counter = value;
    });
  }

  final _$formCounterAtom = Atom(name: '_CounterStoreBase.formCounter');

  @override
  String get formCounter {
    _$formCounterAtom.reportRead();
    return super.formCounter;
  }

  @override
  set formCounter(String value) {
    _$formCounterAtom.reportWrite(value, super.formCounter, () {
      super.formCounter = value;
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

  final _$decrementAsyncAction = AsyncAction('_CounterStoreBase.decrement');

  @override
  Future<dynamic> decrement() {
    return _$decrementAsyncAction.run(() => super.decrement());
  }

  final _$_CounterStoreBaseActionController =
      ActionController(name: '_CounterStoreBase');

  @override
  dynamic setCounter(int value) {
    final _$actionInfo = _$_CounterStoreBaseActionController.startAction(
        name: '_CounterStoreBase.setCounter');
    try {
      return super.setCounter(value);
    } finally {
      _$_CounterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFormCounter(String value) {
    final _$actionInfo = _$_CounterStoreBaseActionController.startAction(
        name: '_CounterStoreBase.setFormCounter');
    try {
      return super.setFormCounter(value);
    } finally {
      _$_CounterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _setIsDecreasing(bool value) {
    final _$actionInfo = _$_CounterStoreBaseActionController.startAction(
        name: '_CounterStoreBase._setIsDecreasing');
    try {
      return super._setIsDecreasing(value);
    } finally {
      _$_CounterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
counter: ${counter},
formCounter: ${formCounter},
isDecreasing: ${isDecreasing},
rightCounter: ${rightCounter},
leftCounter: ${leftCounter},
previousRightCounter: ${previousRightCounter},
previousLeftCounter: ${previousLeftCounter}
    ''';
  }
}

import 'dart:async';

import 'package:mobx/mobx.dart';
part 'counter_store.g.dart';

class CounterStore = _CounterStoreBase with _$CounterStore;

abstract class _CounterStoreBase with Store {
  @observable
  int _minutes = 0;
  @action
  setMinutes(int value) => _minutes = value;

  @observable
  int _seconds = 0;
  @action
  setSeconds(int value) => _seconds = value;

  Timer _timer = Timer.periodic(Duration(seconds: 0), (_) {})..cancel();

  @observable
  bool isDecreasing = false;

  @action
  Future decrement() async {
    isDecreasing = true;
    _timer = Timer.periodic(Duration(seconds: 1), (_timer) {
      if (_minutes > 9) {
        previousMinute = _minutes.toString();
      } else {
        previousMinute = '0$_minutes';
      }
      if (_seconds <= 0) {
        setSeconds(59);
        if (_minutes != 0) {
          setMinutes(_minutes - 1);
        } else {
          isDecreasing = false;

          _timer.cancel();
        }
      } else {
        setSeconds(_seconds - 1);
      }

      // print('TIMEs: $_minutes : $_seconds');
      // print('TIME: $minute : $second');
      // print('PREVIOUS TIME: $previousMinute : $previousSecond');
    });
  }

  @computed
  String get minute {
    if (_minutes > 9) {
      return _minutes.toString();
    } else {
      return '0$_minutes';
    }
  }

  @computed
  String get second {
    if (_seconds < 0) {
      return '00';
    }

    if (_seconds > 9) {
      return _seconds.toString();
    } else {
      return '0$_seconds';
    }
  }

  @observable
  String previousMinute = '00';

  @computed
  String get previousSecond {
    final int previousSec = _seconds + 1;

    if (previousSec == 60) return '00';

    if (previousSec > 9) {
      return previousSec.toString();
    } else {
      return '0$previousSec';
    }
  }

  @action
  stopCounter() {
    isDecreasing = false;

    _timer.cancel();
    _seconds = 0;
    _minutes = 0;
  }
}

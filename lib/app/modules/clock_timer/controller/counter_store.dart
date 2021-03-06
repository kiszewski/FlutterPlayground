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

  @observable
  String formCounter = '';
  @action
  setFormCounter(String value) => formCounter = value;

  Timer _timer = Timer.periodic(Duration(seconds: 0), (_) {
    print('vazio');
  })
    ..cancel();

  bool get isDecreasing => _timer.isActive;

  @action
  Future decrement() async {
    _timer = Timer.periodic(Duration(seconds: 1), (_timer) {
      if (_minutes > 9) {
        previousMinute = _minutes.toString();
      } else {
        previousMinute = '0$_minutes';
      }
      if (_seconds == 0) {
        setSeconds(59);
        if (_minutes != 0) {
          if (_minutes > 9) {
            previousMinute = _minutes.toString();
          } else {
            previousMinute = '0$_minutes';
          }
          setMinutes(_minutes - 1);
        } else {
          _timer.cancel();
        }
      }

      setSeconds(_seconds - 1);
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

    if (previousSec + 1 > 9) {
      return previousSec.toString();
    } else {
      return '0$previousSec';
    }
  }

  @action
  stopCounter() {
    _timer.cancel();
    _seconds = 0;
    _minutes = 0;
  }
}

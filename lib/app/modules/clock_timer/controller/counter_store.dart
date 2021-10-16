import 'package:mobx/mobx.dart';
part 'counter_store.g.dart';

class CounterStore = _CounterStoreBase with _$CounterStore;

abstract class _CounterStoreBase with Store {
  @observable
  int counter = 0;
  @action
  setCounter(int value) => counter = value;

  @observable
  String formCounter = '';
  @action
  setFormCounter(String value) => formCounter = value;

  @observable
  bool isDecreasing = false;

  @action
  _setIsDecreasing(bool value) => isDecreasing = value;

  @action
  Future decrement() async {
    if (counter > 0) {
      _setIsDecreasing(true);
      await Future.delayed(Duration(seconds: 1));
      counter = counter - 1;
      decrement();
    } else {
      _setIsDecreasing(false);
    }
  }

  @computed
  String get _textCounter {
    String text = counter.toString();
    return text.length == 1 ? '0$text' : text;
  }

  @computed
  String get rightCounter => _textCounter[1];
  @computed
  String get leftCounter => _textCounter[0];

  @computed
  String get _previousTextCounter {
    int newCounter = counter + 1;
    String text = newCounter.toString();
    return text.length == 1 ? '0$text' : text;
  }

  @computed
  String get previousRightCounter => _previousTextCounter[1];
  @computed
  String get previousLeftCounter => _previousTextCounter[0];

  stopCounter() {
    _setIsDecreasing(false);
    setCounter(1);
  }
}

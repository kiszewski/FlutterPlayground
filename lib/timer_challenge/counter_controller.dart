import 'package:get/get.dart';

class CounterController {
  var _counter = 00.obs;
  setCounter(int value) => _counter.value = value;

  var formCounter = ''.obs;
  setFormCounter(String value) => formCounter.value = value;

  var isDecreasing = false.obs;
  _setIsDecreasing(bool value) => isDecreasing.value = value;

  Future decrement() async {
    if (_counter > 0) {
      _setIsDecreasing(true);
      await Future.delayed(Duration(seconds: 1));
      _counter = _counter - 1;
      decrement();
    } else {
      _setIsDecreasing(false);
    }
  }

  String get _textCounter {
    String text = _counter.toString();
    return text.length == 1 ? '0$text' : text;
  }

  String get rightCounter => _textCounter[1];
  String get leftCounter => _textCounter[0];

  String get _previousTextCounter {
    int newCounter = _counter.value + 1;
    String text = newCounter.toString();
    return text.length == 1 ? '0$text' : text;
  }

  String get previousRightCounter => _previousTextCounter[1];
  String get previousLeftCounter => _previousTextCounter[0];

  stopCounter() {
    _setIsDecreasing(false);
    setCounter(1);
  }
}

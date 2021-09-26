import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'components/number_widget.dart';
import 'counter_controller.dart';

class CounterPage extends StatefulWidget {
  const CounterPage();
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  CounterController _controller = CounterController();

  @override
  void initState() {
    _controller.decrement();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NumberWidget(
                      key: ObjectKey("${_controller.leftCounter}0"),
                      number: _controller.leftCounter,
                      previousNumber: _controller.previousLeftCounter,
                    ),
                    NumberWidget(
                      key: ObjectKey(_controller.rightCounter),
                      number: _controller.rightCounter,
                      previousNumber: _controller.previousRightCounter,
                    )
                  ],
                )),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .2),
            child: TextField(
              inputFormatters: [],
              keyboardType: TextInputType.number,
              maxLength: 2,
              decoration: InputDecoration(hintText: '99'),
              onChanged: _controller.setFormCounter,
            ),
          ),
          Obx(
            () => _controller.isDecreasing.value
                ? TextButton(
                    onPressed: () {
                      _controller.stopCounter();
                    },
                    child: Text('Stop'))
                : TextButton(
                    onPressed: () {
                      _controller
                          .setCounter(int.parse(_controller.formCounter.value));
                      _controller.decrement();
                    },
                    child: Text('Decrement')),
          )
        ],
      ),
    );
  }
}

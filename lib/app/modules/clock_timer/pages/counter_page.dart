import 'package:challenges_app/app/modules/clock_timer/components/watch/watch_store.dart';
import 'package:challenges_app/app/modules/clock_timer/components/watch/watch_widget.dart';
import 'package:challenges_app/app/modules/clock_timer/components/watch/watch_widget2.dart';
import 'package:challenges_app/app/modules/clock_timer/controller/counter_store.dart';
import 'package:challenges_app/app/modules/clock_timer/utils/clock_positions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../components/number/number_widget.dart';

class CounterPage extends StatefulWidget {
  const CounterPage();
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  late final CounterStore _controller;

  @override
  void initState() {
    _controller = Modular.get();
    _controller.decrement();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // WatchStore store = WatchStore();

    // return Column(
    //   children: [
    //     WatchWidget2(store: store),
    //     // WatchWidget(
    //     //   endPosition: ClockPositions.horizontal,
    //     //   initialPosition: ClockPositions.vertical,
    //     // ),
    //     TextButton(
    //         onPressed: () {
    //           store.setStartPosition(ClockPositions.off);
    //           store.setEndPosition(ClockPositions.vertical);
    //         },
    //         child: Text('Mover relogio'))
    //   ],
    // );

    return ListView(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Observer(
                builder: (_) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NumberWidget(
                      isLeft: false,
                      // key: ObjectKey("${_controller.leftCounter}0"),
                      // number: _controller.leftCounter,
                      // previousNumber: _controller.previousLeftCounter,
                    ),
                    NumberWidget(
                      isLeft: false,
                      // key: ObjectKey(_controller.rightCounter),
                      // number: _controller.rightCounter,
                      // previousNumber: _controller.previousRightCounter,
                    ),
                  ],
                ),
              ),
              Observer(
                builder: (_) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NumberWidget(
                      isLeft: false,
                      // key: ObjectKey("${_controller.leftCounter}0"),
                      // number: _controller.leftCounter,
                      // previousNumber: _controller.previousLeftCounter,
                    ),
                    NumberWidget(
                      isLeft: false,
                      // key: ObjectKey(_controller.rightCounter),
                      // number: _controller.rightCounter,
                      // previousNumber: _controller.previousRightCounter,
                    ),
                  ],
                ),
              ),
            ],
          ),
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
        Observer(
          builder: (_) => _controller.isDecreasing
              ? TextButton(
                  onPressed: () {
                    _controller.stopCounter();
                  },
                  child: Text('Stop'))
              : TextButton(
                  onPressed: () {
                    _controller.setCounter(int.parse(_controller.formCounter));
                    _controller.decrement();
                  },
                  child: Text('Decrement')),
        ),
        TextButton(
            onPressed: () {
              Modular.to.pushNamed('./green');
            },
            child: Text('Go to green screen'))
      ],
    );
  }
}

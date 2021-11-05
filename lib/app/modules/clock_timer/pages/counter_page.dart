import 'package:challenges_app/app/modules/clock_timer/controller/counter_store.dart';
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
  late final CounterStore store;

  final minutesInput = TextEditingController();
  final secondsInput = TextEditingController();

  @override
  void initState() {
    store = Modular.get();
    store.decrement();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NumberWidget(isLeft: true, isMinute: true),
                  NumberWidget(isLeft: false, isMinute: true),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NumberWidget(isLeft: true, isMinute: false),
                  NumberWidget(isLeft: false, isMinute: false),
                ],
              ),
            ],
          ),
        ),
        Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * .2),
              child: TextField(
                inputFormatters: [],
                controller: minutesInput,
                keyboardType: TextInputType.number,
                maxLength: 2,
                decoration: InputDecoration(hintText: '00'),
                // onChanged: store.setFormCounter,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * .2),
              child: TextField(
                controller: secondsInput,
                inputFormatters: [],
                keyboardType: TextInputType.number,
                maxLength: 2,
                decoration: InputDecoration(hintText: '00'),
                // onChanged: store.setFormCounter,
              ),
            ),
          ],
        ),
        store.isDecreasing
            ? TextButton(
                onPressed: () {
                  store.stopCounter();
                },
                child: Text('Stop'))
            : TextButton(
                onPressed: () {
                  store.setMinutes(int.parse(minutesInput.text));
                  store.setSeconds(int.parse(secondsInput.text));
                  store.decrement();
                },
                child: Text('Decrement')),
        TextButton(
            onPressed: () {
              Modular.to.pushNamed('./green');
            },
            child: Text('Go to green screen'))
      ],
    );
  }
}

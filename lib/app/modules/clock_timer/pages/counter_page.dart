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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
        Container(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  inputFormatters: [],
                  controller: minutesInput,
                  keyboardType: TextInputType.number,
                  maxLength: 2,
                  decoration: InputDecoration(hintText: '00'),
                  // onChanged: store.setFormCounter,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
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
        ),
        Observer(builder: (_) {
          return store.isDecreasing
              ? TextButton(
                  onPressed: store.stopCounter,
                  child: Text('Stop'),
                )
              : TextButton(
                  onPressed: () {
                    store.setMinutes(int.parse(minutesInput.text));
                    store.setSeconds(int.parse(secondsInput.text));
                    store.decrement();
                  },
                  child: Text('Decrement'),
                );
        })
      ],
    );
  }
}

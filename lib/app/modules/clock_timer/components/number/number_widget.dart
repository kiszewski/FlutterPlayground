import 'package:challenges_app/app/modules/clock_timer/components/watch/watch_store.dart';
import 'package:challenges_app/app/modules/clock_timer/components/watch/watch_widget2.dart';
import 'package:challenges_app/app/modules/clock_timer/controller/counter_store.dart';
import 'package:challenges_app/app/modules/clock_timer/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../utils/clock_positions.dart';
import '../watch/watch_widget2.dart';

class NumberWidget extends StatefulWidget {
  final bool isLeft;
  final bool isMinute;
  final Color color;

  const NumberWidget({
    Key? key,
    this.color = Colors.white,
    required this.isLeft,
    required this.isMinute,
  }) : super(key: key);

  @override
  State<NumberWidget> createState() => _NumberWidgetState();
}

class _NumberWidgetState extends State<NumberWidget> {
  final CounterStore store = Modular.get();

  late String number;
  late String previousNumber;

  List<Map<String, dynamic>> gridWatches = [];
  @override
  void initState() {
    number = widget.isMinute
        ? widget.isLeft
            ? store.minute[0]
            : store.minute[1]
        : widget.isLeft
            ? store.second[0]
            : store.second[1];

    previousNumber = widget.isMinute
        ? widget.isLeft
            ? store.previousMinute[0]
            : store.previousMinute[1]
        : widget.isLeft
            ? store.previousSecond[0]
            : store.previousSecond[1];

    for (int i = 0; i < numbersSequence[number]!.length; i++) {
      List row = numbersSequence[number]![i];

      for (int f = 0; f < row.length; f++) {
        final watchStore = WatchStore();
        gridWatches.add({
          'widget': WatchWidget2(store: watchStore),
          'store': watchStore,
        });
      }
    }

    autorun((_) {
      final minute = store.minute;
      final second = store.second;
      final previousMinute = store.previousMinute;
      final previousSecond = store.previousSecond;

      number = widget.isMinute
          ? widget.isLeft
              ? minute[0]
              : minute[1]
          : widget.isLeft
              ? second[0]
              : second[1];

      previousNumber = widget.isMinute
          ? widget.isLeft
              ? previousMinute[0]
              : previousMinute[1]
          : widget.isLeft
              ? previousSecond[0]
              : previousSecond[1];

      int index = 0;

      for (int i = 0; i < numbersSequence[number]!.length; i++) {
        List row = numbersSequence[number]![i];

        for (int f = 0; f < row.length; f++) {
          ClockPositions position = numbersSequence[number]![i][f];

          ClockPositions oldPosition = numbersSequence[previousNumber]![i][f];

          final watchStore = gridWatches[index]['store'] as WatchStore;

          watchStore.setStartPosition(oldPosition);
          watchStore.setEndPosition(position);

          index = index + 1;
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: widget.color,
      width: MediaQuery.of(context).size.width / 2,
      child: Wrap(
        children:
            gridWatches.map((element) => element['widget'] as Widget).toList(),
      ),
    );
  }
}

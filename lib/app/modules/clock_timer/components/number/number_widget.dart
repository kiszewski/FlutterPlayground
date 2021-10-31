import 'package:challenges_app/app/modules/clock_timer/components/watch/watch_store.dart';
import 'package:challenges_app/app/modules/clock_timer/components/watch/watch_widget.dart';
import 'package:challenges_app/app/modules/clock_timer/components/watch/watch_widget2.dart';
import 'package:challenges_app/app/modules/clock_timer/controller/counter_store.dart';
import 'package:challenges_app/app/modules/clock_timer/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../utils/clock_positions.dart';
import '../watch/watch_widget2.dart';

class NumberWidget extends StatefulWidget {
  final bool isLeft;

  const NumberWidget({
    Key? key,
    required this.isLeft,
  }) : super(key: key);

  @override
  State<NumberWidget> createState() => _NumberWidgetState();
}

class _NumberWidgetState extends State<NumberWidget> {
  final CounterStore store = Modular.get();
  List<Map<String, dynamic>> gridWatches = [];

  @override
  void initState() {
    for (int i = 0;
        i <
            numbersSequence[
                    widget.isLeft ? store.leftCounter : store.rightCounter]!
                .length;
        i++) {
      List row = numbersSequence[
          widget.isLeft ? store.leftCounter : store.rightCounter]![i];

      for (int f = 0; f < row.length; f++) {
        final watchStore = WatchStore();
        gridWatches.add({
          'widget': WatchWidget2(store: watchStore),
          'store': watchStore,
        });
      }
    }

    autorun((_) {
      store.leftCounter;
      store.rightCounter;

      int index = 0;

      for (int i = 0;
          i <
              numbersSequence[
                      widget.isLeft ? store.leftCounter : store.rightCounter]!
                  .length;
          i++) {
        List row = numbersSequence[
            widget.isLeft ? store.leftCounter : store.rightCounter]![i];

        for (int f = 0; f < row.length; f++) {
          ClockPositions position = numbersSequence[
              widget.isLeft ? store.leftCounter : store.rightCounter]![i][f];
          ClockPositions oldPosition = numbersSequence[widget.isLeft
              ? store.previousLeftCounter
              : store.previousRightCounter]![i][f];

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
      width: 200,
      height: 350,
      child: Wrap(
        children:
            gridWatches.map((element) => element['widget'] as Widget).toList(),
        // key: ObjectKey(DateTime.now().millisecond),
      ),
    );
  }
}

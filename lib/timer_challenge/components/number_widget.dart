import 'package:challenges_app/timer_challenge/utils/constants.dart';
import 'package:flutter/material.dart';

import '../utils/clock_positions.dart';
import 'watch_widget.dart';

class NumberWidget extends StatelessWidget {
  final String number;
  final String previousNumber;

  const NumberWidget({
    Key? key,
    required this.number,
    required this.previousNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Row> columns = [];
    for (int i = 0; i < numbersSequence[number]!.length; i++) {
      List row = numbersSequence[number]![i];

      List<WatchWidget> clocks = [];
      for (int f = 0; f < row.length; f++) {
        ClockPositions position = numbersSequence[number]![i][f];
        ClockPositions oldPosition =
            numbersSequence[previousNumber.toString()]![i][f];
        clocks.add(
            WatchWidget(initialPosition: oldPosition, endPosition: position));
      }
      columns.add(Row(children: clocks));
    }

    return Column(children: columns);
  }
}

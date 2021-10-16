import 'package:flutter/material.dart';

import '../utils/clock_positions.dart';
import '../utils/constants.dart';

class WatchWidget extends StatefulWidget {
  final ClockPositions initialPosition;
  final ClockPositions endPosition;

  const WatchWidget({
    Key? key,
    required this.initialPosition,
    required this.endPosition,
  }) : super(key: key);
  @override
  _WatchWidgetState createState() => _WatchWidgetState();
}

class _WatchWidgetState extends State<WatchWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  double piAlreadyWalked = 0;
  double qtdPiToWalk = 0;
  double piAlreadyWalkedBiggerPointer = 0;
  double qtdPiToWalkBiggerPointer = 0;

  @override
  void initState() {
    controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    if (widget.initialPosition == ClockPositions.off) {
      if (widget.endPosition == ClockPositions.off) {
        piAlreadyWalked = -(halfPi / 2);
        piAlreadyWalkedBiggerPointer = -(halfPi / 2);
      } else {
        piAlreadyWalked = -(halfPi / 2);
        piAlreadyWalkedBiggerPointer = -(halfPi / 2);
        moveHalfQuarter();
        moveHalfQuarterBiggerPointer();
        if (widget.endPosition == ClockPositions.topRightCorner) {
          moveOneQuarter();
          moveTwoQuarterBiggerPointer();
        }
        if (widget.endPosition == ClockPositions.topLeftCorner) {
          moveOneQuarterBiggerPointer();
        }
        if (widget.endPosition == ClockPositions.bottomRightCorner) {
          moveTwoQuarter();
          moveThreeQuarterBiggerPointer();
        }
        if (widget.endPosition == ClockPositions.bottomLeftCorner) {
          moveThreeQuarterBiggerPointer();
        }
        if (widget.endPosition == ClockPositions.horizontal) {
          moveTwoQuarterBiggerPointer();
        }
        if (widget.endPosition == ClockPositions.vertical) {
          moveOneQuarter();
          moveThreeQuarterBiggerPointer();
        }
      }
    }
    if (widget.initialPosition == ClockPositions.horizontal) {
      piAlreadyWalkedBiggerPointer = pi;

      if (widget.endPosition == ClockPositions.topRightCorner) {
        moveOneQuarter();
      }
      if (widget.endPosition == ClockPositions.topLeftCorner) {
        moveTwoQuarterBiggerPointer();
        moveOneQuarter();
      }
      if (widget.endPosition == ClockPositions.bottomRightCorner) {
        moveTwoQuarter();
        moveOneQuarterBiggerPointer();
      }
      if (widget.endPosition == ClockPositions.bottomLeftCorner) {
        moveOneQuarterBiggerPointer();
      }
      if (widget.endPosition == ClockPositions.vertical) {
        moveOneQuarter();
        moveOneQuarterBiggerPointer();
      }
      if (widget.endPosition == ClockPositions.off) {
        moveHalfQuarterBiggerPointer();
        moveOneQuarterBiggerPointer();
        moveHalfQuarter();
        moveThreeQuarter();
      }
    }
    if (widget.initialPosition == ClockPositions.vertical) {
      piAlreadyWalked = -halfPi;
      piAlreadyWalkedBiggerPointer = halfPi;

      if (widget.endPosition == ClockPositions.topRightCorner) {
        moveTwoQuarter();
        moveOneQuarterBiggerPointer();
      }
      if (widget.endPosition == ClockPositions.topLeftCorner) {
        moveOneQuarter();
      }
      if (widget.endPosition == ClockPositions.bottomRightCorner) {
        moveOneQuarterBiggerPointer();
      }
      if (widget.endPosition == ClockPositions.bottomLeftCorner) {
        moveTwoQuarterBiggerPointer();
        moveOneQuarter();
      }
      if (widget.endPosition == ClockPositions.horizontal) {
        moveOneQuarter();
        moveOneQuarterBiggerPointer();
      }
      if (widget.endPosition == ClockPositions.off) {
        moveHalfQuarterBiggerPointer();
        moveTwoQuarterBiggerPointer();
        moveHalfQuarter();
      }
    }
    if (widget.initialPosition == ClockPositions.topLeftCorner) {
      piAlreadyWalkedBiggerPointer = halfPi;

      if (widget.endPosition == ClockPositions.topRightCorner) {
        moveOneQuarter();
        moveOneQuarterBiggerPointer();
      }
      if (widget.endPosition == ClockPositions.bottomRightCorner) {
        moveTwoQuarterBiggerPointer();
        moveTwoQuarter();
      }
      if (widget.endPosition == ClockPositions.bottomLeftCorner) {
        moveTwoQuarterBiggerPointer();
      }
      if (widget.endPosition == ClockPositions.vertical) {
        moveOneQuarter();
        moveTwoQuarterBiggerPointer();
      }
      if (widget.endPosition == ClockPositions.horizontal) {
        moveOneQuarterBiggerPointer();
      }
      if (widget.endPosition == ClockPositions.off) {
        moveHalfQuarterBiggerPointer();
        moveTwoQuarterBiggerPointer();
        moveHalfQuarter();
        moveThreeQuarter();
      }
    }
    if (widget.initialPosition == ClockPositions.topRightCorner) {
      piAlreadyWalked = halfPi;
      piAlreadyWalkedBiggerPointer = halfPi * 2;

      if (widget.endPosition == ClockPositions.topLeftCorner) {
        moveTwoQuarterBiggerPointer();
      }
      if (widget.endPosition == ClockPositions.bottomRightCorner) {
        moveOneQuarterBiggerPointer();
        moveOneQuarter();
      }
      if (widget.endPosition == ClockPositions.bottomLeftCorner) {
        moveTwoQuarter();
        moveTwoQuarterBiggerPointer();
      }
      if (widget.endPosition == ClockPositions.vertical) {
        moveOneQuarterBiggerPointer();
      }
      if (widget.endPosition == ClockPositions.horizontal) {
        moveOneQuarter();
        moveTwoQuarterBiggerPointer();
      }
      if (widget.endPosition == ClockPositions.off) {
        moveHalfQuarterBiggerPointer();
        moveOneQuarterBiggerPointer();
        moveHalfQuarter();
        moveTwoQuarter();
      }
    }
    if (widget.initialPosition == ClockPositions.bottomRightCorner) {
      piAlreadyWalked = -halfPi;
      piAlreadyWalkedBiggerPointer = halfPi * 2;

      if (widget.endPosition == ClockPositions.topLeftCorner) {
        moveTwoQuarter();
        moveTwoQuarterBiggerPointer();
      }
      if (widget.endPosition == ClockPositions.topRightCorner) {
        moveThreeQuarter();
        moveThreeQuarterBiggerPointer();
      }
      if (widget.endPosition == ClockPositions.bottomLeftCorner) {
        moveOneQuarterBiggerPointer();
        moveOneQuarter();
      }
      if (widget.endPosition == ClockPositions.vertical) {
        moveTwoQuarter();
        moveOneQuarterBiggerPointer();
      }
      if (widget.endPosition == ClockPositions.horizontal) {
        moveOneQuarter();
      }
      if (widget.endPosition == ClockPositions.off) {
        moveHalfQuarterBiggerPointer();
        moveOneQuarterBiggerPointer();
        moveHalfQuarter();
      }
    }
    if (widget.initialPosition == ClockPositions.bottomLeftCorner) {
      piAlreadyWalked = -halfPi;

      if (widget.endPosition == ClockPositions.topLeftCorner) {
        moveOneQuarter();
        moveOneQuarterBiggerPointer();
      }
      if (widget.endPosition == ClockPositions.topRightCorner) {
        moveTwoQuarter();
        moveTwoQuarterBiggerPointer();
      }
      if (widget.endPosition == ClockPositions.bottomRightCorner) {
        moveThreeQuarter();
        moveThreeQuarterBiggerPointer();
      }
      if (widget.endPosition == ClockPositions.vertical) {
        moveOneQuarterBiggerPointer();
      }
      if (widget.endPosition == ClockPositions.horizontal) {
        moveOneQuarter();
        moveTwoQuarterBiggerPointer();
      }
      if (widget.endPosition == ClockPositions.off) {
        moveHalfQuarterBiggerPointer();
        moveThreeQuarterBiggerPointer();
        moveHalfQuarter();
      }
    }
    move();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  move() {
    if (!controller.isAnimating) {
      piAlreadyWalked = piAlreadyWalked + qtdPiToWalk;
      piAlreadyWalkedBiggerPointer =
          piAlreadyWalkedBiggerPointer + qtdPiToWalkBiggerPointer;

      controller.forward();
    }
  }

  moveHalfQuarter() => qtdPiToWalk = qtdPiToWalk + (halfPi / 2);

  moveOneQuarter() => qtdPiToWalk = qtdPiToWalk + halfPi;

  moveTwoQuarter() => qtdPiToWalk = qtdPiToWalk + pi;

  moveThreeQuarter() => qtdPiToWalk = qtdPiToWalk + pi + halfPi;

  moveHalfQuarterBiggerPointer() =>
      qtdPiToWalkBiggerPointer = qtdPiToWalkBiggerPointer + (halfPi / 2);

  moveOneQuarterBiggerPointer() =>
      qtdPiToWalkBiggerPointer = qtdPiToWalkBiggerPointer + halfPi;

  moveTwoQuarterBiggerPointer() =>
      qtdPiToWalkBiggerPointer = qtdPiToWalkBiggerPointer + pi;

  moveThreeQuarterBiggerPointer() =>
      qtdPiToWalkBiggerPointer = qtdPiToWalkBiggerPointer + pi + halfPi;

  @override
  Widget build(BuildContext context) {
    final circleDiameter = 35.0;

    return Container(
      color: Colors.white,
      height: circleDiameter,
      width: circleDiameter,
      child: Stack(
        children: [
          AnimatedBuilder(
              animation: controller,
              builder: (_, child) {
                double oldQtdWalk = piAlreadyWalked - qtdPiToWalk;
                double diff = qtdPiToWalk;

                double newValue = (controller.value * diff).abs();

                return Positioned(
                  bottom: circleDiameter * 0.50,
                  left: circleDiameter * 0.50,
                  child: Transform(
                      transform: Matrix4.rotationZ(oldQtdWalk + newValue),
                      child: Container(
                        color: Colors.black,
                        width: (circleDiameter * 0.55),
                        height: 1,
                      )),
                );
              }),
          AnimatedBuilder(
              animation: controller,
              builder: (_, child) {
                double oldQtdWalk =
                    piAlreadyWalkedBiggerPointer - qtdPiToWalkBiggerPointer;
                double diff = qtdPiToWalkBiggerPointer;

                double newValue = (controller.value * diff).abs();

                return Positioned(
                  bottom: circleDiameter * 0.49,
                  left: circleDiameter * 0.49,
                  child: Transform(
                      transform: Matrix4.rotationZ(oldQtdWalk + newValue),
                      child: Container(
                        color: Colors.black,
                        width: (circleDiameter * 0.50),
                        height: 1,
                      )),
                );
              }),
          Center(
            child: Container(
              height: circleDiameter,
              width: circleDiameter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: Colors.black12, width: 1)),
            ),
          ),
        ],
      ),
    );
  }
}

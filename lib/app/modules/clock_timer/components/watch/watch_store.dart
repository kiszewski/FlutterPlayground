import 'package:challenges_app/app/modules/clock_timer/utils/clock_positions.dart';
import 'package:challenges_app/app/modules/clock_timer/utils/constants.dart';
import 'package:flutter/animation.dart';
import 'package:mobx/mobx.dart';

part 'watch_store.g.dart';

class WatchStore = _WatchStoreBase with _$WatchStore;

abstract class _WatchStoreBase with Store {
  _WatchStoreBase();

  @observable
  double piAlreadyWalked = 0;
  @observable
  double qtdPiToWalk = 0;
  @observable
  double piAlreadyWalkedBiggerPointer = 0;
  @observable
  double qtdPiToWalkBiggerPointer = 0;

  @observable
  ClockPositions startPosition = ClockPositions.off;

  @observable
  ClockPositions endPosition = ClockPositions.off;

  @action
  setStartPosition(ClockPositions value) {
    if (value != startPosition) {
      startPosition = value;
    }
  }

  @action
  setEndPosition(ClockPositions value) {
    if (value != startPosition) {}
    piAlreadyWalked = 0;
    qtdPiToWalk = 0;
    piAlreadyWalkedBiggerPointer = 0;
    qtdPiToWalkBiggerPointer = 0;
    endPosition = value;
    calculate();
  }

  @action
  moveHalfQuarter() => qtdPiToWalk = qtdPiToWalk + (halfPi / 2);
  @action
  moveOneQuarter() => qtdPiToWalk = qtdPiToWalk + halfPi;
  @action
  moveTwoQuarter() => qtdPiToWalk = qtdPiToWalk + pi;
  @action
  moveThreeQuarter() => qtdPiToWalk = qtdPiToWalk + pi + halfPi;
  @action
  moveHalfQuarterBiggerPointer() =>
      qtdPiToWalkBiggerPointer = qtdPiToWalkBiggerPointer + (halfPi / 2);
  @action
  moveOneQuarterBiggerPointer() =>
      qtdPiToWalkBiggerPointer = qtdPiToWalkBiggerPointer + halfPi;
  @action
  moveTwoQuarterBiggerPointer() =>
      qtdPiToWalkBiggerPointer = qtdPiToWalkBiggerPointer + pi;
  @action
  moveThreeQuarterBiggerPointer() =>
      qtdPiToWalkBiggerPointer = qtdPiToWalkBiggerPointer + pi + halfPi;

  @action
  calculate() {
    if (startPosition == ClockPositions.off) {
      if (endPosition == ClockPositions.off) {
        piAlreadyWalked = -(halfPi / 2);
        piAlreadyWalkedBiggerPointer = -(halfPi / 2);
      } else {
        piAlreadyWalked = -(halfPi / 2);
        piAlreadyWalkedBiggerPointer = -(halfPi / 2);
        moveHalfQuarter();
        moveHalfQuarterBiggerPointer();
        if (endPosition == ClockPositions.topRightCorner) {
          moveOneQuarter();
          moveTwoQuarterBiggerPointer();
        }
        if (endPosition == ClockPositions.topLeftCorner) {
          moveOneQuarterBiggerPointer();
        }
        if (endPosition == ClockPositions.bottomRightCorner) {
          moveTwoQuarter();
          moveThreeQuarterBiggerPointer();
        }
        if (endPosition == ClockPositions.bottomLeftCorner) {
          moveThreeQuarterBiggerPointer();
        }
        if (endPosition == ClockPositions.horizontal) {
          moveTwoQuarterBiggerPointer();
        }
        if (endPosition == ClockPositions.vertical) {
          moveOneQuarter();
          moveThreeQuarterBiggerPointer();
        }
      }
    }
    if (startPosition == ClockPositions.horizontal) {
      piAlreadyWalkedBiggerPointer = pi;

      if (endPosition == ClockPositions.topRightCorner) {
        moveOneQuarter();
      }
      if (endPosition == ClockPositions.topLeftCorner) {
        moveTwoQuarterBiggerPointer();
        moveOneQuarter();
      }
      if (endPosition == ClockPositions.bottomRightCorner) {
        moveTwoQuarter();
        moveOneQuarterBiggerPointer();
      }
      if (endPosition == ClockPositions.bottomLeftCorner) {
        moveOneQuarterBiggerPointer();
      }
      if (endPosition == ClockPositions.vertical) {
        moveOneQuarter();
        moveOneQuarterBiggerPointer();
      }
      if (endPosition == ClockPositions.off) {
        moveHalfQuarterBiggerPointer();
        moveOneQuarterBiggerPointer();
        moveHalfQuarter();
        moveThreeQuarter();
      }
    }
    if (startPosition == ClockPositions.vertical) {
      piAlreadyWalked = -halfPi;
      piAlreadyWalkedBiggerPointer = halfPi;

      if (endPosition == ClockPositions.topRightCorner) {
        moveTwoQuarter();
        moveOneQuarterBiggerPointer();
      }
      if (endPosition == ClockPositions.topLeftCorner) {
        moveOneQuarter();
      }
      if (endPosition == ClockPositions.bottomRightCorner) {
        moveOneQuarterBiggerPointer();
      }
      if (endPosition == ClockPositions.bottomLeftCorner) {
        moveTwoQuarterBiggerPointer();
        moveOneQuarter();
      }
      if (endPosition == ClockPositions.horizontal) {
        moveOneQuarter();
        moveOneQuarterBiggerPointer();
      }
      if (endPosition == ClockPositions.off) {
        moveHalfQuarterBiggerPointer();
        moveTwoQuarterBiggerPointer();
        moveHalfQuarter();
      }
    }
    if (startPosition == ClockPositions.topLeftCorner) {
      piAlreadyWalkedBiggerPointer = halfPi;

      if (endPosition == ClockPositions.topRightCorner) {
        moveOneQuarter();
        moveOneQuarterBiggerPointer();
      }
      if (endPosition == ClockPositions.bottomRightCorner) {
        moveTwoQuarterBiggerPointer();
        moveTwoQuarter();
      }
      if (endPosition == ClockPositions.bottomLeftCorner) {
        moveTwoQuarterBiggerPointer();
      }
      if (endPosition == ClockPositions.vertical) {
        moveOneQuarter();
        moveTwoQuarterBiggerPointer();
      }
      if (endPosition == ClockPositions.horizontal) {
        moveOneQuarterBiggerPointer();
      }
      if (endPosition == ClockPositions.off) {
        moveHalfQuarterBiggerPointer();
        moveTwoQuarterBiggerPointer();
        moveHalfQuarter();
        moveThreeQuarter();
      }
    }
    if (startPosition == ClockPositions.topRightCorner) {
      piAlreadyWalked = halfPi;
      piAlreadyWalkedBiggerPointer = halfPi * 2;

      if (endPosition == ClockPositions.topLeftCorner) {
        moveTwoQuarterBiggerPointer();
      }
      if (endPosition == ClockPositions.bottomRightCorner) {
        moveOneQuarterBiggerPointer();
        moveOneQuarter();
      }
      if (endPosition == ClockPositions.bottomLeftCorner) {
        moveTwoQuarter();
        moveTwoQuarterBiggerPointer();
      }
      if (endPosition == ClockPositions.vertical) {
        moveOneQuarterBiggerPointer();
      }
      if (endPosition == ClockPositions.horizontal) {
        moveOneQuarter();
        moveTwoQuarterBiggerPointer();
      }
      if (endPosition == ClockPositions.off) {
        moveHalfQuarterBiggerPointer();
        moveOneQuarterBiggerPointer();
        moveHalfQuarter();
        moveTwoQuarter();
      }
    }
    if (startPosition == ClockPositions.bottomRightCorner) {
      piAlreadyWalked = -halfPi;
      piAlreadyWalkedBiggerPointer = halfPi * 2;

      if (endPosition == ClockPositions.topLeftCorner) {
        moveTwoQuarter();
        moveTwoQuarterBiggerPointer();
      }
      if (endPosition == ClockPositions.topRightCorner) {
        moveThreeQuarter();
        moveThreeQuarterBiggerPointer();
      }
      if (endPosition == ClockPositions.bottomLeftCorner) {
        moveOneQuarterBiggerPointer();
        moveOneQuarter();
      }
      if (endPosition == ClockPositions.vertical) {
        moveTwoQuarter();
        moveOneQuarterBiggerPointer();
      }
      if (endPosition == ClockPositions.horizontal) {
        moveOneQuarter();
      }
      if (endPosition == ClockPositions.off) {
        moveHalfQuarterBiggerPointer();
        moveOneQuarterBiggerPointer();
        moveHalfQuarter();
      }
    }
    if (startPosition == ClockPositions.bottomLeftCorner) {
      piAlreadyWalked = -halfPi;

      if (endPosition == ClockPositions.topLeftCorner) {
        moveOneQuarter();
        moveOneQuarterBiggerPointer();
      }
      if (endPosition == ClockPositions.topRightCorner) {
        moveTwoQuarter();
        moveTwoQuarterBiggerPointer();
      }
      if (endPosition == ClockPositions.bottomRightCorner) {
        moveThreeQuarter();
        moveThreeQuarterBiggerPointer();
      }
      if (endPosition == ClockPositions.vertical) {
        moveOneQuarterBiggerPointer();
      }
      if (endPosition == ClockPositions.horizontal) {
        moveOneQuarter();
        moveTwoQuarterBiggerPointer();
      }
      if (endPosition == ClockPositions.off) {
        moveHalfQuarterBiggerPointer();
        moveThreeQuarterBiggerPointer();
        moveHalfQuarter();
      }
    }
  }
}

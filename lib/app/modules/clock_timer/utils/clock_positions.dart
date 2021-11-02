import 'package:challenges_app/app/modules/clock_timer/utils/constants.dart';

enum ClockPositions {
  off,
  vertical,
  horizontal,
  topLeftCorner,
  topRightCorner,
  bottomLeftCorner,
  bottomRightCorner,
}

extension AnglePointers on ClockPositions {
  double get smallPointer {
    switch (this) {
      case ClockPositions.off:
        return halfPi / 2; //2 hours

      case ClockPositions.vertical:
        return -halfPi; //0 hours

      case ClockPositions.horizontal:
        return 0; //3 hours

      case ClockPositions.topLeftCorner:
        return 0; //3 hours

      case ClockPositions.topRightCorner:
        return halfPi; //6 hours

      case ClockPositions.bottomLeftCorner:
        return 0; //3 hours

      case ClockPositions.bottomRightCorner:
        return -halfPi; //0 hours
    }
  }

  double get biggerPointer {
    switch (this) {
      case ClockPositions.off:
        return halfPi / 2; //10 minutes

      case ClockPositions.vertical:
        return halfPi; //30 minutes

      case ClockPositions.horizontal:
        return pi; //45 minutes

      case ClockPositions.topLeftCorner:
        return halfPi; //30 minutes

      case ClockPositions.topRightCorner:
        return pi; //45 minutes

      case ClockPositions.bottomLeftCorner:
        return -halfPi; //0 minutes

      case ClockPositions.bottomRightCorner:
        return pi; //45 minutes
    }
  }
}

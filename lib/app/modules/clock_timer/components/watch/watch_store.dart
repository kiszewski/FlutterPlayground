import 'package:challenges_app/app/modules/clock_timer/utils/clock_positions.dart';
import 'package:challenges_app/app/modules/clock_timer/utils/constants.dart';
import 'package:mobx/mobx.dart';

part 'watch_store.g.dart';

class WatchStore = _WatchStoreBase with _$WatchStore;

abstract class _WatchStoreBase with Store {
  _WatchStoreBase();

  @observable
  double diffSmallPointer = 0;
  @observable
  double diffBiggerPointer = 0;

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
  setEndPosition(ClockPositions end) {
    endPosition = end;

    diffSmallPointer = endPosition.smallPointer - startPosition.smallPointer;
    diffBiggerPointer = endPosition.biggerPointer - startPosition.biggerPointer;
  }
}

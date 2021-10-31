import 'package:mobx/mobx.dart';
part 'number_store.g.dart';

class NumberStore = _NumberStoreBase with _$NumberStore;

abstract class _NumberStoreBase with Store {}

import 'package:mobx/mobx.dart';

part 'radio_store.g.dart';

class RadioStore = _RadioStoreBase with _$RadioStore;
abstract class _RadioStoreBase with Store {

  @observable
  String value = 'NAO';

  @action
  void setValue(String newValue) {
    value = newValue;
  } 
}
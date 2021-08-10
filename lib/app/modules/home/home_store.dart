import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  ObservableList<bool> selections = ObservableList<bool>.of([true, false, false]);

  @action
  Future<void> select(int index) async {
    for (int i = 0; i < selections.length; i++) {
      if (index == i) {
        selections[i] = true;
      } else {
        selections[i] = false;
      }
    }
  }
}
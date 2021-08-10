import 'package:mobx/mobx.dart';
import 'package:salutis_audit/app/modules/home/domain/entities/formulario.dart';
import 'package:salutis_audit/app/modules/home/domain/repositories/home_repository.dart';
import 'package:salutis_audit/app/services/shared_local_storage_service.dart';
import 'package:salutis_audit/app/utils/errors/domain_error.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final HomeRepository _repository;
  final SharedLocalStorageService _storageService;

  HomeStoreBase(this._repository, this._storageService);

  @observable
  ObservableList<Formulario> forms = ObservableList.of([]);

  @observable
  ObservableList<bool> selections = ObservableList<bool>.of([true, false, false]);


  @action
  Future<void> fetchForms() async {
    try {
      final token = await _storageService.get('token');

      forms = ObservableList.of(await _repository.fetchForms(token));
    } on DomainError catch(e) {
      print(e.description);
    }
  }

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
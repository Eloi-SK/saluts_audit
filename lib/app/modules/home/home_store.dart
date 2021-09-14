import 'package:mobx/mobx.dart';

import '../../services/shared_local_storage_service.dart';
import '../../utils/errors/domain_error.dart';

import 'domain/entities/entities.dart';
import 'domain/repositories/home_repository.dart';

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

  @observable
  bool isLoading = false;

  @action
  Future<void> fetchForms({ bool refresh = false }) async {
    try {
      if (!refresh) {
        isLoading = true;
      }

      final token = await _storageService.get('token');

      forms = ObservableList.of(await _repository.fetchForms(token));
    } on DomainError catch(e) {
      print(e.description);
    } finally {
      if (!refresh) {
        isLoading = false;
      }
    }
  }

  @action
  Future<void> selectStatus(int index) async {
    for (int i = 0; i < selections.length; i++) {
      if (index == i) {
        selections[i] = true;
      } else {
        selections[i] = false;
      }
    }
  }

  @action
  void changeValue(String formId, String groupId, String questionId, String newValue) {
    final formIdx = forms.indexWhere((el) => el.id == formId);

    final groupIdx = forms[formIdx].agrupamentos
      .indexWhere((el) => el.id == groupId);

    final questionIdx = forms[formIdx].agrupamentos[groupIdx]
      .perguntas.indexWhere((el) => el.id == questionId);

    var questions = forms[formIdx].agrupamentos[groupIdx].perguntas;
    questions[questionIdx] = questions[questionIdx].copyWith(valor: newValue);

    var groups = forms[formIdx].agrupamentos;
    groups[groupIdx] = groups[groupIdx].copyWith(perguntas: questions);

    forms[formIdx] = forms[formIdx].copyWith(agrupamentos: groups);
  }
}
import 'package:mobx/mobx.dart';

import '../../services/shared_local_storage_service.dart';
import '../../utils/utils.dart';
import 'repository/auth_repository.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;
abstract class _AuthStoreBase with Store {
  final AuthRepository _repository;
  final SharedLocalStorageService _storage;

  _AuthStoreBase(this._repository, this._storage);
  @observable
  bool isLogged = false;
  
  @observable
  bool isLoading = false;

  @observable
  String username = '';

  @observable
  String password = '';

  @observable
  String? mainError;

  @observable
  String? usernameError;

  @observable
  String? passwordError;

  @computed
  bool get isFormValid => usernameError == null && passwordError == null &&
  username != '' && password != '';

  @action
  validateUsername(String username) {
    this.username = username;
    usernameError = isNotEmptyValidationText(username);
  }

  @action
  validatePassword(String password) {
    this.password = password;
    passwordError = isNotEmptyValidationText(password);
  }

  @action
  Future<void> login() async {
    isLoading = true;
    try {
      final token = await _repository.login(username, password);
      await _storage.put('token', token);
      isLogged = true;
    } on DomainError catch (e) {
      mainError = e.description;
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> logout() async {
    await _storage.delete('token');
    isLogged = false;
  }
}
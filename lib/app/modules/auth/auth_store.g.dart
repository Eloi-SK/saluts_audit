// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on _AuthStoreBase, Store {
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_AuthStoreBase.isFormValid'))
          .value;

  final _$isLoggedAtom = Atom(name: '_AuthStoreBase.isLogged');

  @override
  bool get isLogged {
    _$isLoggedAtom.reportRead();
    return super.isLogged;
  }

  @override
  set isLogged(bool value) {
    _$isLoggedAtom.reportWrite(value, super.isLogged, () {
      super.isLogged = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_AuthStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$usernameAtom = Atom(name: '_AuthStoreBase.username');

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  final _$passwordAtom = Atom(name: '_AuthStoreBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$mainErrorAtom = Atom(name: '_AuthStoreBase.mainError');

  @override
  String? get mainError {
    _$mainErrorAtom.reportRead();
    return super.mainError;
  }

  @override
  set mainError(String? value) {
    _$mainErrorAtom.reportWrite(value, super.mainError, () {
      super.mainError = value;
    });
  }

  final _$usernameErrorAtom = Atom(name: '_AuthStoreBase.usernameError');

  @override
  String? get usernameError {
    _$usernameErrorAtom.reportRead();
    return super.usernameError;
  }

  @override
  set usernameError(String? value) {
    _$usernameErrorAtom.reportWrite(value, super.usernameError, () {
      super.usernameError = value;
    });
  }

  final _$passwordErrorAtom = Atom(name: '_AuthStoreBase.passwordError');

  @override
  String? get passwordError {
    _$passwordErrorAtom.reportRead();
    return super.passwordError;
  }

  @override
  set passwordError(String? value) {
    _$passwordErrorAtom.reportWrite(value, super.passwordError, () {
      super.passwordError = value;
    });
  }

  final _$loginAsyncAction = AsyncAction('_AuthStoreBase.login');

  @override
  Future<void> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  final _$logoutAsyncAction = AsyncAction('_AuthStoreBase.logout');

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  final _$_AuthStoreBaseActionController =
      ActionController(name: '_AuthStoreBase');

  @override
  dynamic validateUsername(String username) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.validateUsername');
    try {
      return super.validateUsername(username);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic validatePassword(String password) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.validatePassword');
    try {
      return super.validatePassword(password);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLogged: ${isLogged},
isLoading: ${isLoading},
username: ${username},
password: ${password},
mainError: ${mainError},
usernameError: ${usernameError},
passwordError: ${passwordError},
isFormValid: ${isFormValid}
    ''';
  }
}

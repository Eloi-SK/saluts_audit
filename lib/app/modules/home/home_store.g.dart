// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$formsAtom = Atom(name: 'HomeStoreBase.forms');

  @override
  ObservableList<Formulario> get forms {
    _$formsAtom.reportRead();
    return super.forms;
  }

  @override
  set forms(ObservableList<Formulario> value) {
    _$formsAtom.reportWrite(value, super.forms, () {
      super.forms = value;
    });
  }

  final _$selectionsAtom = Atom(name: 'HomeStoreBase.selections');

  @override
  ObservableList<bool> get selections {
    _$selectionsAtom.reportRead();
    return super.selections;
  }

  @override
  set selections(ObservableList<bool> value) {
    _$selectionsAtom.reportWrite(value, super.selections, () {
      super.selections = value;
    });
  }

  final _$isLoadingAtom = Atom(name: 'HomeStoreBase.isLoading');

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

  final _$fetchFormsAsyncAction = AsyncAction('HomeStoreBase.fetchForms');

  @override
  Future<void> fetchForms({bool refresh = false}) {
    return _$fetchFormsAsyncAction
        .run(() => super.fetchForms(refresh: refresh));
  }

  final _$selectStatusAsyncAction = AsyncAction('HomeStoreBase.selectStatus');

  @override
  Future<void> selectStatus(int index) {
    return _$selectStatusAsyncAction.run(() => super.selectStatus(index));
  }

  final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase');

  @override
  void changeValue(
      String formId, String groupId, String questionId, String newValue) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.changeValue');
    try {
      return super.changeValue(formId, groupId, questionId, newValue);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
forms: ${forms},
selections: ${selections},
isLoading: ${isLoading}
    ''';
  }
}

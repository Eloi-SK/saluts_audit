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

  final _$fetchFormsAsyncAction = AsyncAction('HomeStoreBase.fetchForms');

  @override
  Future<void> fetchForms() {
    return _$fetchFormsAsyncAction.run(() => super.fetchForms());
  }

  final _$selectAsyncAction = AsyncAction('HomeStoreBase.select');

  @override
  Future<void> select(int index) {
    return _$selectAsyncAction.run(() => super.select(index));
  }

  @override
  String toString() {
    return '''
forms: ${forms},
selections: ${selections}
    ''';
  }
}

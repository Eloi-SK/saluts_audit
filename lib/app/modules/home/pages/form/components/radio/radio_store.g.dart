// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radio_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RadioStore on _RadioStoreBase, Store {
  final _$valueAtom = Atom(name: '_RadioStoreBase.value');

  @override
  String get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(String value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_RadioStoreBaseActionController =
      ActionController(name: '_RadioStoreBase');

  @override
  void setValue(String newValue) {
    final _$actionInfo = _$_RadioStoreBaseActionController.startAction(
        name: '_RadioStoreBase.setValue');
    try {
      return super.setValue(newValue);
    } finally {
      _$_RadioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}

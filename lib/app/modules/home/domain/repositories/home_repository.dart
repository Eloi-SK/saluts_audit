import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../utils/errors/domain_error.dart';
import '../entities/formulario.dart';

class HomeRepository extends Disposable {
  final Dio httpClient;

  HomeRepository(this.httpClient);

  Future<List<Formulario>> fetchForms(String token) async {
    final response = await httpClient.get(
      'https://deway.com.br/customers/salutis/formularios_react_producao.php?token=$token'
    );

    if (response.data['sucesso']) {
      return response.data['formularios'].map<Formulario>((form) => Formulario.fromJson(form)).toList();
    } else {
      throw DomainError.unexpected;
    }
  }

  @override
  void dispose() { }

}
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:salutis_audit/app/utils/errors/domain_error.dart';

class AuthRepository extends Disposable {
  final Dio httpClient;

  AuthRepository(this.httpClient);

  Future<String> login(String username, String password) async {
    final response = await httpClient.post(
      'https://deway.com.br/customers/salutis/login_producao.php',
      data: { 'usuario': username, 'senha': password},
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
      ),
    );

    if (response.data['status'] == 'sucesso') {
      return response.data['token'];
    } else {
      throw DomainError.invalidCredentials;
    }
  }

  @override
  void dispose() { }
}
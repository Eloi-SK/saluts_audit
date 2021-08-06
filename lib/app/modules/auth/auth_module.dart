import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../services/shared_local_storage_service.dart';

import 'auth_page.dart';
import 'auth_store.dart';
import 'repository/auth_repository.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => Dio()),
    Bind.singleton((i) => AuthRepository(i())),
    Bind.singleton((i) => SharedLocalStorageService()),
    Bind.lazySingleton((i) => AuthStore(i(), i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => AuthPage()),
  ];
}

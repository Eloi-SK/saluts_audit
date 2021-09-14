import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../modules/auth/auth_store.dart';
import '../../modules/auth/repository/auth_repository.dart';
import '../../services/shared_local_storage_service.dart';

import 'domain/repositories/home_repository.dart';
import 'home_page.dart';
import 'home_store.dart';
import 'pages/form/form_page.dart';
import 'pages/form/components/components.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => Dio()),
    Bind.singleton((i) => HomeRepository(i())),
    Bind.singleton((i) => AuthRepository(i())),
    Bind.singleton((i) => SharedLocalStorageService()),
    Bind.lazySingleton((i) => HomeStore(i(), i())),
    Bind.lazySingleton((i) => RadioStore()),
    Bind.lazySingleton((i) => AuthStore(i(), i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
    ChildRoute('forms/:id', child: (_, args) => FormPage(id: args.params['id']))
  ];
}

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../services/shared_local_storage_service.dart';

import 'domain/repositories/home_repository.dart';
import 'home_page.dart';
import 'home_store.dart'; 

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => Dio()),
    Bind.singleton((i) => HomeRepository(i())),
    Bind.singleton((i) => SharedLocalStorageService()),
    Bind.lazySingleton((i) => HomeStore(i(), i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
  ];
}
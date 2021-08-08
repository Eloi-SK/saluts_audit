import 'package:flutter_modular/flutter_modular.dart';
import 'package:salutis_audit/app/modules/home/home_module.dart';

import 'auth_guard.dart';
import 'modules/auth/auth_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      Modular.initialRoute,
      module: HomeModule(),
      guards: [AuthGuard()]
    ),
    ModuleRoute('/login', module: AuthModule()),
  ];

}
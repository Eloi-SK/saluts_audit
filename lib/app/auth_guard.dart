import 'package:flutter_modular/flutter_modular.dart';

import 'services/shared_local_storage_service.dart';

class AuthGuard implements RouteGuard {
  @override
  Future<bool> canActivate(String path, ModularRoute router) async {
    final storage = SharedLocalStorageService();
    final token = await storage.get('token');
    
    if (token != null) {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

  @override
  String? get guardedRoute => '/login';

}
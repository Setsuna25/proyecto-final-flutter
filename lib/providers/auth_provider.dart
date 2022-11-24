import 'package:flutter/material.dart';
import 'package:web_proyecto_final/api/projectapi.dart';
import 'package:web_proyecto_final/models/http/auth_response.dart';
import 'package:web_proyecto_final/models/usuario.dart';
import 'package:web_proyecto_final/router/router.dart';
import 'package:web_proyecto_final/services/local_storage.dart';
import 'package:web_proyecto_final/services/navigation_service.dart';
import 'package:web_proyecto_final/services/notifications_service.dart';

enum AuthStatus {
  notAuthenticated,
  authenticating,
  authenticated,
}

class AuthProvider extends ChangeNotifier {
  AuthStatus authStatus = AuthStatus.authenticating;
  Usuario? user;

  AuthProvider() {
    isAutenticated();
  }

  login(String email, String password) {
    final data = {'email': email, 'password': password};

    ProFinApi.post('/auth/login', data).then(
      (json) {
        final authResponse = AuthResponse.fromMap(json);
        user = authResponse.usuario;

        authStatus = AuthStatus.authenticated;
        LocalStorage.prefs.setString('token', authResponse.token);
        NavigationService.replaceTo(Flurorouter.dashboardRoute);

        ProFinApi.configureDio();
        notifyListeners();
      },
    ).catchError((e) {
      NotificationService.showSnackBarError('Usuario / Password no válidos');
    });
  }

  // register(String email, String password, String name) {
  //   final data = {
  //     "email": email,
  //     "nombre": name,
  //     "password": password,
  //   };

  //   ProFinApi.post('/usuarios', data).then((json) {
  //     final authResponse = AuthResponse.fromMap(json);
  //     user = authResponse.usuario;

  //     authStatus = AuthStatus.authenticated;
  //     LocalStorage.prefs.setString('token', authResponse.token);
  //     NavigationService.replaceTo(Flurorouter.dashboardRoute);

  //     ProFinApi.configureDio();
  //     notifyListeners();
  //   }).catchError((e) {
  //     print('error en: $e');
  //     NotificationService.showSnackBarError('Usuario / Password no válidos');
  //   });
  // }

  Future<bool> isAutenticated() async {
    final token = LocalStorage.prefs.getString('token');

    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    try {
      final resp = await ProFinApi.httpGet('/auth');
      final authResponse = AuthResponse.fromMap(resp);
      LocalStorage.prefs.setString('token', authResponse.token);

      user = authResponse.usuario;
      authStatus = AuthStatus.authenticated;
      notifyListeners();
      return true;
    } catch (e) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
  }

  logout() {
    LocalStorage.prefs.remove('token');
    authStatus = AuthStatus.notAuthenticated;
    notifyListeners();
  }
}

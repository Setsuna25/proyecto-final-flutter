import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:web_proyecto_final/api/projectapi.dart';
import 'package:web_proyecto_final/providers/providers.dart';
import 'package:web_proyecto_final/router/router.dart';
import 'package:web_proyecto_final/services/local_storage.dart';
import 'package:web_proyecto_final/services/navigation_service.dart';
import 'package:web_proyecto_final/services/notifications_service.dart';
import 'package:web_proyecto_final/ui/layouts/auth/auth_layout.dart';
import 'package:web_proyecto_final/ui/layouts/dashboard/dashboard_layout.dart';
import 'package:web_proyecto_final/ui/layouts/splash/splash_layout.dart';

void main() async {
  await LocalStorage.configurePrefs();
  ProFinApi.configureDio();

  Flurorouter.configureRoutes();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(lazy: false, create: (_) => AuthProvider()),
        ChangeNotifierProvider(lazy: false, create: (_) => SideMenuProvider()),
        ChangeNotifierProvider(create: (_) => LoginFormProvider()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Proyecto Final',
      initialRoute: '/',
      onGenerateRoute: Flurorouter.router.generator,
      navigatorKey: NavigationService.navigatorKey,
      scaffoldMessengerKey: NotificationService.messengerKey,
      builder: (_, child) {
        final authProvider = Provider.of<AuthProvider>(context);

        if (authProvider.authStatus == AuthStatus.authenticating) {
          return const SplashLayout();
        }

        if (authProvider.authStatus == AuthStatus.authenticated) {
          return DashboardLayout(child: child!);
        } else {
          return AuthLayout(child: child!);
        }
      },
    );
  }
}

import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:web_proyecto_final/providers/sidemenu_provider.dart';
import 'package:web_proyecto_final/router/router.dart';
import 'package:web_proyecto_final/ui/views/dashboard_view.dart';
import 'package:web_proyecto_final/ui/views/blank_view.dart';
import 'package:web_proyecto_final/ui/views/login_view.dart';

import '../providers/auth_provider.dart';

class DashboardHandlers {
  static Handler dashboard = Handler(
    handlerFunc: (context, Map<String, List<String>> params) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false)
          .setCurrentPage(Flurorouter.dashboardRoute);
      if (authProvider.authStatus == AuthStatus.authenticated) {
        return DashboardView();
      } else {
        return LoginView();
      }
    },
  );

  static Handler blank = Handler(
    handlerFunc: (context, Map<String, List<String>> params) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false)
          .setCurrentPage(Flurorouter.blankRoute);
      if (authProvider.authStatus == AuthStatus.authenticated) {
        return BlankView();
      } else {
        return LoginView();
      }
    },
  );
}

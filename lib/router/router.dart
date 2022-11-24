import 'package:fluro/fluro.dart';
import 'package:web_proyecto_final/router/admin_handlers.dart';
import 'package:web_proyecto_final/router/dashboard_handlers.dart';
import 'package:web_proyecto_final/router/no_found_handlers.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String rootRoute = '/';

  // Auth Router
  static String loginRoute = '/login';
  static String registerRoute = '/register';

  // Dashboard
  static String dashboardRoute = '/dashboard';
  static String blankRoute = '/blank';

  static void configureRoutes() {
    // Auth Routes
    router.define(rootRoute, handler: AdminHandlers.login);
    router.define(loginRoute, handler: AdminHandlers.login);

    // Dashboard
    router.define(dashboardRoute,
        handler: DashboardHandlers.dashboard,
        transitionType: TransitionType.fadeIn);
    router.define(blankRoute,
        handler: DashboardHandlers.blank,
        transitionType: TransitionType.fadeIn);

    router.notFoundHandler = NoPageFoundHandler.noPageFound;
  }
}

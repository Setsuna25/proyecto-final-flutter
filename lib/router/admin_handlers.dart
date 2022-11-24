import 'package:fluro/fluro.dart';
import 'package:web_proyecto_final/ui/views/login_view.dart';

class AdminHandlers {
  static Handler login = Handler(
    handlerFunc: (context, parameters) {
      return const LoginView();
    },
  );
}

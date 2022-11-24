import 'package:fluro/fluro.dart';
import 'package:web_proyecto_final/ui/views/not_found.dart';

class NoPageFoundHandler {
  static Handler noPageFound = Handler(
    handlerFunc: (context, parameters) {
      return NotPageFoundView();
    },
  );
}

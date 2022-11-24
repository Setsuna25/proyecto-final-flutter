import 'package:flutter/material.dart';
import 'package:web_proyecto_final/providers/sidemenu_provider.dart';
import 'package:web_proyecto_final/shared/widgets/navbar_avatar.dart';
import 'package:web_proyecto_final/shared/widgets/notificaciones_indicador.dart';
import 'package:web_proyecto_final/shared/widgets/search_text.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: 50,
      decoration: decorationCustom(),
      child: Row(
        children: <Widget>[
          if (size.width <= 700)
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => SideMenuProvider.openMenu(),
            ),
          const SizedBox(width: 5),

          //Search input
          if (size.width > 400)
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 250),
              child: const SearchText(),
            ),
          const Spacer(),
          const NotificacionIndicador(),
          const SizedBox(width: 10),
          const NavbarAvatar(),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  BoxDecoration decorationCustom() => const BoxDecoration(
      color: Colors.white,
      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]);
}

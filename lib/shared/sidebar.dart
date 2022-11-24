import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:web_proyecto_final/providers/providers.dart';

import 'package:web_proyecto_final/router/router.dart';
import 'package:web_proyecto_final/services/navigation_service.dart';
import 'package:web_proyecto_final/shared/widgets/logo.dart';
import 'package:web_proyecto_final/shared/widgets/menu_item_costum.dart';
import 'package:web_proyecto_final/shared/widgets/text_separator.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  void navigateTo(String routeName) {
    NavigationService.replaceTo(routeName);
    SideMenuProvider.closeMenu();
  }

  @override
  Widget build(BuildContext context) {
    final sideMenuProvider = Provider.of<SideMenuProvider>(context);

    return Container(
      width: 200,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          const Logo(),
          const SizedBox(height: 50),
          const TextSeparator(text: 'Menu'),
          MenuItemCostum(
            isActive:
                sideMenuProvider.currentPage == Flurorouter.dashboardRoute,
            text: 'Dashboard',
            icon: Icons.home,
            onPressed: () => navigateTo(Flurorouter.dashboardRoute),
          ),
          MenuItemCostum(
              isActive: sideMenuProvider.currentPage == Flurorouter.blankRoute,
              text: 'Mis Multas',
              icon: Icons.abc,
              onPressed: () => navigateTo(Flurorouter.blankRoute)),
          const SizedBox(height: 30),
          const TextSeparator(text: 'UI Elements'),
          MenuItemCostum(
              isActive: sideMenuProvider.currentPage == Flurorouter.blankRoute,
              text: 'Blank',
              icon: Icons.subdirectory_arrow_right_outlined,
              onPressed: () => navigateTo(Flurorouter.blankRoute)),
          MenuItemCostum(
              text: 'Cerrar Sesión',
              icon: Icons.exit_to_app_outlined,
              onPressed: () {
                Provider.of<AuthProvider>(context, listen: false).logout();
              }),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff092044),
              Color(0xff092041),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
            )
          ]);
}

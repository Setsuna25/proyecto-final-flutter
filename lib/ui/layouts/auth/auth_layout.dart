import 'package:flutter/material.dart';
import 'package:web_proyecto_final/ui/layouts/auth/widgets/background.dart';
import 'package:web_proyecto_final/ui/layouts/auth/widgets/custom_title.dart';
import 'package:web_proyecto_final/ui/layouts/auth/widgets/link_bar.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;

  const AuthLayout({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          (size.width > 800)
              ? _DesktopBody(child: child)
              : _MobileBody(child: child),
          //LinkBar
          const LinksBar(),
        ],
      ),
    );
  }
}

class _DesktopBody extends StatelessWidget {
  final Widget child;

  const _DesktopBody({required this.child});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.95,
      color: Colors.red,
      child: Row(
        children: [
          const BackgroundLogin(),

          //view container
          Container(
            width: size.width * 0.6,
            height: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                const CustomTitle(),
                const SizedBox(height: 30),
                Expanded(child: child),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _MobileBody extends StatelessWidget {
  final Widget child;
  const _MobileBody({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const CustomTitle(),
        const SizedBox(height: 20),
        // ignore: sized_box_for_whitespace
        Container(
          width: double.infinity,
          height: 420,
          child: child,
        ),
        const SizedBox(
          width: double.infinity,
          height: 700,
          child: BackgroundLogin(),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

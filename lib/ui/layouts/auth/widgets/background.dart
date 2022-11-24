import 'package:flutter/material.dart';

class BackgroundLogin extends StatelessWidget {
  const BackgroundLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: buildBxDecoration(),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        child: const Center(
            child: Image(
          image: AssetImage('assets/images/fondo.png'),
          width: 400,
        )),
      ),
    ));
  }

  BoxDecoration buildBxDecoration() {
    return const BoxDecoration(
      //image: DecorationImage(image: AssetImage('fondo.jpg'), fit: BoxFit.cover),
      gradient: LinearGradient(
        colors: [Colors.grey, Colors.black],
        stops: [0.1, 1.5],
        begin: FractionalOffset.topCenter,
        end: FractionalOffset.bottomCenter,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class NotificacionIndicador extends StatelessWidget {
  const NotificacionIndicador({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Icon(Icons.notifications_none_outlined, color: Colors.grey),
        Positioned(
          left: 2,
          child: Container(
            width: 5,
            height: 5,
            decoration: buildDecoration(),
          ),
        )
      ],
    );
  }

  BoxDecoration buildDecoration() => BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(100),
      );
}

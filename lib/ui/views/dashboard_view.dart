import 'package:flutter/material.dart';
import 'package:web_proyecto_final/ui/labels/custom_labels.dart';

import '../cards/white_card.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        Text('DashboardView', style: CustomLabels.h1),
        const SizedBox(height: 10),
        const WhiteCard(title: 'Sales Statistics', child: Text('Hola Mundo')),
      ],
    );
  }
}

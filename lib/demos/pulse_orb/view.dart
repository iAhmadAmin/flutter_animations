import 'package:flutter/material.dart';

import '../../core/widgets/demo_scaffold.dart';
import 'widget.dart';

class PulseOrbDemoView extends StatelessWidget {
  const PulseOrbDemoView({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoScaffold(
      title: 'Pulse Orb',
      description:
          'Starter demo for the repo. It keeps the implementation isolated so future demos can follow the same pattern.',
      child: PulseOrbDemo(),
    );
  }
}

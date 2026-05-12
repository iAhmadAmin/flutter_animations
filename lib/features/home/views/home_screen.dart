import 'package:flutter/material.dart';
import 'package:flutter_animations/app/router.dart';

import '../models/demo_item.dart';
import '../widgets/demo_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const demos = <DemoItem>[
    DemoItem(
      title: 'Magic Wand Reveal',
      description: 'A reveal effect that follows the user\'s finger.',
      routeName: AppRouter.magicWandRevealRoute,
      gifName: 'magicWandReveal.gif',
    ),
    DemoItem(
      title: 'Mood Interaction',
      description:
          'An animated emoji that reacts to your mood with color and expression changes.',
      routeName: AppRouter.moodInteractionRoute,
      gifName: 'moodInteraction.gif',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Animations')),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: demos.length,
        itemBuilder: (context, index) {
          final demo = demos[index];
          return DemoCard(
            demo: demo,
            onTap: () {
              Navigator.of(context).pushNamed(demo.routeName);
            },
          );
        },
      ),
    );
  }
}

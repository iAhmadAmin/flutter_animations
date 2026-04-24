import 'package:flutter/material.dart';

import '../../../app/router.dart';
import '../models/demo_item.dart';
import '../widgets/demo_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const demos = <DemoItem>[
    DemoItem(
      title: 'Pulse Orb',
      description:
          'A simple looping scale and glow animation. Use it as the template for each new animation post.',
      routeName: AppRouter.pulseOrbRoute,
      tags: ['implicit', 'starter', 'loop'],
      status: 'Ready',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 12),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Flutter Animations',
                      style: theme.textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'A growing collection of small animation demos for practice, LinkedIn posts, and GitHub sharing.',
                      style: theme.textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEADBCB),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: const Text(
                        'Pattern: one demo per folder, one preview asset per demo, one card on the home gallery.',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisExtent: 280,
                  mainAxisSpacing: 16,
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  final demo = demos[index];

                  return DemoCard(
                    demo: demo,
                    onTap: () =>
                        Navigator.of(context).pushNamed(demo.routeName),
                  );
                }, childCount: demos.length),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

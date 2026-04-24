import 'package:flutter/material.dart';

import '../models/demo_item.dart';

class DemoCard extends StatelessWidget {
  const DemoCard({required this.demo, required this.onTap, super.key});

  final DemoItem demo;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: ShapeDecoration(
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(32),
            side: const BorderSide(color: Colors.black12, width: 1),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(demo.title, style: theme.textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(demo.description, style: theme.textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}

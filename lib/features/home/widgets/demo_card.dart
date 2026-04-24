import 'package:flutter/material.dart';

import '../models/demo_item.dart';

class DemoCard extends StatelessWidget {
  const DemoCard({required this.demo, required this.onTap, super.key});

  final DemoItem demo;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration: const BoxDecoration(
                      color: Color(0xFFDB6B2D),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFDB6B2D).withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      demo.status,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: const Color(0xFF8B4319),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(demo.title, style: theme.textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(demo.description, style: theme.textTheme.bodyMedium),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: demo.tags
                    .map(
                      (tag) => Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1E1D2),
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Text(tag),
                      ),
                    )
                    .toList(),
              ),
              const Spacer(),
              const Row(
                children: [
                  Text('Open demo'),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward_rounded),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

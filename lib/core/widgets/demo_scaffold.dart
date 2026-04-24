import 'package:flutter/material.dart';

class DemoScaffold extends StatelessWidget {
  const DemoScaffold({
    required this.title,
    required this.description,
    required this.child,
    super.key,
  });

  final String title;
  final String description;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: theme.textTheme.headlineSmall),
              const SizedBox(height: 8),
              Text(description, style: theme.textTheme.bodyLarge),
              const SizedBox(height: 24),
              Expanded(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF17120D), Color(0xFF2E2116)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Center(child: child),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';
import 'router.dart';

class FlutterAnimationsApp extends StatelessWidget {
  const FlutterAnimationsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animations',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: AppRouter.homeRoute,
    );
  }
}

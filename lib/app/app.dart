import 'package:flutter/material.dart';
import 'package:flutter_animations/app/router.dart';

class FlutterAnimationsApp extends StatelessWidget {
  const FlutterAnimationsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animations',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: AppRouter.homeRouter,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_animations/demos/magic_wand_reveal/view.dart';
import 'package:flutter_animations/features/home/views/home_screen.dart';

class AppRouter {
  static const homeRouter = '/';
  static const magicWandRevealRoute = '/demos/magic-wand-reveal';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRouter:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case magicWandRevealRoute:
        return MaterialPageRoute(
          builder: (_) => const MagicWandRevealDemoView(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}

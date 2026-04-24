import 'package:flutter/material.dart';

import '../demos/pulse_orb/view.dart';
import '../features/home/views/home_screen.dart';

class AppRouter {
  static const homeRoute = '/';
  static const pulseOrbRoute = '/demos/pulse-orb';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute<void>(
          builder: (_) => const HomeScreen(),
          settings: settings,
        );
      case pulseOrbRoute:
        return MaterialPageRoute<void>(
          builder: (_) => const PulseOrbDemoView(),
          settings: settings,
        );
      default:
        return MaterialPageRoute<void>(
          builder: (_) => const HomeScreen(),
          settings: settings,
        );
    }
  }
}

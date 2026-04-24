import 'package:flutter/material.dart';

class PulseOrbDemo extends StatefulWidget {
  const PulseOrbDemo({super.key});

  @override
  State<PulseOrbDemo> createState() => _PulseOrbDemoState();
}

class _PulseOrbDemoState extends State<PulseOrbDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;
  late final Animation<double> _glow;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat(reverse: true);

    _scale = Tween<double>(
      begin: 0.92,
      end: 1.06,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _glow = Tween<double>(
      begin: 18,
      end: 36,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _scale.value,
          child: Container(
            width: 180,
            height: 180,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const RadialGradient(
                colors: [
                  Color(0xFFFFB36B),
                  Color(0xFFDB6B2D),
                  Color(0xFF8B4319),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFDB6B2D).withValues(alpha: 0.45),
                  blurRadius: _glow.value,
                  spreadRadius: 8,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

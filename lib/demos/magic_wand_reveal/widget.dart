import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class MagicWandRevealDemo extends StatefulWidget {
  const MagicWandRevealDemo({super.key});

  static const overlayKey = Key('magic-wand-overlay');
  static const wandKey = Key('magic-wand-icon');

  @override
  State<MagicWandRevealDemo> createState() => _MagicWandRevealDemoState();
}

class _MagicWandRevealDemoState extends State<MagicWandRevealDemo> {
  static const double _minRadius = 36;
  static const double _maxRadius = 140;
  static const double _initialRadius = 64;

  final GlobalKey _gestureAreaKey = GlobalKey();

  Offset? _revealCenter;
  double _revealRadius = _initialRadius;
  double _radiusAtScaleStart = _initialRadius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        _syncInitialCenter(constraints.biggest);

        final size = constraints.biggest;
        final revealCenter = _revealCenter ?? _defaultCenter(size);

        return DecoratedBox(
          decoration: BoxDecoration(color: Colors.white),
          child: GestureDetector(
            key: _gestureAreaKey,
            behavior: HitTestBehavior.opaque,
            onScaleStart: (_) {
              _radiusAtScaleStart = _revealRadius;
            },
            onScaleUpdate: (details) {
              final localFocalPoint = _globalToLocal(details.focalPoint);
              if (localFocalPoint == null) {
                return;
              }

              setState(() {
                _revealCenter = _clampCenter(localFocalPoint, size);
                if (details.pointerCount > 1) {
                  _revealRadius = (_radiusAtScaleStart * details.scale).clamp(
                    _minRadius,
                    _maxRadius,
                  );
                }
              });
            },
            child: Stack(
              fit: StackFit.expand,
              children: [
                _RevealContent(theme: theme),
                IgnorePointer(
                  child: CustomPaint(
                    key: MagicWandRevealDemo.overlayKey,
                    painter: MagicRevealPainter(
                      center: revealCenter,
                      radius: _revealRadius,
                    ),
                    child: const SizedBox.expand(),
                  ),
                ),
                IgnorePointer(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Transform.translate(
                      offset: revealCenter,
                      child: Transform.rotate(
                        angle: -0.45,
                        child: Transform.translate(
                          offset: const Offset(-18, -18),
                          child: Container(
                            key: MagicWandRevealDemo.wandKey,
                            width: 36,
                            height: 36,
                            color: Colors.transparent,
                            child: const Text(
                              "🪄",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 32),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _syncInitialCenter(Size size) {
    if (_revealCenter != null || size.isEmpty) {
      return;
    }

    _revealCenter = _defaultCenter(size);
  }

  Offset _defaultCenter(Size size) {
    return Offset(size.width * 0.22, size.height * 0.29);
  }

  Offset? _globalToLocal(Offset globalPosition) {
    final context = _gestureAreaKey.currentContext;
    if (context == null) {
      return null;
    }

    final box = context.findRenderObject() as RenderBox?;
    return box?.globalToLocal(globalPosition);
  }

  Offset _clampCenter(Offset center, Size size) {
    const double inset = 18;

    return Offset(
      center.dx.clamp(inset, math.max(inset, size.width - inset)),
      center.dy.clamp(inset, math.max(inset, size.height - inset)),
    );
  }
}

class MagicRevealPainter extends CustomPainter {
  const MagicRevealPainter({required this.center, required this.radius});

  final Offset center;
  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    final overlayPaint = Paint()..color = Colors.white;
    final revealPaint = Paint()
      ..blendMode = BlendMode.dstOut
      ..color = Colors.black.withValues(alpha: 0.92)
      ..maskFilter = ui.MaskFilter.blur(ui.BlurStyle.normal, radius * 0.18);
    final featherPaint = Paint()
      ..blendMode = BlendMode.dstOut
      ..shader = ui.Gradient.radial(
        center,
        radius * 1.5,
        [
          Colors.black.withValues(alpha: 0.2),
          Colors.black.withValues(alpha: 0.2),
          Colors.black.withValues(alpha: 0.14),
          Colors.black.withValues(alpha: 0.08),
          Colors.transparent,
        ],
        const [0.0, 0.68, 0.82, 0.94, 1.0],
      );
    final revealPath = _buildOrganicRevealPath();

    canvas.saveLayer(Offset.zero & size, Paint());
    canvas.drawRect(Offset.zero & size, overlayPaint);
    canvas.drawPath(revealPath, revealPaint);
    canvas.drawCircle(center, radius * 1.5, featherPaint);
    canvas.restore();
  }

  Path _buildOrganicRevealPath() {
    const segments = 36;
    final path = Path();

    for (var index = 0; index <= segments; index++) {
      final progress = index / segments;
      final angle = progress * math.pi * 2;
      final variedRadius =
          radius *
          (1.0 +
              0.12 * math.sin(angle * 3) +
              0.07 * math.cos(angle * 5) +
              0.04 * math.sin(angle * 9));
      final point = Offset(
        center.dx + math.cos(angle) * variedRadius,
        center.dy + math.sin(angle) * variedRadius,
      );

      if (index == 0) {
        path.moveTo(point.dx, point.dy);
      } else {
        path.lineTo(point.dx, point.dy);
      }
    }

    path.close();
    return path;
  }

  @override
  bool shouldRepaint(MagicRevealPainter oldDelegate) {
    return oldDelegate.center != center || oldDelegate.radius != radius;
  }
}

class _RevealContent extends StatelessWidget {
  const _RevealContent({required this.theme});

  final ThemeData theme;

  static const _paragraphs = <String>[
    'Lumos Maxima.',
    'At face value, it is a brighter version of Lumos, but the spell feels more deliberate when it rises with intent and steadies the room around it.',
    'A focused wand movement sharpens the glow, and a slower pass makes the light feel almost suspended in the air, as if it is waiting for the next command.',
    'The charm works best when the caster is precise. Small shifts create narrow pools of clarity, while broader motion spreads the light across the page.',
    'That tension between control and softness is what makes the reveal feel magical. The brighter center gives certainty, and the fading edge leaves the rest half imagined.',
    'Pinch outward to widen the field, pinch inward to inspect a smaller detail, and drag the wand across the screen to trace the text line by line.',
  ];

  @override
  Widget build(BuildContext context) {
    final titleStyle = theme.textTheme.headlineSmall?.copyWith(
      fontFamily: 'Georgia',
      color: const Color(0xFFB1A79A),
      fontWeight: FontWeight.w500,
      height: 1.2,
    );
    final bodyStyle = theme.textTheme.headlineSmall?.copyWith(
      fontFamily: 'Georgia',
      color: const Color(0xFF8E8377),
      fontWeight: FontWeight.w500,
      height: 1.35,
    );
    final appBarStyle = theme.textTheme.titleLarge?.copyWith(
      fontFamily: 'Georgia',
      color: const Color(0xFF6E6257),
      fontWeight: FontWeight.w600,
    );

    return ColoredBox(
      color: Colors.white,
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: kToolbarHeight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.maybePop(context),
                      icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    ),
                    Text('Magic Wand Reveal', style: appBarStyle),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 340),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 12),
                              for (
                                var index = 0;
                                index < _paragraphs.length;
                                index++
                              )
                                Padding(
                                  padding: EdgeInsets.only(
                                    bottom: index == _paragraphs.length - 1
                                        ? 0
                                        : 24,
                                  ),
                                  child: Text(
                                    _paragraphs[index],
                                    style: index == 0 ? titleStyle : bodyStyle,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Pinch to resize the light.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontFamily: 'Georgia',
                        color: const Color(0xFF9A8F83),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

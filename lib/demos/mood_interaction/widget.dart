import 'package:flutter/material.dart';

enum MoodType { happy, sad, angry, crazy }

class MoodConfig {
  const MoodConfig({
    required this.sphereCenter,
    required this.sphereEdge,
    required this.bgTop,
    required this.bgBottom,
    required this.buttonColor,
    required this.leftEyePos,
    required this.rightEyePos,
    required this.leftEyeRadius,
    required this.rightEyeRadius,
    required this.leftPupilOffset,
    required this.rightPupilOffset,
    required this.leftEyeAngle,
    required this.rightEyeAngle,
    required this.leftLidCoverage,
    required this.rightLidCoverage,
    required this.mouthCenterY,
    required this.mouthWidth,
    required this.mouthCurve,
    required this.mouthSkewX,
    required this.mouthTilt,
  });

  final Color sphereCenter;
  final Color sphereEdge;
  final Color bgTop;
  final Color bgBottom;
  final Color buttonColor;

  // Eye positions as fraction of sphere radius from center
  final Offset leftEyePos;
  final Offset rightEyePos;
  final double leftEyeRadius;
  final double rightEyeRadius;
  final Offset leftPupilOffset;
  final Offset rightPupilOffset;
  final double leftEyeAngle;
  final double rightEyeAngle;
  // Fraction of eye diameter covered by dark lid from the top (0 = none, 0.5 = half)
  final double leftLidCoverage;
  final double rightLidCoverage;

  // Mouth as fraction of sphere radius
  final double mouthCenterY;
  final double mouthWidth;
  final double mouthCurve; // positive = smile, negative = frown
  final double mouthSkewX; // horizontal shift of curve center
  final double mouthTilt; // tilts endpoints: left down, right up when positive

  static MoodConfig lerp(MoodConfig a, MoodConfig b, double t) {
    return MoodConfig(
      sphereCenter: Color.lerp(a.sphereCenter, b.sphereCenter, t)!,
      sphereEdge: Color.lerp(a.sphereEdge, b.sphereEdge, t)!,
      bgTop: Color.lerp(a.bgTop, b.bgTop, t)!,
      bgBottom: Color.lerp(a.bgBottom, b.bgBottom, t)!,
      buttonColor: Color.lerp(a.buttonColor, b.buttonColor, t)!,
      leftEyePos: Offset.lerp(a.leftEyePos, b.leftEyePos, t)!,
      rightEyePos: Offset.lerp(a.rightEyePos, b.rightEyePos, t)!,
      leftEyeRadius: _ld(a.leftEyeRadius, b.leftEyeRadius, t),
      rightEyeRadius: _ld(a.rightEyeRadius, b.rightEyeRadius, t),
      leftPupilOffset: Offset.lerp(a.leftPupilOffset, b.leftPupilOffset, t)!,
      rightPupilOffset: Offset.lerp(a.rightPupilOffset, b.rightPupilOffset, t)!,
      leftEyeAngle: _ld(a.leftEyeAngle, b.leftEyeAngle, t),
      rightEyeAngle: _ld(a.rightEyeAngle, b.rightEyeAngle, t),
      leftLidCoverage: _ld(a.leftLidCoverage, b.leftLidCoverage, t),
      rightLidCoverage: _ld(a.rightLidCoverage, b.rightLidCoverage, t),
      mouthCenterY: _ld(a.mouthCenterY, b.mouthCenterY, t),
      mouthWidth: _ld(a.mouthWidth, b.mouthWidth, t),
      mouthCurve: _ld(a.mouthCurve, b.mouthCurve, t),
      mouthSkewX: _ld(a.mouthSkewX, b.mouthSkewX, t),
      mouthTilt: _ld(a.mouthTilt, b.mouthTilt, t),
    );
  }

  static double _ld(double a, double b, double t) => a + (b - a) * t;
}

// mood configs

const _happy = MoodConfig(
  sphereCenter: Color(0xFFFFBF60),
  sphereEdge: Color(0xFFD45E00),
  bgTop: Color(0xFFFFE080),
  bgBottom: Color(0xFFEAEAEA),
  buttonColor: Color(0xFFFFDFA8),
  leftEyePos: Offset(-0.28, -0.10),
  rightEyePos: Offset(0.28, -0.10),
  leftEyeRadius: 0.155,
  rightEyeRadius: 0.155,
  leftPupilOffset: Offset(0.0, 0.0),
  rightPupilOffset: Offset(0.0, 0.0),
  leftEyeAngle: 0.0,
  rightEyeAngle: 0.0,
  leftLidCoverage: 0.0,
  rightLidCoverage: 0.0,
  mouthCenterY: 0.24,
  mouthWidth: 0.30,
  mouthCurve: 0.20,
  mouthSkewX: 0.0,
  mouthTilt: 0.0,
);

const _sad = MoodConfig(
  sphereCenter: Color(0xFF9090FF),
  sphereEdge: Color(0xFF3030BB),
  bgTop: Color(0xFFAEC0FF),
  bgBottom: Color(0xFFE8E8F0),
  buttonColor: Color(0xFFBBBBFF),
  leftEyePos: Offset(-0.27, -0.10),
  rightEyePos: Offset(0.27, -0.10),
  leftEyeRadius: 0.140,
  rightEyeRadius: 0.140,
  // Pupils look down-inward
  leftPupilOffset: Offset(0.04, 0.08),
  rightPupilOffset: Offset(-0.04, 0.08),
  // Rotation makes inner corners droop down → sad brow
  leftEyeAngle: 0.28,
  rightEyeAngle: -0.28,
  leftLidCoverage: 0.40,
  rightLidCoverage: 0.40,
  mouthCenterY: 0.27,
  mouthWidth: 0.22,
  mouthCurve: -0.16,
  mouthSkewX: 0.0,
  mouthTilt: 0.0,
);

const _angry = MoodConfig(
  sphereCenter: Color(0xFFFF5555),
  sphereEdge: Color(0xFFAA0000),
  bgTop: Color(0xFFFFADAD),
  bgBottom: Color(0xFFECE8E8),
  buttonColor: Color(0xFFFFBBBB),
  leftEyePos: Offset(-0.27, -0.15),
  rightEyePos: Offset(0.27, -0.15),
  leftEyeRadius: 0.125,
  rightEyeRadius: 0.125,
  // Pupils look slightly inward-down
  leftPupilOffset: Offset(0.05, 0.05),
  rightPupilOffset: Offset(-0.05, 0.05),
  // Strong inward rotation → angry V-brow
  leftEyeAngle: 0.48,
  rightEyeAngle: -0.48,
  leftLidCoverage: 0.50,
  rightLidCoverage: 0.50,
  mouthCenterY: 0.25,
  mouthWidth: 0.27,
  mouthCurve: -0.22,
  mouthSkewX: 0.0,
  mouthTilt: 0.0,
);

const _crazy = MoodConfig(
  sphereCenter: Color(0xFFFF88CC),
  sphereEdge: Color(0xFFCC2090),
  bgTop: Color(0xFFFFADE6),
  bgBottom: Color(0xFFECE8EC),
  buttonColor: Color(0xFFFFBBEE),
  leftEyePos: Offset(-0.30, -0.14),
  rightEyePos: Offset(0.24, -0.06),
  leftEyeRadius: 0.178,
  rightEyeRadius: 0.100,
  leftPupilOffset: Offset(-0.08, -0.05),
  rightPupilOffset: Offset(0.06, 0.08),
  leftEyeAngle: 0.0,
  rightEyeAngle: 0.0,
  leftLidCoverage: 0.0,
  rightLidCoverage: 0.0,
  mouthCenterY: 0.23,
  mouthWidth: 0.28,
  mouthCurve: 0.13,
  mouthSkewX: 0.06,
  mouthTilt: 0.30,
);

MoodConfig _configFor(MoodType mood) {
  switch (mood) {
    case MoodType.happy:
      return _happy;
    case MoodType.sad:
      return _sad;
    case MoodType.angry:
      return _angry;
    case MoodType.crazy:
      return _crazy;
  }
}

// main widget
class MoodInteractionDemo extends StatefulWidget {
  const MoodInteractionDemo({super.key});

  @override
  State<MoodInteractionDemo> createState() => _MoodInteractionDemoState();
}

class _MoodInteractionDemoState extends State<MoodInteractionDemo>
    with TickerProviderStateMixin {
  MoodType _selected = MoodType.happy;

  late AnimationController _transitionCtrl;
  late AnimationController _bounceCtrl;
  late Animation<double> _scaleAnim;

  MoodConfig _from = _happy;
  MoodConfig _to = _happy;

  @override
  void initState() {
    super.initState();

    _transitionCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..value = 1.0;

    _bounceCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _scaleAnim = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(
          begin: 1.0,
          end: 1.05,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 25,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 1.05,
          end: 0.97,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 35,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 0.97,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 40,
      ),
    ]).animate(_bounceCtrl);
  }

  @override
  void dispose() {
    _transitionCtrl.dispose();
    _bounceCtrl.dispose();
    super.dispose();
  }

  void _selectMood(MoodType mood) {
    if (mood == _selected) return;
    setState(() {
      _from = _currentConfig;
      _to = _configFor(mood);
      _selected = mood;
    });
    _transitionCtrl.forward(from: 0);
    _bounceCtrl.forward(from: 0);
  }

  MoodConfig get _currentConfig =>
      MoodConfig.lerp(_from, _to, _transitionCtrl.value);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_transitionCtrl, _bounceCtrl]),
      builder: (context, _) {
        final cfg = _currentConfig;
        return _MoodCard(
          config: cfg,
          scale: _scaleAnim.value,
          selected: _selected,
          onMoodSelected: _selectMood,
        );
      },
    );
  }
}

// mood card
class _MoodCard extends StatelessWidget {
  const _MoodCard({
    required this.config,
    required this.scale,
    required this.selected,
    required this.onMoodSelected,
  });

  final MoodConfig config;
  final double scale;
  final MoodType selected;
  final ValueChanged<MoodType> onMoodSelected;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: Container(
            decoration: BoxDecoration(
              // Gradient stays saturated through the sphere area (~72%) then
              // quickly fades to neutral, matching the reference screenshots.
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.0, 0.70, 0.86, 1.0],
                colors: [
                  config.bgTop,
                  config.bgTop,
                  config.bgTop.withValues(alpha: 0.18),
                  config.bgBottom,
                ],
              ),
              borderRadius: BorderRadius.circular(32),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.42,
                  child: Transform.scale(
                    scale: scale,
                    child: CustomPaint(
                      painter: _SpherePainter(config: config),
                      child: const SizedBox.expand(),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  'How are you Today?',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade700,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Georgia',
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: MoodType.values.map((mood) {
                      final isSelected = mood == selected;
                      return _MoodButton(
                        label: _labelFor(mood),
                        isSelected: isSelected,
                        selectedColor: config.buttonColor,
                        textColor: isSelected
                            ? config.sphereEdge
                            : Colors.grey.shade500,
                        onTap: () => onMoodSelected(mood),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _labelFor(MoodType mood) {
    switch (mood) {
      case MoodType.happy:
        return 'Happy';
      case MoodType.sad:
        return 'Sad';
      case MoodType.angry:
        return 'Angry';
      case MoodType.crazy:
        return 'Crazy';
    }
  }
}

// mood button
class _MoodButton extends StatelessWidget {
  const _MoodButton({
    required this.label,
    required this.isSelected,
    required this.selectedColor,
    required this.textColor,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final Color selectedColor;
  final Color textColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? selectedColor
              : Colors.white.withValues(alpha: 0.7),
          borderRadius: BorderRadius.circular(14),
        ),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 350),
          style: TextStyle(
            fontSize: 15,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
            color: textColor,
          ),
          child: Text(label),
        ),
      ),
    );
  }
}

// sphere painter

class _SpherePainter extends CustomPainter {
  const _SpherePainter({required this.config});

  final MoodConfig config;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height * 0.50);
    final r = size.width * 0.38;

    _drawHaloRings(canvas, center, r);
    _drawSphere(canvas, center, r);
    _drawShine(canvas, center, r);
    _drawEye(canvas, center, r, left: true);
    _drawEye(canvas, center, r, left: false);
    _drawMouth(canvas, center, r);
  }

  void _drawHaloRings(Canvas canvas, Offset center, double r) {
    final outerR = r * 1.36;
    final outerPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          Colors.transparent,
          config.sphereCenter.withValues(alpha: 0.14),
          config.sphereCenter.withValues(alpha: 0.07),
          Colors.transparent,
        ],
        stops: const [0.55, 0.72, 0.88, 1.0],
      ).createShader(Rect.fromCircle(center: center, radius: outerR));
    canvas.drawCircle(center, outerR, outerPaint);

    final innerR = r * 1.16;
    final innerPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          Colors.transparent,
          config.sphereCenter.withValues(alpha: 0.22),
          config.sphereCenter.withValues(alpha: 0.10),
          Colors.transparent,
        ],
        stops: const [0.65, 0.80, 0.92, 1.0],
      ).createShader(Rect.fromCircle(center: center, radius: innerR));
    canvas.drawCircle(center, innerR, innerPaint);
  }

  void _drawSphere(Canvas canvas, Offset center, double r) {
    final highlightOffset = Offset(-r * 0.22, -r * 0.22);
    final paint = Paint()
      ..shader =
          RadialGradient(
            center: const Alignment(-0.35, -0.45),
            radius: 1.0,
            colors: [
              _brighten(config.sphereCenter, 0.25),
              config.sphereCenter,
              config.sphereEdge,
            ],
            stops: const [0.0, 0.45, 1.0],
          ).createShader(
            Rect.fromCircle(center: center + highlightOffset, radius: r * 1.3),
          );
    canvas.drawCircle(center, r, paint);
  }

  void _drawShine(Canvas canvas, Offset center, double r) {
    final shineCenter = center + Offset(-r * 0.28, -r * 0.32);
    final paint = Paint()
      ..shader = RadialGradient(
        colors: [
          Colors.white.withValues(alpha: 0.65),
          Colors.white.withValues(alpha: 0.20),
          Colors.transparent,
        ],
        stops: const [0.0, 0.5, 1.0],
      ).createShader(Rect.fromCircle(center: shineCenter, radius: r * 0.42));
    canvas.drawOval(
      Rect.fromCenter(center: shineCenter, width: r * 0.55, height: r * 0.38),
      paint,
    );
  }

  void _drawEye(Canvas canvas, Offset center, double r, {required bool left}) {
    final eyePos = left ? config.leftEyePos : config.rightEyePos;
    final eyeR = (left ? config.leftEyeRadius : config.rightEyeRadius) * r;
    final pupilOff = left ? config.leftPupilOffset : config.rightPupilOffset;
    final angle = left ? config.leftEyeAngle : config.rightEyeAngle;
    final lidCoverage = left ? config.leftLidCoverage : config.rightLidCoverage;

    final eyeCenter = center + Offset(eyePos.dx * r, eyePos.dy * r);

    canvas.save();
    canvas.translate(eyeCenter.dx, eyeCenter.dy);
    canvas.rotate(angle);

    // Eye white
    canvas.drawCircle(Offset.zero, eyeR, Paint()..color = Colors.white);

    // Pupil
    final pupilCenter = Offset(pupilOff.dx * eyeR, pupilOff.dy * eyeR);
    canvas.drawCircle(
      pupilCenter,
      eyeR * 0.58,
      Paint()..color = const Color(0xFF111111),
    );

    // Pupil shine
    canvas.drawCircle(
      pupilCenter + Offset(-eyeR * 0.18, -eyeR * 0.18),
      eyeR * 0.14,
      Paint()..color = Colors.white.withValues(alpha: 0.9),
    );

    // Dark lid drawn on top — clipped to the eye circle, covers top portion.
    // Rotation of the whole eye tilts the lid angle, creating sad/angry brows.
    if (lidCoverage > 0) {
      canvas.save();
      canvas.clipPath(
        Path()..addOval(Rect.fromCircle(center: Offset.zero, radius: eyeR)),
      );
      // lidBottom in local coords: top of eye is -eyeR, 0 is center
      final lidBottom = -eyeR + lidCoverage * 2 * eyeR;
      canvas.drawRect(
        Rect.fromLTRB(-eyeR * 2, -eyeR * 2, eyeR * 2, lidBottom),
        Paint()..color = const Color(0xFF111111),
      );
      canvas.restore();
    }

    canvas.restore();
  }

  void _drawMouth(Canvas canvas, Offset center, double r) {
    final mcy = center.dy + config.mouthCenterY * r;
    final hw = config.mouthWidth * r;
    final curve = config.mouthCurve * r;
    final skew = config.mouthSkewX * r;
    final tiltDy = config.mouthTilt * hw;

    // tiltDy tilts the endpoints: left end goes down, right end goes up
    final start = Offset(center.dx - hw + skew, mcy + tiltDy);
    final end = Offset(center.dx + hw + skew, mcy - tiltDy);
    final cp1 = Offset(center.dx - hw * 0.5 + skew, mcy + tiltDy * 0.4 + curve);
    final cp2 = Offset(center.dx + hw * 0.5 + skew, mcy - tiltDy * 0.4 + curve);

    final path = Path()
      ..moveTo(start.dx, start.dy)
      ..cubicTo(cp1.dx, cp1.dy, cp2.dx, cp2.dy, end.dx, end.dy);

    canvas.drawPath(
      path,
      Paint()
        ..color = Colors.white.withValues(alpha: 0.92)
        ..style = PaintingStyle.stroke
        ..strokeWidth = r * 0.072
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round,
    );
  }

  Color _brighten(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    return hsl
        .withLightness((hsl.lightness + amount).clamp(0.0, 1.0))
        .toColor();
  }

  @override
  bool shouldRepaint(_SpherePainter old) => true;
}

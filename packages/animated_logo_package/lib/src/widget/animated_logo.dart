import 'package:flutter/material.dart';
import '../models/logo_config.dart';

class AnimatedLogo extends StatelessWidget {
  final List<Offset> dotPositions;
  final LogoConfig config;

  const AnimatedLogo({
    Key? key,
    required this.dotPositions,
    this.config = const LogoConfig(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: LogoPainter(dotPositions, config),
      size: Size(config.size, config.size),
    );
  }
}
class LogoPainter extends CustomPainter {
  final List<Offset> dotPositions;
  final LogoConfig config;

  LogoPainter(this.dotPositions, this.config);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Draw circle fill
    final fillPaint = Paint()
      ..color = config.circleColor
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, radius, fillPaint);


    // Create a clipping path for the circle
    final clipPath = Path()
      ..addOval(Rect.fromCircle(center: center, radius: radius));
    canvas.clipPath(clipPath);

    // Draw lines
    final linePaint = Paint()
      ..color = config.lineColor
      ..strokeWidth = config.lineThickness;

    for (int i = 0; i < dotPositions.length; i++) {
      for (int j = i + 1; j < dotPositions.length; j++) {
        canvas.drawLine(
          _scaleOffset(dotPositions[i], size),
          _scaleOffset(dotPositions[j], size),
          linePaint,
        );
      }
    }

    // Draw dots
    final dotPaint = Paint()
      ..color = config.dotColor
      ..style = PaintingStyle.fill;

    final dotBorderPaint = Paint()
      ..color = config.borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    for (var position in dotPositions) {
      final scaledPosition = _scaleOffset(position, size);
      canvas.drawCircle(scaledPosition, config.dotSize, dotBorderPaint);
      canvas.drawCircle(scaledPosition, config.dotSize, dotPaint);
    }
  }

  Offset _scaleOffset(Offset offset, Size size) {
    final scaledX = (offset.dx - 100) * config.scaleFactor + size.width / 2;
    final scaledY = (offset.dy - 100) * config.scaleFactor + size.height / 2;
    return Offset(scaledX, scaledY);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

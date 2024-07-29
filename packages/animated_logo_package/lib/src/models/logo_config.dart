import 'package:flutter/material.dart';

class LogoConfig {
  final Color circleColor;
  final Color borderColor;
  final Color lineColor;
  final Color dotColor;
  final double dotSize;
  final double lineThickness;
  final double size;
  final double scaleFactor;

  const LogoConfig({
    this.circleColor = Colors.teal,
    this.borderColor = Colors.black,
    this.lineColor = Colors.black,
    this.dotColor = Colors.white,
    this.dotSize = 12.0,
    this.lineThickness = 4.0,
    this.size = 200.0,
    this.scaleFactor = 1.0,
  });
}

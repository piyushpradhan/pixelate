import 'package:flutter/material.dart';
import 'package:pixel_border/pixel_border.dart';

class PixelButton extends StatelessWidget {
  final double borderRadius;
  final double pixelSize;
  final BoxShadow shadow;
  final Color buttonColor;
  final EdgeInsets padding;
  final Widget childWidget;

  const PixelButton(
      {required this.borderRadius,
      required this.pixelSize,
      required this.shadow,
      required this.buttonColor,
      required this.padding,
      required this.childWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: ShapeDecoration(
        color: buttonColor,
        shape: PixelBorder.shape(
          borderRadius: BorderRadius.circular(borderRadius),
          pixelSize: pixelSize,
        ),
        shadows: [
          shadow,
        ],
      ),
      child: childWidget,
    );
  }
}

import 'package:blog/ui/shared/colors.dart';
import 'package:blog/ui/widgets/pixel_button.dart';
import 'package:flutter/material.dart';

class ToolButton extends StatelessWidget {
  final String label;
  final Function onTap;
  final Icon icon;

  const ToolButton(
      {required this.label, required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            onTap();
          },
          child: PixelButton(
            borderRadius: 10,
            pixelSize: 5,
            shadow: BoxShadow(
              color: CustomColors().three,
              offset: Offset(0, 6),
            ),
            buttonColor: CustomColors().one,
            padding: EdgeInsets.all(10),
            childWidget: icon,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "$label",
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}

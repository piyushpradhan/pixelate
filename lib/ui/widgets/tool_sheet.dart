import 'package:blog/ui/shared/colors.dart';
import 'package:blog/ui/widgets/pixelate_settings.dart';
import 'package:blog/ui/widgets/quantize_colors.dart';
import 'package:blog/ui/widgets/tool_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pixel_border/pixel_border.dart';

import 'adjust_colors.dart';

class ToolSheet extends StatelessWidget {
  final Function pixelSizeSlider;
  final Function onModalSheetComplete;
  final Function remapColors;
  final Function colorsSlider;

  const ToolSheet(
      {required this.pixelSizeSlider,
      required this.onModalSheetComplete,
      required this.remapColors,
      required this.colorsSlider});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: CustomColors().two,
        shape: PixelBorder.shape(
          borderRadius: BorderRadius.circular(4),
          pixelSize: 4,
        ),
      ),
      padding: EdgeInsets.all(6),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: ShapeDecoration(
          shape: PixelBorder.solid(
            color: CustomColors().three,
            borderRadius: BorderRadius.circular(2),
            pixelSize: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ToolButton(
              label: 'Pixelate',
              onTap: () {
                Navigator.of(context).pop();
                showModalBottomSheet(
                  context: context,
                  builder: (_) => Container(
                    padding: EdgeInsets.all(10),
                    child: PixelateSettings(
                      onSliderValueChange: pixelSizeSlider,
                    ),
                  ),
                ).whenComplete(() {
                  onModalSheetComplete();
                });
              },
              icon: Icon(Icons.apps),
            ),
            ToolButton(
              label: 'Adjust',
              onTap: () {
                Navigator.of(context).pop();
                showModalBottomSheet(
                  context: context,
                  builder: (_) => Container(
                    padding: EdgeInsets.all(10),
                    child: AdjustColors(remapColors: remapColors),
                  ),
                ).whenComplete(() {
                  onModalSheetComplete();
                });
              },
              icon: Icon(Icons.adjust),
            ),
            ToolButton(
              label: 'Colors',
              onTap: () {
                Navigator.of(context).pop();
                showModalBottomSheet(
                  context: context,
                  builder: (_) => Container(
                    padding: EdgeInsets.all(10),
                    child: QuantizeColors(onSliderValueChanged: colorsSlider),
                  ),
                ).whenComplete(() {
                  onModalSheetComplete();
                });
              },
              icon: Icon(Icons.palette_outlined),
            ),
          ],
        ),
      ),
    );
  }
}

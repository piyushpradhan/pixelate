import 'package:blog/ui/shared/colors.dart';
import 'package:blog/ui/widgets/pixel_button.dart';
import 'package:flutter/material.dart';
import 'package:pixel_border/pixel_border.dart';

class PixelateSettings extends StatefulWidget {
  final Function onSliderValueChange;

  PixelateSettings({required this.onSliderValueChange});

  @override
  _PixelateSettingsState createState() => _PixelateSettingsState();
}

class _PixelateSettingsState extends State<PixelateSettings> {
  double sliderValue = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: ShapeDecoration(
        color: CustomColors().two,
        shape: PixelBorder.shape(
          borderRadius: BorderRadius.circular(4),
          pixelSize: 2,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text("Pixel Size: "),
              Expanded(
                child: Slider(
                  activeColor: CustomColors().one,
                  inactiveColor: Colors.white,
                  min: 1,
                  max: 20,
                  label: "$sliderValue",
                  value: sliderValue,
                  divisions: 19,
                  onChangeEnd: (value) {
                    widget.onSliderValueChange(size: sliderValue);
                  },
                  onChanged: (value) {
                    setState(() {
                      sliderValue = value;
                    });
                  },
                ),
              ),
              SizedBox(width: 16),
              GestureDetector(
                onTap: () {
                  widget.onSliderValueChange(size: sliderValue);
                  Navigator.of(context).pop();
                },
                child: PixelButton(
                  borderRadius: 10,
                  pixelSize: 5,
                  shadow: BoxShadow(
                    color: CustomColors().three,
                    offset: Offset(0, 6),
                  ),
                  buttonColor: CustomColors().one,
                  padding: EdgeInsets.all(6),
                  childWidget: Icon(Icons.done),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

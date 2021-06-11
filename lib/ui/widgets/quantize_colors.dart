import 'package:blog/ui/shared/colors.dart';
import 'package:blog/ui/widgets/pixel_button.dart';
import 'package:flutter/material.dart';
import 'package:pixel_border/pixel_border.dart';

class QuantizeColors extends StatefulWidget {
  final Function onSliderValueChanged;

  const QuantizeColors({required this.onSliderValueChanged});

 @override
  _QuantizeColorsState createState() => _QuantizeColorsState();
}

class _QuantizeColorsState extends State<QuantizeColors> {
  double sliderValue = 256;

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
              Text("No. of colors: "),
              Expanded(
                child: Slider(
                  activeColor: CustomColors().one,
                  inactiveColor: Colors.white,
                  min: 1,
                  max: 257,
                  label: "$sliderValue",
                  value: sliderValue,
                  divisions: 256,
                  onChangeEnd: (value) {
                    sliderValue = value;
                    widget.onSliderValueChanged(sliderValue);
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
                  widget.onSliderValueChanged(sliderValue);
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

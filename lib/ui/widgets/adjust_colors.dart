import 'package:blog/ui/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:pixel_border/pixel_border.dart';
import 'package:image/image.dart' as img;

class AdjustColors extends StatefulWidget {
  final Function remapColors;

  const AdjustColors({required this.remapColors});

  @override
  _AdjustColorsState createState() => _AdjustColorsState();
}

class _AdjustColorsState extends State<AdjustColors> {
  List<bool> redSelection = [true, false, false];
  List<bool> greenSelection = [false, true, false];
  List<bool> blueSelection = [false, false, true];

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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Red: "),
              ChoiceChip(
                label: Text(
                  "Red",
                  style: TextStyle(color: Colors.white),
                ),
                selected: redSelection[0],
                selectedColor: Colors.red,
                onSelected: (value) {
                  setState(() {
                    redSelection[0] = value;
                    redSelection[1] = !value;
                    redSelection[2] = !value;
                    widget.remapColors(red: img.Channel.red);
                  });
                },
              ),
              ChoiceChip(
                label: Text(
                  "Green",
                  style: TextStyle(color: Colors.white),
                ),
                selected: redSelection[1],
                selectedColor: Colors.red,
                onSelected: (value) {
                  setState(() {
                    redSelection[0] = !value;
                    redSelection[1] = value;
                    redSelection[2] = !value;
                    widget.remapColors(red: img.Channel.green);
                  });
                },
              ),
              ChoiceChip(
                label: Text(
                  "Blue",
                  style: TextStyle(color: Colors.white),
                ),
                selected: redSelection[2],
                selectedColor: Colors.red,
                onSelected: (value) {
                  setState(() {
                    redSelection[0] = !value;
                    redSelection[1] = !value;
                    redSelection[2] = value;
                    widget.remapColors(red: img.Channel.blue);
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Green: "),
              ChoiceChip(
                label: Text(
                  "Red",
                  style: TextStyle(color: Colors.white),
                ),
                selected: greenSelection[0],
                selectedColor: Colors.green,
                onSelected: (value) {
                  setState(() {
                    greenSelection[0] = value;
                    greenSelection[1] = !value;
                    greenSelection[2] = !value;
                    widget.remapColors(green: img.Channel.red);
                  });
                },
              ),
              ChoiceChip(
                label: Text(
                  "Green",
                  style: TextStyle(color: Colors.white),
                ),
                selected: greenSelection[1],
                selectedColor: Colors.green,
                onSelected: (value) {
                  setState(() {
                    greenSelection[0] = !value;
                    greenSelection[1] = value;
                    greenSelection[2] = !value;
                    widget.remapColors(green: img.Channel.green);
                  });
                },
              ),
              ChoiceChip(
                label: Text(
                  "Blue",
                  style: TextStyle(color: Colors.white),
                ),
                selected: greenSelection[2],
                selectedColor: Colors.green,
                onSelected: (value) {
                  setState(() {
                    greenSelection[0] = !value;
                    greenSelection[1] = !value;
                    greenSelection[2] = value;
                    widget.remapColors(green: img.Channel.blue);
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Blue: "),
              ChoiceChip(
                label: Text(
                  "Red",
                  style: TextStyle(color: Colors.white),
                ),
                selected: blueSelection[0],
                selectedColor: Colors.blue,
                onSelected: (value) {
                  setState(() {
                    blueSelection[0] = value;
                    blueSelection[1] = !value;
                    blueSelection[2] = !value;
                    widget.remapColors(blue: img.Channel.red);
                  });
                },
              ),
              ChoiceChip(
                label: Text(
                  "Green",
                  style: TextStyle(color: Colors.white),
                ),
                selected: blueSelection[1],
                selectedColor: Colors.blue,
                onSelected: (value) {
                  setState(() {
                    blueSelection[0] = !value;
                    blueSelection[1] = value;
                    blueSelection[2] = !value;
                    widget.remapColors(blue: img.Channel.green);
                  });
                },
              ),
              ChoiceChip(
                label: Text(
                  "Blue",
                  style: TextStyle(color: Colors.white),
                ),
                selected: blueSelection[2],
                selectedColor: Colors.blue,
                onSelected: (value) {
                  setState(() {
                    blueSelection[0] = !value;
                    blueSelection[1] = !value;
                    blueSelection[2] = value;
                    widget.remapColors(blue: img.Channel.blue);
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

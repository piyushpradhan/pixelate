import 'package:blog/core/enums/viewstate.dart';
import 'package:blog/core/viewmodels/home_model.dart';
import 'package:blog/ui/shared/colors.dart';
import 'package:blog/ui/views/base_view.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:pixel_border/pixel_border.dart';

import 'edit_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      builder: (context, model, child) => Scaffold(
        backgroundColor: CustomColors().three,
        body: Container(
          margin: EdgeInsets.only(left: 16, right: 16, top: 48, bottom: 16),
          decoration: ShapeDecoration(
            shape: PixelBorder.solid(
              color: CustomColors().two,
              borderRadius: BorderRadius.circular(8),
              pixelSize: 4,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/camera.png', width: 80,),
                Text("Pixelate", style: TextStyle(fontSize: 40,),),
                SizedBox(height: 32,),
                GestureDetector(
                  onTap: () async {
                    bool success = await model.captureImage();
                    if (success) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => EditView(model.image),
                        ),
                      );
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: ShapeDecoration(
                      color: CustomColors().one,
                      shadows: [
                        BoxShadow(
                          color: CustomColors().two,
                          offset: Offset(0, 16),
                        ),
                      ],
                      shape: PixelBorder.shape(
                        borderRadius: BorderRadius.circular(4),
                        pixelSize: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_a_photo_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                        SizedBox(width: 8),
                        Text("Capture an image"),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () async {
                    bool success = await model.getImage();
                    if (success) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => EditView(model.image),
                        ),
                      );
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: ShapeDecoration(
                      color: CustomColors().one,
                      shadows: [
                        BoxShadow(
                          color: CustomColors().two,
                          offset: Offset(0, 16),
                        ),
                      ],
                      shape: PixelBorder.shape(
                        borderRadius: BorderRadius.circular(4),
                        pixelSize: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.apps,
                          color: Colors.white,
                          size: 30,
                        ),
                        SizedBox(width: 8),
                        Text("Pick from Gallery"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

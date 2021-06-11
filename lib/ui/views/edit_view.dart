import 'dart:io';
import 'dart:typed_data';

import 'package:blog/core/enums/viewstate.dart';
import 'package:blog/core/viewmodels/edit_model.dart';
import 'package:blog/ui/shared/colors.dart';
import 'package:blog/ui/views/base_view.dart';
import 'package:blog/ui/widgets/pixel_button.dart';
import 'package:blog/ui/widgets/tool_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pixel_border/pixel_border.dart';

class EditView extends StatelessWidget {
  final selectedImage;

  const EditView(this.selectedImage);

  @override
  Widget build(BuildContext context) {
    final imageKey = new GlobalKey();
    return BaseView<EditModel>(
      onModelReady: (model) {
        model.addOriginal(selectedImage);
      },
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: CustomColors().two,
          title: Text(
            "Edit Image",
          ),
          actions: [
            // IconButton(
            //   color: model.selectedImageHistory.length > 1
            //       ? Colors.white
            //       : Colors.grey,
            //   onPressed: () {
            //     if (model.selectedImageHistory.length > 1) {
            //       print(model.imageHistory);
            //       model.undo();
            //     }
            //   },
            //   icon: Icon(Icons.undo),
            // ),
          ],
        ),
        body: model.state == ViewState.Busy
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: Container(
                  child: RepaintBoundary(
                    key: imageKey,
                    child: Image.memory(model.selectedImageBytes!),
                  ),
                ),
              ),
        bottomNavigationBar: Container(
          color: CustomColors().two,
          padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (_) => Container(
                      padding: EdgeInsets.all(10),
                      child: ToolSheet(
                        pixelSizeSlider: model.onPixelSizeChange,
                        remapColors: model.updateColorChannels,
                        colorsSlider: model.reduceColors,
                        onModalSheetComplete: model.updateHistory,
                      ),
                    ),
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  decoration: ShapeDecoration(
                      color: CustomColors().one,
                      shape: PixelBorder.shape(
                        borderRadius: BorderRadius.circular(4),
                        pixelSize: 4,
                      ),
                      shadows: [
                        BoxShadow(
                          color: CustomColors().three,
                          offset: Offset(0, 8),
                        ),
                      ]),
                  child: Text(
                    "Tools",
                  ),
                ),
              ),
              SizedBox(
                width: 32,
              ),
              GestureDetector(
                onTap: () async {
                  await model.screenshotEditedImage(imageKey, selectedImage);
                  final snackbar = SnackBar(
                    content: Text("Saved to /storage/Android/data/com.example.blog :D️", style: TextStyle(fontFamily: "Retro", fontSize: 10),),
                    backgroundColor: CustomColors().three,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  decoration: ShapeDecoration(
                      color: CustomColors().one,
                      shape: PixelBorder.shape(
                        borderRadius: BorderRadius.circular(4),
                        pixelSize: 4,
                      ),
                      shadows: [
                        BoxShadow(
                          color: CustomColors().three,
                          offset: Offset(0, 8),
                        ),
                      ]),
                  child: Text(
                    "Save",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

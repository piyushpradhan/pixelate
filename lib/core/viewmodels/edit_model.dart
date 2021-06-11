import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:blog/core/enums/viewstate.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart' as uuid;

import 'base_model.dart';
import 'package:image/image.dart' as img;

class EditModel extends BaseModel {
  Uint8List? _selectedImageBytes;

  Uint8List? get selectedImageBytes => _selectedImageBytes;
  List<Uint8List> _selectedImageHistory = [];
  List<Uint8List> get imageHistory => _selectedImageHistory;

  List<Uint8List> get selectedImageHistory => _selectedImageHistory;
  int pixelSize = 1;

  img.Channel redChannel = img.Channel.red;
  img.Channel greenChannel = img.Channel.green;
  img.Channel blueChannel = img.Channel.blue;

  int colorsInImage = 256;

  Uint8List? _originalImage;

  pixelateImage(Uint8List imageData) async {
    setState(ViewState.Busy);

    List<int> intList = List.from(imageData);
    final decodedImage = img.decodeImage(intList);
    img.pixelate(decodedImage!, pixelSize, mode: img.PixelateMode.average);
    final encodedImage = img.encodeJpg(decodedImage);
    Uint8List temp = Uint8List.fromList(encodedImage);
    _selectedImageBytes = temp;
    _selectedImageHistory.add(temp);

    notifyListeners();
    setState(ViewState.Idle);
  }

  onPixelSizeChange({double size = 1}) {
    setState(ViewState.Busy);
    pixelSize = size.toInt();
    List<int> intList = List.from(_selectedImageHistory.last);
    final decodedImage = img.decodeImage(intList);
    img.pixelate(decodedImage!, pixelSize, mode: img.PixelateMode.average);
    final encodedImage = img.encodeJpg(decodedImage);
    Uint8List temp = Uint8List.fromList(encodedImage);
    _selectedImageBytes = temp;
    notifyListeners();
    setState(ViewState.Idle);
  }

  updateColorChannels(
      {img.Channel red = img.Channel.red,
      img.Channel green = img.Channel.green,
      img.Channel blue = img.Channel.blue}) {
    setState(ViewState.Busy);

    List<int> intList = List.from(_selectedImageHistory.last);
    final decodedImage = img.decodeImage(intList);
    img.remapColors(decodedImage!, red: red, green: green, blue: blue);
    final encodedImage = img.encodeJpg(decodedImage);
    Uint8List temp = Uint8List.fromList(encodedImage);
    _selectedImageBytes = temp;
    notifyListeners();

    setState(ViewState.Idle);
  }

  changeImageColors(Uint8List imageData,
      {img.Channel red = img.Channel.red,
      img.Channel green = img.Channel.green,
      img.Channel blue = img.Channel.blue}) async {
    setState(ViewState.Busy);

    List<int> intList = List.from(imageData);
    final decodedImage = img.decodeImage(intList);
    img.remapColors(decodedImage!, red: red, blue: blue, green: green);
    final encodedImage = img.encodeJpg(decodedImage);
    Uint8List temp = Uint8List.fromList(encodedImage);
    _selectedImageBytes = temp;
    _selectedImageHistory.add(temp);

    notifyListeners();
    setState(ViewState.Idle);
  }

  reduceColors(numberOfColors) {
    setState(ViewState.Busy);
    colorsInImage = numberOfColors.toInt();
    List<int> intList = List.from(_selectedImageHistory.last);
    final decodedImage = img.decodeImage(intList);
    img.quantize(decodedImage!, numberOfColors: colorsInImage);
    final encodedImage = img.encodeJpg(decodedImage);
    Uint8List temp = Uint8List.fromList(encodedImage);
    _selectedImageBytes = temp;

    notifyListeners();
    setState(ViewState.Idle);
  }

  quantizeImage(Uint8List imageData, {numberOfColors = 256}) {
    setState(ViewState.Busy);

    List<int> intList = List.from(imageData);
    final decodedImage = img.decodeImage(intList);
    img.quantize(decodedImage!, numberOfColors: numberOfColors);
    final encodedImage = img.encodeJpg(decodedImage);
    Uint8List temp = Uint8List.fromList(encodedImage);
    _selectedImageBytes = temp;
    _selectedImageHistory.add(temp);

    notifyListeners();
    setState(ViewState.Idle);
  }

  undo() {
    setState(ViewState.Busy);
    if (_selectedImageHistory.length > 2) {
      _selectedImageBytes = _selectedImageHistory.removeLast();
      notifyListeners();
      setState(ViewState.Idle);
    } else {
      _selectedImageBytes = _originalImage;
      notifyListeners();
      setState(ViewState.Idle);
    }
  }

  addOriginal(PickedFile original) {
    Uint8List originalData = File(original.path).readAsBytesSync();
    _selectedImageBytes = originalData;
    _selectedImageHistory.add(originalData);
    notifyListeners();
  }

  initialData(PickedFile original) {
    Uint8List originalData = File(original.path).readAsBytesSync();
    _selectedImageBytes = originalData;
    _originalImage = originalData;
    notifyListeners();
  }

  updateHistory() {
    _selectedImageHistory.add(_selectedImageBytes!);
    notifyListeners();
  }

  getImagePath(PickedFile original) async {
    Directory? appDocumentsDirectory = await getExternalStorageDirectory();
    String appDocumentsPath = appDocumentsDirectory!.path;
    String imageName = uuid.Uuid().v1();
    String imagePath = '$appDocumentsPath/$imageName.png';
    return imagePath;
  }

  screenshotEditedImage(key, PickedFile original) async {
      RenderRepaintBoundary boundary = key.currentContext.findRenderObject();
      var image = await boundary.toImage();
      var byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();
      String path = await getImagePath(original);
      List<int> content = List.from(pngBytes);
      File editedImage = await File(path).writeAsBytes(content);
  }
}

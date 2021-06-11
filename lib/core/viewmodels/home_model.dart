import 'package:blog/core/enums/viewstate.dart';
import 'package:blog/core/viewmodels/base_model.dart';
import 'package:image_picker/image_picker.dart';

class HomeModel extends BaseModel {
  PickedFile? _image;

  PickedFile? get image => _image;

  getImage() async {
    setState(ViewState.Busy);
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile == null) {
      return false;
    }
    _image = pickedFile;
    notifyListeners();
    return true;
  }

  captureImage() async {
    setState(ViewState.Busy);
    final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
    if (pickedFile == null) {
      return false;
    }
    _image = pickedFile;
    notifyListeners();
    return true;
  }
}

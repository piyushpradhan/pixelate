import 'package:blog/core/enums/viewstate.dart';
import 'package:flutter/cupertino.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
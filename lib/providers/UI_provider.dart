import 'package:flutter/cupertino.dart';

class UIProvider extends ChangeNotifier {
  int _pageSelected = 0;

  get pageSelected {
    return _pageSelected; 
  }

  set pageSelected(int i) {
    _pageSelected = i;
    notifyListeners();
  }
}

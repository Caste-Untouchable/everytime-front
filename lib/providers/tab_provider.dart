import 'package:flutter/material.dart';

class TabProvider extends ChangeNotifier {
  int _boardTabIndex = 0;

  int get boardIndex => _boardTabIndex;

  set boardIndex(int index) {
    _boardTabIndex = index;
    notifyListeners();
  }
}

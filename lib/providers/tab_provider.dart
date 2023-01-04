import 'package:flutter/material.dart';

class TabProvider extends ChangeNotifier {
  int _boardTabIndex = 0;
  int _notiTabIndex = 0;

  int get boardIndex => _boardTabIndex;
  int get notiIndex => _notiTabIndex;

  set boardIndex(int index) {
    _boardTabIndex = index;
    notifyListeners();
  }

  set notiIndex(int index) {
    _notiTabIndex = index;
    notifyListeners();
  }
}

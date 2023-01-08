import 'package:clone_everytime/models/user.dart';
import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier {
  final User _userData = User();

  User get userData => _userData;

  void setNameYear(String schoolName, int year) {
    _userData.schoolName = schoolName;
    _userData.registeredYear = year;
  }

  void setUser({required userId, required name, required nickName, required email, required pwd}) {
    _userData.userID = userId;
    _userData.name = name;
    _userData.nickname = nickName;
    _userData.email = email;
    _userData.pwd = pwd;
    _userData.verified = true;
    _userData.point = 0;
    _userData.status = "ACTIVE";
  }
}

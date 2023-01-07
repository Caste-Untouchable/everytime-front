import 'package:flutter/material.dart';

import 'package:clone_everytime/models/user.dart';

class TokenProvider extends ChangeNotifier {
  String jwt = "";

  late User user;

  void setUser(User user) {
    this.user = user;
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';

class Grade {
  Grade({
    this.grade = 'A+',
    this.isMajor = false,
    required this.smt,
  });

  factory Grade.fromJson(String source) => Grade.fromMap(json.decode(source) as Map<String, dynamic>);

  factory Grade.fromMap(Map<String, dynamic> map) {
    return Grade(
      smt: map['smt'] as int,
    );
  }

  double credit = 0.0;
  TextEditingController creditTextController = TextEditingController();
  String grade;
  bool isMajor;
  String lectureName = "";
  TextEditingController nameTextController = TextEditingController();
  int smt;

  @override
  String toString() {
    return 'Grade(credit: $credit, grade: $grade, isMajor: $isMajor, lectureName: $lectureName, smt: $smt)';
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'credit': credit,
      'grade': grade,
      'isMajor': isMajor,
      'lectureName': lectureName,
      'smt': smt,
    };
  }
}

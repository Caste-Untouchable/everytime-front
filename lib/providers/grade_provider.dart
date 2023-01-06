import 'dart:collection';

import 'package:clone_everytime/models/grade_graph_data.dart';
import 'package:flutter/material.dart';

import 'package:clone_everytime/models/gpa_data.dart';

class GradeProvider extends ChangeNotifier {
  List<String> tabTitleList = [
    "1학년 1학기",
    "1학년 2학기",
    "2학년 1학기",
    "2학년 2학기",
    "3학년 1학기",
    "3학년 2학기",
    "4학년 1학기",
    "4학년 2학기",
    "5학년 1학기",
    "5학년 2학기",
  ];

  Map<String, double> gradeGpa = {
    'A+': 4.5,
    'A0': 4.0,
    'B+': 3.5,
    'B0': 3.0,
    'C+': 2.5,
    'C0': 2.0,
    'D+': 1.5,
    'D0': 1.0,
    'F': 0.0,
    'P': 0.0,
    'NP': 0.0
  };

  Map<String, int> gradeCnt = {'A+': 0, 'A0': 0, 'B+': 0, 'B0': 0, 'C+': 0, 'C0': 0, 'D+': 0, 'D0': 0, 'F': 0, 'P': 0, 'NP': 0};
  LinkedHashMap sortedGradeCnt =
      {'A+': 0, 'A0': 0, 'B+': 0, 'B0': 0, 'C+': 0, 'C0': 0, 'D+': 0, 'D0': 0, 'F': 0, 'P': 0, 'NP': 0} as LinkedHashMap;
  var gradeResult = [];

  List<Grade> gradeList = [];
  List<GradeGraphData> gpaList = [];

  int totalCnt = 0;
  double smtCredit = 0;
  double smtGpa = 0;
  double smtMajorGpa = 0;
  double totalCredit = 0;
  double totalGpa = 0;
  double totalMajorGpa = 0;

  int _gradeTabIndex = 0;

  void clear() {
    gradeList.clear();
    refresh();
  }

  int get gradeIndex => _gradeTabIndex;

  set gradeIndex(int index) {
    _gradeTabIndex = index;
    refresh();
  }

  void calcGraph() {
    gpaList = [];
    gradeCnt = {'A+': 0, 'A0': 0, 'B+': 0, 'B0': 0, 'C+': 0, 'C0': 0, 'D+': 0, 'D0': 0, 'F': 0, 'P': 0, 'NP': 0};

    for (int j = 0; j < 8; j++) {
      double tempGpa = 0;
      double tempMajorGpa = 0;

      int tempCnt = 0;
      int tempMajorCnt = 0;

      for (int i = 0; i < gradeList.length; i++) {
        try {
          if (gradeList[i].smt == j && gradeList[i].creditTextController.text != "" && gradeList[i].nameTextController.text != "") {
            gradeCnt[gradeList[i].grade] = gradeCnt[gradeList[i].grade]! + 1;
            tempGpa += gradeGpa[gradeList[i].grade]!;
            if (gradeList[i].isMajor) {
              tempMajorGpa += gradeGpa[gradeList[i].grade]!;
              if (gradeList[i].grade != 'F' && gradeList[i].grade != 'P' && gradeList[i].grade != 'NP') tempMajorCnt++;
            }
            if (gradeList[i].grade != 'F' && gradeList[i].grade != 'P' && gradeList[i].grade != 'NP') tempCnt++;
          }
        } catch (e) {
          continue;
        }
      }

      if (tempCnt != 0) {
        tempGpa /= tempCnt;
      }
      if (tempMajorCnt != 0) tempMajorGpa /= tempMajorCnt;

      final sorted = gradeCnt.keys.toList()..sort((k2, k1) => gradeCnt[k1]!.compareTo(gradeCnt[k2]!));
      sortedGradeCnt = LinkedHashMap.fromIterable(sorted, key: (k) => k, value: (k) => gradeCnt[k]);

      if (tempGpa != 0) gpaList.add(GradeGraphData(x: tabTitleList[j].replaceFirst(" ", "\n"), y: tempGpa, majorY: tempMajorGpa));
    }
    gradeResult = [];
    int tCnt = 0;
    for (var v in sortedGradeCnt.keys) {
      if (sortedGradeCnt[v] != 0 && tCnt < 5) {
        gradeResult.add([v, sortedGradeCnt[v]]);
        tCnt++;
      }
    }
  }

  void calcSmt() {
    int cnt = 0;
    int majorCnt = 0;

    for (int i = 0; i < gradeList.length; i++) {
      try {
        if (gradeList[i].smt == gradeIndex && gradeList[i].creditTextController.text != "" && gradeList[i].nameTextController.text != "") {
          smtCredit += double.parse(gradeList[i].creditTextController.text);
          smtGpa += gradeGpa[gradeList[i].grade]!;
          if (gradeList[i].isMajor) {
            smtMajorGpa += gradeGpa[gradeList[i].grade]!;
            if (gradeList[i].grade != 'F' && gradeList[i].grade != 'P' && gradeList[i].grade != 'NP') majorCnt++;
          }
          if (gradeList[i].grade != 'F' && gradeList[i].grade != 'P' && gradeList[i].grade != 'NP') cnt++;
        }
      } catch (e) {
        continue;
      }
    }
    if (cnt != 0) {
      print(smtGpa);
      smtGpa /= cnt;
    }
    if (majorCnt != 0) smtMajorGpa /= majorCnt;
  }

  void calcTotal() {
    int cnt = 0;
    int majorCnt = 0;

    for (int i = 0; i < gradeList.length; i++) {
      if (gradeList[i].creditTextController.text != "" && gradeList[i].nameTextController.text != "") {
        totalCredit += double.parse(gradeList[i].creditTextController.text);
        totalGpa += gradeGpa[gradeList[i].grade]!;
        if (gradeList[i].grade != 'F' && gradeList[i].grade != 'P' && gradeList[i].grade != 'NP') cnt++;
        if (gradeList[i].isMajor) {
          totalMajorGpa += gradeGpa[gradeList[i].grade]!;
          if (gradeList[i].grade != 'F' && gradeList[i].grade != 'P' && gradeList[i].grade != 'NP') majorCnt++;
        }
      }
    }
    if (cnt != 0) {
      totalGpa /= cnt;
      totalCnt = cnt;
    }
    if (majorCnt != 0) totalMajorGpa /= majorCnt;
  }

  void refresh() {
    totalCnt = 0;
    smtCredit = 0;
    smtGpa = 0;
    smtMajorGpa = 0;
    totalCredit = 0;
    totalGpa = 0;
    totalMajorGpa = 0;

    calcGraph();
    calcSmt();
    calcTotal();

    notifyListeners();
  }
}

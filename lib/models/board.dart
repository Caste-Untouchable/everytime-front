import 'dart:convert';

class Board {
  Board({this.boardTypePK, this.schoolName, this.boardType, this.boardDescription, this.boardTypeClass});

  Board.fromJson(Map<String, dynamic> json) {
    boardTypePK = json['boardTypePK'];
    schoolName = json['schoolName'];
    boardType = json['boardType'];
    boardDescription = json['boardDescription'];
    boardTypeClass = json['boardTypeClass'];
  }

  String? boardDescription;
  String? boardType;
  String? boardTypeClass;
  int? boardTypePK;
  String? schoolName;

  @override
  String toString() {
    return 'Board(boardDescription: $boardDescription, boardType: $boardType, boardTypeClass: $boardTypeClass, boardTypePK: $boardTypePK, schoolName: $schoolName)';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['boardTypePK'] = boardTypePK;
    data['schoolName'] = schoolName;
    data['boardType'] = boardType;
    data['boardDescription'] = boardDescription;
    data['boardTypeClass'] = boardTypeClass;
    return data;
  }
}

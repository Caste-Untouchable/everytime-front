class Article {
  int? boardPK;
  String? schoolName;
  String? nickname;
  int? boardTypePK;
  String? boardTitle;
  String? content;
  int? recommendCount;
  DateTime? createdAT;
  bool? anonymity;
  int? reportCount;
  String? userID;

  Article(
      {this.boardPK,
      this.schoolName,
      this.nickname,
      this.boardTypePK,
      this.boardTitle,
      this.content,
      this.recommendCount,
      this.createdAT,
      this.anonymity,
      this.reportCount,
      this.userID});

  Article.fromJson(Map<String, dynamic> json) {
    boardPK = json['boardPK'];
    schoolName = json['schoolName'];
    nickname = json['nickname'] ?? "익명";
    boardTypePK = json['boardTypePK'];
    boardTitle = json['boardTitle'];
    content = json['content'];
    recommendCount = json['recommendCount'];
    createdAT = DateTime.parse(json['createdAT']);
    anonymity = json['anonymity'];
    reportCount = json['reportCount'];
    userID = json['userID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['boardPK'] = boardPK;
    data['schoolName'] = schoolName;
    data['nickname'] = nickname;
    data['boardTypePK'] = boardTypePK;
    data['boardTitle'] = boardTitle;
    data['content'] = content;
    data['recommendCount'] = recommendCount;
    data['createdAT'] = createdAT;
    data['anonymity'] = anonymity;
    data['reportCount'] = reportCount;
    data['userID'] = userID;
    return data;
  }
}

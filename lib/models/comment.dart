class Comment {
  Comment(
      {this.boardCommentPK,
      this.boardPK,
      this.nickname,
      this.userID,
      this.anonymity,
      this.createdAT,
      this.reportCount,
      this.content,
      this.replyTo});

  Comment.fromJson(Map<String, dynamic> json) {
    boardCommentPK = json['boardCommentPK'];
    boardPK = json['boardPK'];
    nickname = json['nickname'] ?? "익명";
    userID = json['userID'];
    anonymity = json['anonymity'];
    createdAT = DateTime.parse(json['createdAT']);
    reportCount = json['reportCount'];
    content = json['content'];
    replyTo = json['replyTo'];
  }

  bool? anonymity;
  int? boardCommentPK;
  int? boardPK;
  String? content;
  DateTime? createdAT;
  String? nickname;
  int? replyTo;
  int? reportCount;
  String? userID;

  @override
  String toString() {
    return 'Comment(boardCommentPK: $boardCommentPK, boardPK: $boardPK, nickname: $nickname, userID: $userID, anonymity: $anonymity, createdAT: $createdAT, reportCount: $reportCount, content: $content, replyTo: $replyTo)';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['boardCommentPK'] = boardCommentPK;
    data['boardPK'] = boardPK;
    data['nickname'] = nickname;
    data['userID'] = userID;
    data['anonymity'] = anonymity;
    data['createdAT'] = createdAT;
    data['reportCount'] = reportCount;
    data['content'] = content;
    data['replyTo'] = replyTo;
    return data;
  }
}

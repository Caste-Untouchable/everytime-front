import 'package:clone_everytime/const.dart';
import 'package:clone_everytime/models/article.dart';
import 'package:clone_everytime/models/board.dart';
import 'package:clone_everytime/models/comment.dart';
import 'package:clone_everytime/models/school.dart';
import 'package:clone_everytime/models/user.dart';
import 'package:requests/requests.dart';

class EveryTimeApi {
  static Future<List<School>> findSchool() async {
    List<School> schoolList = [];

    var result = await Requests.get("${ApiServer.apiUrl}/school/findAll").then((value) => value.json());

    for (var school in result) {
      schoolList.add(School.fromJson(school));
    }

    return schoolList;
  }

  static Future<List<Article>> getBoardArticle(int boardTypeId, String jwt) async {
    List<Article> articleList = [];

    var result = await Requests.get("${ApiServer.apiUrl}/board/getBoardByBoardType/$boardTypeId", headers: {'jwt': jwt});

    for (var article in result.json()) {
      articleList.add(Article.fromJson(article));
    }
    return articleList;
  }

  static Future<List<Board>> getBoardList(String jwt) async {
    List<Board> boardList = [];

    var result = await Requests.get("${ApiServer.apiUrl}/boardType/getBoardTypeBySchoolName", headers: {'jwt': jwt});

    if (result.statusCode == 200) {
      for (var board in result.json()) {
        boardList.add(Board.fromJson(board));
      }
      return boardList;
    } else {
      return [];
    }
  }

  static Future<List<Comment>> getComment(int articleId, String jwt) async {
    List<Comment> commentList = [];

    var result = await Requests.get("${ApiServer.apiUrl}/boardComment/Board/$articleId", headers: {'jwt': jwt});

    if (result.statusCode == 200) {
      for (var comment in result.json()) {
        commentList.add(Comment.fromJson(comment));
      }
    }

    return commentList;
  }

  static Future<User> getUserData(String jwt) async {
    var result = await Requests.get("${ApiServer.apiUrl}/user/info", headers: {'jwt': jwt});

    if (result.statusCode == 200) {
      return User.fromJson(result.json());
    } else {
      return User();
    }
  }

  static Future<String> login({required String id, required String pw}) async {
    var result = await Requests.post("${ApiServer.apiUrl}/user/login", json: {'userID': id, 'pwd': pw});

    if (result.statusCode == 200) {
      return result.body;
    } else {
      return "";
    }
  }

  static Future<bool> signUp(User userData) async {
    var result = await Requests.post(
      "${ApiServer.apiUrl}/user/signup",
      json: userData.toJson(),
    );

    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> updatePassword(User userData, String jwt) async {
    var result = await Requests.patch("${ApiServer.apiUrl}/user/update", headers: {'jwt': jwt}, json: userData.toJson());

    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}

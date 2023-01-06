import 'package:clone_everytime/const.dart';
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
}

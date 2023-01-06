import 'package:clone_everytime/const.dart';
import 'package:clone_everytime/models/school.dart';
import 'package:requests/requests.dart';

class EveryTimeApi {
  Future<SchoolList> findSchool() async {
    var result = await Requests.get("${ApiServer.apiUrl}/school/findAll");

    SchoolList schoolList = SchoolList.fromJson(result.json());
    print(schoolList);

    return schoolList;
  }
}

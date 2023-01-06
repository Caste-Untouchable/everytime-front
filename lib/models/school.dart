// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class School {
  School({
    required this.schoolName,
    required this.location,
    required this.tell,
    required this.fax,
    required this.urlHone,
    required this.urlStudyRoom,
    required this.urlShuttle,
    required this.urlNotice,
    required this.urlCalendar,
    required this.urlLibrary,
  });

  factory School.fromJson(String source) => School.fromMap(json.decode(source) as Map<String, dynamic>);

  factory School.fromMap(Map<String, dynamic> map) {
    return School(
      schoolName: map['schoolName'] as String,
      location: map['location'] as String,
      tell: map['tell'] as String,
      fax: map['fax'] as String,
      urlHone: map['urlHone'] as String,
      urlStudyRoom: map['urlStudyRoom'] as String,
      urlShuttle: map['urlShuttle'] as String,
      urlNotice: map['urlNotice'] as String,
      urlCalendar: map['urlCalendar'] as String,
      urlLibrary: map['urlLibrary'] as String,
    );
  }

  String fax;
  String location;
  String schoolName;
  String tell;
  String urlCalendar;
  String urlHone;
  String urlLibrary;
  String urlNotice;
  String urlShuttle;
  String urlStudyRoom;

  @override
  String toString() {
    return 'School(schoolName: $schoolName, location: $location, tell: $tell, fax: $fax, urlHone: $urlHone, urlStudyRoom: $urlStudyRoom, urlShuttle: $urlShuttle, urlNotice: $urlNotice, urlCalendar: $urlCalendar, urlLibrary: $urlLibrary)';
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'schoolName': schoolName,
      'location': location,
      'tell': tell,
      'fax': fax,
      'urlHone': urlHone,
      'urlStudyRoom': urlStudyRoom,
      'urlShuttle': urlShuttle,
      'urlNotice': urlNotice,
      'urlCalendar': urlCalendar,
      'urlLibrary': urlLibrary,
    };
  }
}

class SchoolList {
  SchoolList({
    required this.schoolList,
  });

  factory SchoolList.fromJson(String source) => SchoolList.fromMap(json.decode(source) as Map<String, dynamic>);

  factory SchoolList.fromMap(Map<String, dynamic> map) {
    return SchoolList(
      schoolList: List<School>.from(
        (map['schoolList'] as List<int>).map<School>(
          (x) => School.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  List<School> schoolList;

  @override
  String toString() => 'SchoolList(schoolList: $schoolList)';

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'schoolList': schoolList.map((x) => x.toMap()).toList(),
    };
  }
}

import 'dart:convert';

class LectureInfo {
  String userId;
  String lectureName;
  String lectureRoom;
  double startTime;
  double endTime;

  LectureInfo({
    required this.userId,
    required this.lectureName,
    required this.lectureRoom,
    required this.startTime,
    required this.endTime,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'lectureName': lectureName,
      'lectureRoom': lectureRoom,
      'startTime': startTime,
      'endTime': endTime,
    };
  }

  factory LectureInfo.fromMap(Map<String, dynamic> map) {
    return LectureInfo(
      userId: map['userId'] as String,
      lectureName: map['lectureName'] as String,
      lectureRoom: map['lectureRoom'] as String,
      startTime: map['startTime'] as double,
      endTime: map['endTime'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory LectureInfo.fromJson(String source) => LectureInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LectureInfo(userId: $userId, lectureName: $lectureName, lectureRoom: $lectureRoom, startTime: $startTime, endTime: $endTime)';
  }
}

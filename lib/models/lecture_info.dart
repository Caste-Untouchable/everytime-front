import 'dart:convert';

class LectureInfo {
  LectureInfo({
    required this.userId,
    required this.lectureName,
    required this.lectureRoom,
    required this.startTime,
    required this.endTime,
  });

  factory LectureInfo.fromJson(String source) => LectureInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  factory LectureInfo.fromMap(Map<String, dynamic> map) {
    return LectureInfo(
      userId: map['userId'] as String,
      lectureName: map['lectureName'] as String,
      lectureRoom: map['lectureRoom'] as String,
      startTime: map['startTime'] as double,
      endTime: map['endTime'] as double,
    );
  }

  double endTime;
  String lectureName;
  String lectureRoom;
  double startTime;
  String userId;

  @override
  String toString() {
    return 'LectureInfo(userId: $userId, lectureName: $lectureName, lectureRoom: $lectureRoom, startTime: $startTime, endTime: $endTime)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'lectureName': lectureName,
      'lectureRoom': lectureRoom,
      'startTime': startTime,
      'endTime': endTime,
    };
  }

  String toJson() => json.encode(toMap());
}

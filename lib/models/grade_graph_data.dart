import 'dart:convert';

class GradeGraphData {
  GradeGraphData({
    required this.x,
    required this.y,
    required this.majorY,
  });

  factory GradeGraphData.fromJson(String source) => GradeGraphData.fromMap(json.decode(source) as Map<String, dynamic>);

  factory GradeGraphData.fromMap(Map<String, dynamic> map) {
    return GradeGraphData(
      majorY: map['majorY'] as double,
      x: map['x'] as String,
      y: map['y'] as double,
    );
  }

  double majorY;
  String x;
  double y;

  @override
  String toString() => 'GradeData(majorY: $majorY, x: $x, y: $y)';

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'majorY': majorY,
      'x': x,
      'y': y,
    };
  }
}

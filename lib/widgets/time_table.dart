import 'package:clone_everytime/models/lecture_info.dart';
import 'package:flutter/material.dart';

final List week = ['월', '화', '수', '목', '금'];
final List time = [9, 10, 11, 12, 1, 2, 3, 4, 5, 6, 7];

var kColumnLength = 18;
double kFirstColumnHeight = 20;
double kBoxSize = 50;

Expanded buildTimeColumn() {
  return Expanded(
    child: Column(
      children: [
        SizedBox(
          height: kFirstColumnHeight,
        ),
        ...List.generate(
          kColumnLength,
          (index) {
            if (index % 2 == 0) {
              return const Divider(
                color: Colors.grey,
                height: 0,
              );
            }
            return SizedBox(
              height: kBoxSize,
              child: Center(child: Text('${time[index ~/ 2]}')),
            );
          },
        ),
      ],
    ),
  );
}

List<Widget> buildDayColumn(int index) {
  return [
    const VerticalDivider(
      color: Colors.grey,
      width: 0,
    ),
    Expanded(
      flex: 4,
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 20,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    '${week[index]}',
                  ),
                ),
              ),
              ...List.generate(
                kColumnLength,
                (index) {
                  if (index % 2 == 0) {
                    return const Divider(
                      color: Colors.grey,
                      height: 0,
                    );
                  }
                  return SizedBox(
                    height: kBoxSize,
                    child: Container(),
                  );
                },
              ),
            ],
          ),
          if (index == 1)
            buildLectureBox(
              LectureInfo(userId: "jins4218", lectureName: "인공지능", lectureRoom: "정보812", startTime: 1, endTime: 3),
              Colors.green,
            ),
          if (index == 3)
            buildLectureBox(
              LectureInfo(userId: "jins4218", lectureName: "마이크로컨트롤러응용", lectureRoom: "정보812", startTime: 4, endTime: 5),
              Colors.red[300]!,
            ),
        ],
      ),
    ),
  ];
}

Widget buildLectureBox(LectureInfo lectureInfo, Color color) {
  return Positioned(
    top: kFirstColumnHeight + kBoxSize * lectureInfo.startTime,
    height: kBoxSize * (lectureInfo.endTime - lectureInfo.startTime),
    width: 68,
    child: Container(
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.white, width: 1.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              lectureInfo.lectureName,
              style: const TextStyle(color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.w600),
            ),
            Text(
              lectureInfo.lectureRoom,
              style: const TextStyle(color: Colors.white, fontSize: 10.0, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    ),
  );
}

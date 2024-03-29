import 'package:flutter/material.dart';

import 'package:clone_everytime/const.dart';
import 'package:clone_everytime/models/lecture_info.dart';

final List week = ['월', '화', '수', '목', '금'];
final List time = [9, 10, 11, 12, 1, 2, 3, 4, 5, 6, 7];

var kColumnLength = 18;
double kFirstColumnHeight = 20;
double kBoxSize = 50;

Widget buildTimeTable() {
  return Container(
    height: kColumnLength / 2 * kBoxSize + kColumnLength + 4,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey[300]!),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      children: [
        buildTimeColumn(),
        for (int i = 0; i < 5; i++)
          Expanded(
            child: Row(
              children: buildDayColumn(i),
            ),
          ),
      ],
    ),
  );
}

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

Widget buildGPAColumn({required String title, required double gpa, required double maxGPA, bool isTotal = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: const TextStyle(fontSize: 13.0)),
      const SizedBox(height: 5.0),
      RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: gpa.toStringAsFixed(2),
              style: const TextStyle(color: EveryTimeColor.red, fontSize: 25.0, fontWeight: FontWeight.w800),
            ),
            TextSpan(
              text: isTotal ? " / ${maxGPA.toStringAsFixed(0)}" : " / $maxGPA",
              style: const TextStyle(color: Colors.grey, fontSize: 15.0),
            ),
          ],
        ),
      ),
    ],
  );
}

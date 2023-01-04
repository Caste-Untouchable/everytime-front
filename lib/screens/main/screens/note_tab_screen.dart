import 'package:clone_everytime/screens/main/widgets/noti_widget.dart';
import 'package:flutter/material.dart';

class NoteTabScreen extends StatelessWidget {
  const NoteTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          NoteTile(
            board: "익명",
            text: "ㅎㅇ",
            date: DateTime(2023, 1, 4, 22, 04),
          ),
          NoteTile(
            board: "익명",
            text: "감사합니다!!",
            date: DateTime(2022, 3, 8, 17, 19),
            unRead: 1,
          ),
        ],
      ),
    );
  }
}

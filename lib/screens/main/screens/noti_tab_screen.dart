import 'package:clone_everytime/screens/main/widgets/noti_widget.dart';
import 'package:flutter/material.dart';

class NotiTabScreen extends StatelessWidget {
  const NotiTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          NotiTile(
            board: "새내기게시판",
            title: "어제 가장 HOT했던 글이에요: 🤍반갑습니다 제12대 MAIN 희망의료보건생활대학 학생회입니다🤍",
            date: DateTime(2023, 1, 4, 12, 15),
          ),
          NotiTile(
            board: "자유게시판",
            title: "어제 가장 HOT했던 글이에요: 이 해를 보고 공감을 누르면",
            date: DateTime(2023, 1, 2, 12, 41),
          ),
          NotiTile(
            board: "자유게시판",
            title: "어제 가장 HOT했던 글이에요: 성적우수장학생 선발",
            date: DateTime(2022, 12, 30, 12, 4),
            isRead: true,
          ),
        ],
      ),
    );
  }
}

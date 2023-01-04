import 'package:flutter/material.dart';

import 'package:clone_everytime/screens/main/widgets/board_widget.dart';
import 'package:clone_everytime/widgets/everytime_card.dart';

class BoardTabScreen extends StatelessWidget {
  const BoardTabScreen({super.key});

  Widget buildDefaultBoard() {
    final List<String> boardName = ["내가 쓴 글", "댓글 단 글", "스크랩", "HOT 게시판", "BEST 게시판"];
    final List<String> iconName = ["myarticle", "mycomment", "scrap", "hotarticle", "bestarticle"];

    return OutlinedCard(
      padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
      child: Column(
        children: [
          for (int i = 0; i < boardName.length; i++)
            BoardListButton(
              boardName: boardName[i],
              iconName: iconName[i],
              onTap: () {},
            ),
        ],
      ),
    );
  }

  Widget buildPinnedBoard() {
    final List<String> boardName = ["자유게시판", "비밀게시판", "졸업생게시판", "새내기게시판", "시사이슈", "장터게시판", "정보게시판"];

    return OutlinedCard(
      padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
      child: Column(
        children: [
          for (int i = 0; i < boardName.length; i++)
            BoardListButton(
              boardName: boardName[i],
              iconName: i % 2 == 0 ? "pin_on" : "pin_off",
              isNew: i % 2 == 0 ? true : false,
              onTap: () {},
            ),
        ],
      ),
    );
  }

  Widget buildCampusBoard() {
    final List<String> boardName = ["오늘의 학식", "강의실", "스터디", "책방"];
    final List<String> iconName = ["haksik", "classroom", "study", "bookstore"];

    return OutlinedCard(
      padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
      child: Column(
        children: [
          for (int i = 0; i < boardName.length; i++)
            BoardListButton(
              boardName: boardName[i],
              iconName: iconName[i],
              onTap: () {},
            ),
        ],
      ),
    );
  }

  Widget buildExpansionBoard() {
    final List<String> courseBoardList = ["취업·진로"];
    final List<String> advertiseBoardList = ["동아리·학회", "홍보게시판"];
    final List<String> groupBoardList = ["STAND BY ICT 공과대학", "All:ways 애국 상경대학"];
    final List<String> deptBoardList = ["간호학과 게시판, 한의학과 게시판"];

    return Column(
      children: [
        BoardExpansionTile(title: "진로", boardList: courseBoardList),
        const SizedBox(height: 10.0),
        BoardExpansionTile(title: "홍보", boardList: advertiseBoardList),
        const SizedBox(height: 10.0),
        BoardExpansionTile(title: "단체", boardList: groupBoardList),
        const SizedBox(height: 10.0),
        BoardExpansionTile(title: "학과", boardList: deptBoardList),
      ],
    );
  }

  Widget buildOtherBoard() {
    final List<String> boardName = ["오늘의 학식", "강의실", "스터디", "책방"];
    final List<String> boardSubTitle = ["부제목", "부제목", "부제목", "부제목"];

    return OutlinedCard(
      padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
      child: Column(
        children: [
          for (int i = 0; i < boardName.length; i++)
            BoardListButton(
              boardName: boardName[i],
              subTitle: boardSubTitle[i],
              iconName: i % 2 == 0 ? "pin_on" : "pin_off",
              isNew: i % 2 == 0 ? true : false,
              onTap: () {},
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildDefaultBoard(),
          const SizedBox(height: 10.0),
          buildPinnedBoard(),
          const SizedBox(height: 10.0),
          buildCampusBoard(),
          const SizedBox(height: 10.0),
          buildExpansionBoard(),
          const SizedBox(height: 10.0),
          buildOtherBoard(),
        ],
      ),
    );
  }
}

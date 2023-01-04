import 'package:clone_everytime/screens/main/widgets/board_widget.dart';
import 'package:clone_everytime/widgets/everytime_card.dart';
import 'package:flutter/material.dart';

class BoardTabScreen extends StatelessWidget {
  const BoardTabScreen({super.key});

  Widget buildDefaultBoard() {
    final List<String> boardName = ["내가 쓴 글", "댓글 단 글", "스크랩", "HOT 게시판", "BEST 게시판"];
    final List<String> iconName = ["myarticle", "mycomment", "scrap", "hotarticle", "bestarticle"];

    return OutlinedCard(
      padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
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
      padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildDefaultBoard(),
        const SizedBox(height: 10.0),
        buildPinnedBoard(),
        const SizedBox(height: 10.0),
      ],
    );
  }
}

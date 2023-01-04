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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildDefaultBoard(),
        const SizedBox(height: 10),
      ],
    );
  }
}

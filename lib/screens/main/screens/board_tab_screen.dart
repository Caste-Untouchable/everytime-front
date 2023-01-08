import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:clone_everytime/models/board.dart';
import 'package:clone_everytime/providers/board_provider.dart';
import 'package:clone_everytime/providers/user_provider.dart';
import 'package:clone_everytime/screens/main/widgets/board_widget.dart';
import 'package:clone_everytime/widgets/everytime_card.dart';

class BoardTabScreen extends StatelessWidget {
  BoardTabScreen({super.key});

  late BoardProvider _boardProvider;
  late UserProvider _tokenProvider;

  Widget buildDefaultBoard() {
    final List<Board> boardList = [
      Board(boardType: "내가 쓴 글"),
      Board(boardType: "댓글 단 글"),
      Board(boardType: "스크랩"),
      Board(boardType: "HOT 게시판"),
      Board(boardType: "BEST 게시판")
    ];
    final List<String> iconName = ["myarticle", "mycomment", "scrap", "hotarticle", "bestarticle"];

    return OutlinedCard(
      padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
      child: Column(
        children: [
          for (int i = 0; i < boardList.length; i++)
            BoardListButton(
              board: boardList[i],
              iconName: iconName[i],
            ),
        ],
      ),
    );
  }

  Widget buildPinnedBoard() {
    List<Board> boardList = _boardProvider.generalBoardList;

    return Consumer(builder: (context, provider, child) {
      return OutlinedCard(
        padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
        child: Column(
          children: [
            for (int i = 0; i < boardList.length; i++)
              BoardListButton(
                board: boardList[i],
                iconName: i % 2 == 0 ? "pin_on" : "pin_off",
                isNew: true,
              ),
          ],
        ),
      );
    });
  }

  Widget buildCampusBoard() {
    final List<Board> boardName = [
      Board(boardType: "오늘의 학식"),
      Board(boardType: "강의실"),
      Board(boardType: "스터디"),
      Board(boardType: "책방"),
    ];
    final List<String> iconName = ["haksik", "classroom", "study", "bookstore"];

    return OutlinedCard(
      padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
      child: Column(
        children: [
          for (int i = 0; i < boardName.length; i++)
            BoardListButton(
              board: boardName[i],
              iconName: iconName[i],
            ),
        ],
      ),
    );
  }

  Widget buildExpansionBoard() {
    return Column(
      children: [
        BoardExpansionTile(title: "진로", boardList: _boardProvider.careerBoardList),
        const SizedBox(height: 10.0),
        BoardExpansionTile(title: "홍보", boardList: _boardProvider.noticeBoardList),
        const SizedBox(height: 10.0),
        BoardExpansionTile(title: "단체", boardList: _boardProvider.groupBoardList),
        const SizedBox(height: 10.0),
        BoardExpansionTile(title: "학과", boardList: _boardProvider.degreeBoardList),
      ],
    );
  }

  Widget buildOtherBoard() {
    List<Board> boardList = _boardProvider.etcBoardList;

    return OutlinedCard(
      padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
      child: Column(
        children: [
          for (int i = 0; i < boardList.length; i++)
            BoardListButton(
              board: boardList[i],
              subTitle: boardList[i].boardDescription,
              iconName: "pin_off",
              isNew: i % 2 == 0 ? true : false,
            ),
        ],
      ),
    );
  }

  Widget buildAllBoard() {
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

  @override
  Widget build(BuildContext context) {
    _boardProvider = Provider.of<BoardProvider>(context);
    _tokenProvider = Provider.of<UserProvider>(context);
    _boardProvider.getBoardData(_tokenProvider.jwt);

    if (_boardProvider.generalBoardList.isEmpty) {
      return FutureBuilder(
          future: _boardProvider.getBoardData(_tokenProvider.jwt),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return buildAllBoard();
            }
          });
    } else {
      return buildAllBoard();
    }
  }
}

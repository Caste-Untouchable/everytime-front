import 'dart:math';

import 'package:flutter/material.dart';

import 'package:clone_everytime/models/board.dart';
import 'package:clone_everytime/utils/database/every_time_api.dart';

class BoardProvider extends ChangeNotifier {
  List<Board> careerBoardList = [];
  List<Board> degreeBoardList = [];
  List<Board> etcBoardList = [];
  List<Board> generalBoardList = [];
  List<Board> groupBoardList = [];
  List<Board> noticeBoardList = [];

  void clearBoard() {
    careerBoardList.clear();
    degreeBoardList.clear();
    etcBoardList.clear();
    generalBoardList.clear();
    groupBoardList.clear();
    noticeBoardList.clear();
  }

  getBoardData(String jwt) async {
    List<Board> boardList = await EveryTimeApi.getBoardList(jwt);

    clearBoard();

    for (var board in boardList) {
      if (board.boardTypeClass == "CAREER") {
        careerBoardList.add(board);
      } else if (board.boardTypeClass == "DEGREE") {
        degreeBoardList.add(board);
      } else if (board.boardTypeClass == "ETC") {
        etcBoardList.add(board);
      } else if (board.boardTypeClass == "GENERAL") {
        generalBoardList.add(board);
      } else if (board.boardTypeClass == "GROUP") {
        groupBoardList.add(board);
      } else if (board.boardTypeClass == "NOTICE") {
        noticeBoardList.add(board);
      }
    }
  }
}

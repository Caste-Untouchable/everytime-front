import 'package:flutter/material.dart';
import 'package:clone_everytime/screens/board/store_board.dart';
import 'package:clone_everytime/screens/board/politics_board.dart';
import 'package:clone_everytime/screens/login/login_screen.dart';
import 'package:clone_everytime/screens/main_screen.dart';

import 'board/free_board.dart';

class TempScreen extends StatelessWidget {
  const TempScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => LoginScreen())));
                },
                child: const Text("로그인 화면")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => MainScreen())));
                },
                child: const Text("메인 화면")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => PoliticsBoard())));
                },
                child: const Text("시사 이슈 게시판")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => StoreBoard())));
                },
                child: const Text("장터 게시판")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => FreeBoard())));
                },
                child: const Text("자유 게시판")),
          ],
        ),
      ),
    );
  }
}

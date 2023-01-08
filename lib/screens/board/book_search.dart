import 'package:clone_everytime/main.dart';
import 'package:clone_everytime/screens/board/free_board_detail.dart';
import 'package:flutter/material.dart';
import 'book_board.dart';
import 'book_sell.dart';

class BookSearch extends StatefulWidget {
  const BookSearch({super.key});

  @override
  State<BookSearch> createState() => _BookSearchState();
}

class _BookSearchState extends State<BookSearch> {
  int current_index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close))
        ],
        title: const Text("판매하기"),
      ),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: Text(
                "판매하실 책을 검색하세요.",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: TextField(
                autofocus: true,
                cursorColor: const Color.fromARGB(255, 219, 53, 41),
                decoration: InputDecoration(
                  hintText: 'ISBN 혹은 책 이름',
                  border: InputBorder.none,
                  //focusedBorder: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 243, 243, 243)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 243, 243, 243),
                  contentPadding: const EdgeInsets.only(left: 14.0),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 243, 243, 243)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: Transform.scale(
                    scale: 0.5,
                    child: Image.asset(
                      'assets/icons/icn_m_search_gray800.png',
                      color: const Color.fromARGB(255, 137, 137, 137),
                      width: 15,
                      height: 15,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

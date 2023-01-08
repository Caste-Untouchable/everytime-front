import 'package:clone_everytime/main.dart';
import 'package:clone_everytime/screens/board/free_board_detail.dart';
import 'package:flutter/material.dart';
import 'book_board.dart';
import 'book_sell.dart';

class BookWrite extends StatefulWidget {
  const BookWrite({super.key});

  @override
  State<BookWrite> createState() => _BookWriteState();
}

class _BookWriteState extends State<BookWrite> {
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
      body: ListView(
        children: [
          Center(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Text(
                    "자세한 책 정보를 적어주세요.",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                  child: TextField(
                    cursorColor: const Color.fromARGB(255, 219, 53, 41),
                    decoration: InputDecoration(
                      hintText: '책 이름',
                      border: InputBorder.none,
                      //focusedBorder: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 243, 243, 243)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 243, 243, 243),
                      //contentPadding: const EdgeInsets.only(left: 14.0),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 243, 243, 243)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                  child: TextField(
                    cursorColor: const Color.fromARGB(255, 219, 53, 41),
                    decoration: InputDecoration(
                      hintText: '저자',
                      border: InputBorder.none,
                      //focusedBorder: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 243, 243, 243)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 243, 243, 243),
                      //contentPadding: const EdgeInsets.only(left: 14.0),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 243, 243, 243)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                  child: TextField(
                    cursorColor: const Color.fromARGB(255, 219, 53, 41),
                    decoration: InputDecoration(
                      hintText: '출판사',
                      border: InputBorder.none,
                      //focusedBorder: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 243, 243, 243)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 243, 243, 243),
                      //contentPadding: const EdgeInsets.only(left: 14.0),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 243, 243, 243)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                  child: TextField(
                    cursorColor: const Color.fromARGB(255, 219, 53, 41),
                    decoration: InputDecoration(
                      hintText: '출판일(ex. 20160101)',
                      border: InputBorder.none,
                      //focusedBorder: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 243, 243, 243)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 243, 243, 243),
                      //contentPadding: const EdgeInsets.only(left: 14.0),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 243, 243, 243)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                  child: TextField(
                    cursorColor: const Color.fromARGB(255, 219, 53, 41),
                    decoration: InputDecoration(
                      hintText: '정가(ex. 17000)',
                      border: InputBorder.none,
                      //focusedBorder: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 243, 243, 243)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 243, 243, 243),
                      //contentPadding: const EdgeInsets.only(left: 14.0),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 243, 243, 243)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 206, 206, 206)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(6.0),
                          child: Text(
                            "다시검색",
                            style: TextStyle(
                                color: Color.fromARGB(255, 206, 206, 206),
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 206, 206, 206),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(6.0),
                          child: Text(
                            "다음",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

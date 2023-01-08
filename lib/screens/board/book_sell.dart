import 'package:clone_everytime/main.dart';
import 'package:clone_everytime/screens/board/board_my_page.dart';
import 'package:clone_everytime/screens/board/book_search.dart';
import 'package:clone_everytime/screens/board/book_write.dart';
import 'package:clone_everytime/screens/board/free_board_detail.dart';
import 'package:flutter/material.dart';

import 'book_board.dart';

class BookSell extends StatefulWidget {
  const BookSell({super.key});

  @override
  State<BookSell> createState() => _BookSellState();
}

class _BookSellState extends State<BookSell> {
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
                  "어떤책을 판매하실 건가요?",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    //바코드 인식만들기
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.red,
                    ),
                    width: 300,
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                      child: Center(
                          child: Text(
                        "카메라로 바코드 스캔",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const BookSearch())));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 206, 206, 206)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: 300,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                          child: Text("ISBN 혹은 책 이름으로 검색",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.black))),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const BookWrite())));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 206, 206, 206)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: 300,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                          child: Text("수동으로 정보 입력",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.black))),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: const Color.fromARGB(255, 243, 243, 243),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const BookBoard())));
                },
                child: SizedBox(
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: const [
                        Icon(
                          Icons.home_outlined,
                          size: 25,
                        ),
                        Text("     홈     ")
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const BookSell())));
                },
                child: SizedBox(
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/icons/icn_m_edit_red.png',
                          color: Colors.black,
                          width: 25,
                          height: 25,
                        ),
                        const Text("판매하기")
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const BookMyPage())));
                },
                child: SizedBox(
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: const [
                        Icon(
                          Icons.shopping_cart_outlined,
                          size: 25,
                        ),
                        Text("마이페이지")
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

import 'package:clone_everytime/main.dart';
import 'package:clone_everytime/screens/board/free_board_detail.dart';
import 'package:flutter/material.dart';

import 'book_board.dart';
import 'book_sell.dart';

class BookMyPage extends StatefulWidget {
  const BookMyPage({super.key});

  @override
  State<BookMyPage> createState() => _BookMyPageState();
}

class _BookMyPageState extends State<BookMyPage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this, //vsync에 this 형태로 전달해야 애니메이션이 정상 처리됨
    );
    super.initState();
  }

  int current_index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close))
          ],
          title: const Text("마이페이지"),
        ),
        body: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                indicatorPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                indicatorColor: const Color.fromARGB(255, 0, 0, 0),
                isScrollable: false,
                labelStyle: const TextStyle(fontSize: 15.0),
                unselectedLabelStyle: const TextStyle(fontSize: 15.0),
                labelColor: const Color.fromARGB(255, 0, 0, 0),
                labelPadding: const EdgeInsets.only(left: 10, right: 10),
                unselectedLabelColor: Colors.grey,
                controller: _tabController,
                tabs: const [
                  Tab(text: "판매 중인 책"),
                  Tab(text: "쪽지함"),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(controller: _tabController, children: const []),
            ),
          ],
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

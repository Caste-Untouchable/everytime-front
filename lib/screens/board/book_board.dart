import 'package:clone_everytime/main.dart';
import 'package:clone_everytime/screens/board/free_board_detail.dart';
import 'package:flutter/material.dart';

import 'board_my_page.dart';
import 'book_sell.dart';

class BookBoard extends StatefulWidget {
  const BookBoard({super.key});

  @override
  State<BookBoard> createState() => _BookBoardState();
}

class _BookBoardState extends State<BookBoard> {
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
          title: const Text("책방"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: TextField(
                autofocus: true,
                cursorColor: const Color.fromARGB(255, 219, 53, 41),
                decoration: InputDecoration(
                  hintText: '구매할 책을 검색하세요!',
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
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
              child: Container(
                height: 40,
                color: const Color.fromARGB(255, 243, 243, 243),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("최근 올라온 책"),
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 206, 206, 206)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(6.0),
                            child: Text(
                              "동의대 ∨",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 206, 206, 206)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Expanded(child: BookList())
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

const bookIcon = [
  "assets/images/test.jpg",
  "assets/images/test.jpg",
  "assets/images/test.jpg",
];
const bookTitle = [
  "book1",
  "book2",
  "book1",
];
const bookWriter = [
  "작가1",
  "작가2",
  "작가3",
];
const bookCompany = [
  "출판사1",
  "출판사2",
  "출판사3",
];
const sale = [
  "12,000",
  "12,000",
  "12,000",
];
const money = [
  "23,000",
  "23,000",
  "23,000",
];

class BookList extends StatelessWidget {
  const BookList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: bookIcon.length,
      itemBuilder: (BuildContext context, index) {
        return InkWell(
          onTap: () {
            //Navigator.push(
            //    context,
            //    MaterialPageRoute(
            //        builder: ((context) => const bookSell())));
          },
          child: Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  bookIcon[index],
                  width: 100,
                  height: 100,
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      bookTitle[index],
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      bookWriter[index],
                      style: const TextStyle(fontSize: 11),
                    ),
                    Text(
                      bookCompany[index],
                      style: const TextStyle(fontSize: 11),
                    ),
                    Row(
                      children: [
                        Text(
                          "${sale[index]}원",
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.red,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${money[index]}원",
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.lineThrough),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Padding(
          padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
          child:
              Divider(color: Color.fromARGB(255, 194, 194, 194), thickness: 1),
        );
      },
    );
  }
}

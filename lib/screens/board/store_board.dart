import 'package:flutter/material.dart';
import 'package:clone_everytime/screens/board/store_board_search.dart';
import 'package:clone_everytime/screens/board/store_board_write.dart';
import 'package:clone_everytime/screens/board/store_board_detail.dart';
import 'package:flutter_html/flutter_html.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class StoreBoard extends StatefulWidget {
  const StoreBoard({super.key});

  @override
  State<StoreBoard> createState() => _PoliticsBoardState();
}

class _PoliticsBoardState extends State<StoreBoard>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 5,
      vsync: this, //vsync에 this 형태로 전달해야 애니메이션이 정상 처리됨
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                    SliverAppBar(
                      title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text('장터게시판',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w900)),
                            SizedBox(
                              height: 3,
                            ),
                            Text('동의대',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w100,
                                    color: Color.fromARGB(255, 142, 141, 141)))
                          ]),
                      actions: [
                        IconButton(
                            icon: Image.asset(
                                'assets/icons/icn_m_search_gray800.png',
                                width: 25,
                                height: 25),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          const StoreBoardSearch())));
                            }),
                        PopupMenuButton(
                          child: const ImageIcon(
                            AssetImage(
                              'assets/icons/icn_m_more_gray800.png',
                            ),
                            size: 20,
                          ),
                          onSelected: (SampleItem item) async {
                            if (item == SampleItem.itemOne) {
                              //새로 고침 기능 추가
                            }
                            if (item == SampleItem.itemTwo) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          const StoreBoardWrite())));
                            }
                            if (item == SampleItem.itemThree) {
                              // 즐겨찾기 기능 추가
                            }
                          },
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<SampleItem>>[
                            const PopupMenuItem<SampleItem>(
                              value: SampleItem.itemOne,
                              child: Text("새로고침          "),
                            ),
                            const PopupMenuItem<SampleItem>(
                              value: SampleItem.itemTwo,
                              child: Text("글 쓰기"),
                            ),
                            const PopupMenuItem<SampleItem>(
                                value: SampleItem.itemThree,
                                //즐겨찾기 추가 삭제 기능 추가해야함
                                child: Text("즐겨찾기")),
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                          height: 10,
                        ),
                      ],
                    ),
                  ],
              body: Stack(
                children: [
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TabBar(
                          indicatorPadding:
                              const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          indicatorColor:
                              const Color.fromARGB(255, 206, 67, 67),
                          isScrollable: true,
                          labelStyle: const TextStyle(fontSize: 15.0),
                          unselectedLabelStyle: const TextStyle(fontSize: 15.0),
                          labelColor: const Color.fromARGB(255, 206, 67, 67),
                          labelPadding:
                              const EdgeInsets.only(left: 10, right: 10),
                          unselectedLabelColor: Colors.grey,
                          controller: _tabController,
                          tabs: const [
                            Tab(text: "전체"),
                            Tab(text: "팝니다"),
                            Tab(text: "삽니다"),
                            Tab(text: "나눔"),
                            Tab(text: "원룸"),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                            controller: _tabController,
                            children: const [
                              storeDB(),
                              storeDB(),
                              storeDB(),
                              storeDB(),
                              storeDB(),
                            ]),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            side: const BorderSide(
                                width: 1, // the thickness
                                color: Color.fromARGB(255, 194, 194,
                                    194) // the color of the border
                                ),
                            backgroundColor:
                                const Color.fromARGB(255, 242, 242, 242),
                            minimumSize: const Size(80, 50),
                            elevation: 0,
                            maximumSize: const Size(110, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Row(
                            children: [
                              Image.asset('assets/icons/icn_m_edit_red.png',
                                  width: 25, height: 25),
                              const Text(
                                '  글 쓰기',
                                style: TextStyle(
                                    fontSize: 13.5,
                                    color: Color.fromARGB(255, 62, 62, 62),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        const StoreBoardWrite())));
                          }),
                    ),
                  )
                ],
              )),
        ),
      );
}

const title = [
  "기이이이이인아속보12345이ㅗㄴㅁ옿ㄴㅁ오ㅓㅁㄴㅇㅁㅇ넘ㅇ넘ㄴ엄ㄴ어ㅏ",
  "속보2",
  "기이이이이인 속보1234",
  "기이이이이인 속보기이이이이인 속보아ㅇㄴㄴㅁㅇㅇㄴㅁ",
  "속보1",
  "속보2",
  "속보3",
  "기이이이이인 속보",
  "기이이이이인아속보12345이ㅗㄴㅁ옿ㄴㅁ오ㅓㅁㄴㅇㅁㅇ넘ㅇ넘ㄴ엄ㄴ어ㅏ",
  "속보2",
  "기이이이이인 속보1234",
  "기이이이이인 속보기이이이이인 속보아ㅇㄴㄴㅁㅇㅇㄴㅁ",
  "속보1",
  "속보2",
  "속보3",
  "기이이이이인 속보",
];
const text = [
  "유익한 정보1",
  "유익한 정보2",
  "유익한 정보3ㅁ옿ㅁㄴ온몬ㅁ온너ㅗㅎㅇㄴㅁㄹ욪뎌ㅓ점ㄴㅇㅎㅂㅈ",
  "기이이인 정보",
  "유익한 정보1",
  "유익한 정보2",
  "유익한 정보3",
  "기이이인 정보",
  "유익한 정보1",
  "유익한 정보2",
  "유익한 정보3ㅁ옿ㅁㄴ온몬ㅁ온너ㅗㅎㅇㄴㅁㄹ욪뎌ㅓ점ㄴㅇㅎㅂㅈ",
  "기이이인 정보",
  "유익한 정보1",
  "유익한 정보2",
  "유익한 정보3",
  "기이이인 정보",
];
const date = [
  "01/02",
  "01/02",
  "01/02",
  "01/02",
  "01/02",
  "01/02",
  "01/02",
  "01/02",
  "01/02",
  "01/02",
  "01/02",
  "01/02",
  "01/02",
  "01/02",
  "01/02",
  "01/02",
];
const name = [
  "익명",
  "익명",
  "익명",
  "익명",
  "익명",
  "익명",
  "익명",
  "익명",
  "익명",
  "익명",
  "익명",
  "익명",
  "익명",
  "익명",
  "익명",
  "익명",
];
const picture = [
  "assets/images/test.jpg",
  null,
  "assets/icons/icn_m_search_gray800.png",
  null,
  "assets/images/test.jpg",
  null,
  "assets/icons/icn_m_search_gray800.png",
  null,
  "assets/images/test.jpg",
  null,
  "assets/icons/icn_m_search_gray800.png",
  null,
  "assets/images/test.jpg",
  null,
  "assets/icons/icn_m_search_gray800.png",
  null,
];
const comment = [
  "4",
  "2",
  "1",
  "2",
  "4",
  "2",
  "1",
  "2",
  "4",
  "2",
  "1",
  "2",
  "4",
  "2",
  "1",
  "2",
];
const good = [
  "3",
  "2",
  "1",
  "4",
  "3",
  "2",
  "1",
  "4",
  "3",
  "2",
  "1",
  "4",
  "3",
  "2",
  "1",
  "4",
];
const image_index = [
  "1",
  "0",
  "1",
  "0",
  "1",
  "0",
  "1",
  "0",
  "1",
  "0",
  "1",
  "0",
  "1",
  "0",
  "1",
  "0",
];

class storeDB extends StatelessWidget {
  const storeDB({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: title.length,
      itemBuilder: (BuildContext context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => DetailScreen())));
          },
          child: Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title[index],
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          text[index],
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 142, 141, 141)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(children: [
                              Text(
                                date[index],
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: Color.fromARGB(255, 172, 171, 171)),
                              ),
                              const Text(
                                ' | ',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color.fromARGB(255, 209, 209, 209)),
                              ),
                              Text(
                                name[index],
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: Color.fromARGB(255, 172, 171, 171)),
                              ),
                            ]),
                            Row(
                              children: [
                                if (picture[index] != null)
                                  const ImageIcon(
                                      AssetImage(
                                          "assets/icons/icn_s_image_gray500.png"),
                                      size: 12),
                                if (picture[index] != null)
                                  const Text(
                                    "  ",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                if (picture[index] != null)
                                  Text(
                                    image_index[index],
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                const Text(
                                  "  ",
                                  style: TextStyle(fontSize: 12),
                                ),
                                const ImageIcon(
                                    color: Color.fromARGB(255, 209, 31, 19),
                                    AssetImage(
                                      "assets/icons/icn_s_posvote_red.png",
                                    ),
                                    size: 12),
                                const Text(
                                  " ",
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  comment[index],
                                  style: const TextStyle(
                                      fontSize: 12,
                                      color: Color.fromARGB(255, 209, 31, 19)),
                                ),
                                const Text(
                                  "  ",
                                  style: TextStyle(fontSize: 12),
                                ),
                                const ImageIcon(
                                    color: Color.fromARGB(255, 12, 165, 175),
                                    AssetImage(
                                      "assets/icons/icn_s_comment_cyan.png",
                                    ),
                                    size: 12),
                                const Text(
                                  " ",
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  comment[index],
                                  style: const TextStyle(
                                      fontSize: 12,
                                      color: Color.fromARGB(255, 12, 165, 175)),
                                ),
                                const Text(
                                  "    ",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                if (picture[index] != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(picture[index]!),
                  )
                //ImageIcon(AssetImage(picture[index]!), size: 70),
              ],
            ),
            //Text(title[index]),
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

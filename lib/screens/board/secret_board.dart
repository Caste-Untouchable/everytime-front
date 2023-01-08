import 'package:clone_everytime/main.dart';
import 'package:flutter/material.dart';
import 'package:clone_everytime/screens/board/secret_board_search.dart';
import 'package:clone_everytime/screens/board/secret_board_write.dart';
import 'package:clone_everytime/screens/board/secret_board_detail.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class SecretBoard extends StatefulWidget {
  const SecretBoard({super.key});

  @override
  State<SecretBoard> createState() => _SecretBoardState();
}

class _SecretBoardState extends State<SecretBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('비밀게시판',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900)),
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
              icon: Image.asset('assets/icons/icn_m_search_gray800.png',
                  width: 25, height: 25),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const SecretBoardSearch())));
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
                        builder: ((context) => const SecretBoardWrite())));
              }
              if (item == SampleItem.itemThree) {
                // 즐겨찾기 기능 추가
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
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
      body: Stack(
        children: [
          const SecretDB(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(
                        width: 1, // the thickness
                        color: Color.fromARGB(
                            255, 194, 194, 194) // the color of the border
                        ),
                    backgroundColor: const Color.fromARGB(255, 242, 242, 242),
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
                            builder: ((context) => const SecretBoardWrite())));
                  }),
            ),
          )
        ],
      ),
    );
  }
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
  "유익한 정보3ㅁ옿ㅁㄴ온몬ㅁ온너ㅗㅎㅇㄴㅁㄹ욪뎌ㅓ점ㄴㅇㅎㅂㅈ유익한 정보3ㅁ옿ㅁㄴ온몬ㅁ온너ㅗㅎㅇㄴㅁㄹ욪뎌ㅓ점ㄴㅇㅎㅂㅈ유익한 정보3ㅁ옿ㅁㄴ온몬ㅁ온너ㅗㅎㅇㄴㅁㄹ욪뎌ㅓ점ㄴㅇㅎㅂㅈ유익한 정보3ㅁ옿ㅁㄴ온몬ㅁ온너ㅗㅎㅇㄴㅁㄹ욪뎌ㅓ점ㄴㅇㅎㅂㅈ유익한 정보3ㅁ옿ㅁㄴ온몬ㅁ온너ㅗㅎㅇㄴㅁㄹ욪뎌ㅓ점ㄴㅇㅎㅂㅈ유익한 정보3ㅁ옿ㅁㄴ온몬ㅁ온너ㅗㅎㅇㄴㅁㄹ욪뎌ㅓ점ㄴㅇㅎㅂㅈ",
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

class SecretDB extends StatelessWidget {
  const SecretDB({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: title.length,
      itemBuilder: (BuildContext context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => const DetailScreen())));
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image.asset(
                            'assets/icons/anonymous_icon.png',
                            width: 30,
                            height: 30,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          name[index],
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: Text(
                        date[index],
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: RichText(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                    strutStyle: const StrutStyle(fontSize: 16.0),
                    text: TextSpan(
                        text: text[index],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                        )),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
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

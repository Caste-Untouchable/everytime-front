import 'package:flutter/material.dart';

import 'package:clone_everytime/models/article.dart';
import 'package:clone_everytime/screens/board/board_detail.dart';
import 'package:clone_everytime/screens/board/politics_board_search.dart';
import 'package:clone_everytime/screens/board/politics_board_write.dart';
import 'package:clone_everytime/utils/database/every_time_api.dart';
import 'package:clone_everytime/utils/date_util.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class PoliticsBoard extends StatefulWidget {
  const PoliticsBoard({super.key, required this.boardTitle, required this.boardTypeId, required this.jwt});

  final String boardTitle;
  final int boardTypeId;
  final String jwt;

  @override
  State<PoliticsBoard> createState() => _PoliticsBoardState();
}

class _PoliticsBoardState extends State<PoliticsBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
          Text(widget.boardTitle, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w900)),
          const SizedBox(
            height: 3,
          ),
          const Text('동의대', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w100, color: Color.fromARGB(255, 142, 141, 141)))
        ]),
        actions: [
          IconButton(
              icon: Image.asset('assets/icons/icn_m_search_gray800.png', width: 25, height: 25),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => const PoliticsBoardSearch())));
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
                Navigator.push(context, MaterialPageRoute(builder: ((context) => const PoliticsBoardWrite())));
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
          PoliticsDB(boardTypePK: widget.boardTypeId, jwt: widget.jwt),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(
                        width: 1, // the thickness
                        color: Color.fromARGB(255, 194, 194, 194) // the color of the border
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
                      Image.asset('assets/icons/icn_m_edit_red.png', width: 25, height: 25),
                      const Text(
                        '  글 쓰기',
                        style: TextStyle(fontSize: 13.5, color: Color.fromARGB(255, 62, 62, 62), fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: ((context) => const PoliticsBoardWrite())));
                  }),
            ),
          )
        ],
      ),
    );
  }
}

class PoliticsDB extends StatelessWidget {
  PoliticsDB({super.key, required this.boardTypePK, required this.jwt});

  int boardTypePK;
  String jwt;

  Future<List<Article>> getArticle() async {
    List<Article> articleList = await EveryTimeApi.getBoardArticle(boardTypePK, jwt);

    return articleList;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getArticle(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return ListView.separated(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: ((context) => const DetailScreen())));
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
                                  snapshot.data[index].boardTitle!,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 16, color: Colors.black),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  snapshot.data[index].content!,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 12, color: Color.fromARGB(255, 142, 141, 141)),
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
                                        DateUtil.dateToString(snapshot.data[index].createdAT!),
                                        style: const TextStyle(fontSize: 12, color: Color.fromARGB(255, 172, 171, 171)),
                                      ),
                                      const Text(
                                        ' | ',
                                        style: TextStyle(fontSize: 12, color: Color.fromARGB(255, 209, 209, 209)),
                                      ),
                                      Text(
                                        snapshot.data[index].nickname!,
                                        style: const TextStyle(fontSize: 12, color: Color.fromARGB(255, 172, 171, 171)),
                                      ),
                                    ]),
                                    Row(
                                      children: [
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
                                          snapshot.data[index].recommendCount!.toString(),
                                          style: const TextStyle(fontSize: 12, color: Color.fromARGB(255, 209, 31, 19)),
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
                                        const Text(
                                          '7',
                                          style: TextStyle(fontSize: 12, color: Color.fromARGB(255, 12, 165, 175)),
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
                      ],
                    ),
                    //Text(title[index]),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                  child: Divider(color: Color.fromARGB(255, 194, 194, 194), thickness: 1),
                );
              },
            );
          } else {
            return const Center(child: Text("게시글이 없습니다."));
          }
        });
  }
}

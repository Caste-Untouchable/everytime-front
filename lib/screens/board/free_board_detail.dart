import 'package:clone_everytime/main.dart';
import 'package:clone_everytime/screens/board/write_note.dart';
import 'package:flutter/material.dart';
import 'package:clone_everytime/screens/board/free_board.dart';

enum More { moreOne, moreTwo, moreThree, moreFour }

bool isRecomment = false;

const alarm = [
  "assets/icons/icn_m_notification_off_gray400.png",
  "assets/icons/icn_m_notification_on_red.png",
];

const anonym = [
  "assets/icons/icn_e_anonym_off.png",
  "assets/icons/icn_e_anonym_on.png",
];

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isAnonym = false;
  bool isAlarm = false;
  @override
  Widget build(BuildContext context) {
    void checkPosvote() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              // title: Column(
              //   children: <Widget>[
              //     new Text("이 글을 공감하시겠습니까?"),
              //   ],
              // ),
              // //
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "이 글을 공감하시겠습니까?",
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    elevation: 0,
                  ),
                  child: const Text(
                    "취소",
                    style: TextStyle(color: Color.fromARGB(255, 206, 67, 67)),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    elevation: 0,
                  ),
                  child: const Text(
                    "확인",
                    style: TextStyle(color: Color.fromARGB(255, 206, 67, 67)),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          });
    }

    void checkReport() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("신고 사유 선택"),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                        width: double.infinity,
                        height: 30,
                        child: const Text(
                          "낚시/놀람/도배",
                          style: TextStyle(fontSize: 18),
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                        width: double.infinity,
                        height: 30,
                        child: const Text(
                          "욕설/비하",
                          style: TextStyle(fontSize: 18),
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                        width: double.infinity,
                        height: 30,
                        child: const Text(
                          "게시판 성격에 부적절함",
                          style: TextStyle(fontSize: 18),
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                        width: double.infinity,
                        height: 30,
                        child: const Text(
                          "상업적 광고 및 판매",
                          style: TextStyle(fontSize: 18),
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                        width: double.infinity,
                        height: 30,
                        child: const Text(
                          "음란물/불건전한 만남 및 대화",
                          style: TextStyle(fontSize: 18),
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                        width: double.infinity,
                        height: 30,
                        child: const Text(
                          "정담/정치인 비하 및 선거운동",
                          style: TextStyle(fontSize: 18),
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                        width: double.infinity,
                        height: 30,
                        child: const Text(
                          "유출/사칭/사기",
                          style: TextStyle(fontSize: 18),
                        )),
                  ),
                ],
              ),
            );
          });
    }

    void checkScrap() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절

              // //Dialog Main Title
              // title: Column(
              //   children: <Widget>[
              //     new Text("이 글을 공감하시겠습니까?"),
              //   ],
              // ),
              // //
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "이 글을 스크랩하시겠습니까?",
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    elevation: 0,
                  ),
                  child: const Text(
                    "취소",
                    style: TextStyle(color: Color.fromARGB(255, 206, 67, 67)),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    elevation: 0,
                  ),
                  child: const Text(
                    "확인",
                    style: TextStyle(color: Color.fromARGB(255, 206, 67, 67)),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          });
    }

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
              Text('자유게시판',
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
          isAlarm
              ? IconButton(
                  constraints: const BoxConstraints(),
                  iconSize: 50,
                  icon: Image.asset(alarm[0], width: 25, height: 25),
                  onPressed: () {
                    setState(() {
                      isAlarm = !isAlarm;
                    });
                  })
              : IconButton(
                  constraints: const BoxConstraints(),
                  iconSize: 50,
                  icon: Image.asset(alarm[1], width: 25, height: 25),
                  onPressed: () {
                    setState(() {
                      isAlarm = !isAlarm;
                    });
                  }),
          PopupMenuButton(
            child: const ImageIcon(
              AssetImage(
                'assets/icons/icn_m_more_gray800.png',
              ),
              size: 20,
            ),
            onSelected: (More more) async {
              if (more == More.moreOne) {
                //새로 고침 기능 추가
              }
              if (more == More.moreTwo) {
                //쪽지 보내기

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const WriteNote())));
              }
              if (more == More.moreThree) {
                checkReport();
              }
              if (more == More.moreFour) {
                // URL 공유 추가
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<More>>[
              const PopupMenuItem<More>(
                value: More.moreOne,
                child: Text("새로고침          "),
              ),
              const PopupMenuItem<More>(
                value: More.moreTwo,
                child: Text("쪽지 보내기"),
              ),
              const PopupMenuItem<More>(
                  value: More.moreThree,
                  //즐겨찾기 추가 삭제 기능 추가해야함
                  child: Text("신고")),
              const PopupMenuItem<More>(
                  value: More.moreFour,
                  //즐겨찾기 추가 삭제 기능 추가해야함
                  child: Text("URL 공유")),
            ],
          ),
          const SizedBox(
            width: 10,
            height: 10,
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            'assets/icons/anonymous_icon.png',
                            width: 40,
                            height: 40,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "익명",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "01/04 19:24",
                              style:
                                  TextStyle(fontSize: 13, color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      '제목임',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "내용임",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset('assets/images/test.jpg'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        ImageIcon(
                            color: Color.fromARGB(255, 209, 31, 19),
                            AssetImage(
                              "assets/icons/icn_s_posvote_red.png",
                            ),
                            size: 12),
                        Text(
                          " ",
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          "0",
                          style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 209, 31, 19)),
                        ),
                        Text(
                          "  ",
                          style: TextStyle(fontSize: 12),
                        ),
                        ImageIcon(
                            color: Color.fromARGB(255, 12, 165, 175),
                            AssetImage(
                              "assets/icons/icn_s_comment_cyan.png",
                            ),
                            size: 12),
                        Text(
                          " ",
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          "12",
                          style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 12, 165, 175)),
                        ),
                        Text(
                          "  ",
                          style: TextStyle(fontSize: 12),
                        ),
                        ImageIcon(
                            color: Color.fromARGB(255, 230, 185, 30),
                            AssetImage(
                              "assets/icons/icn_s_star_yellow.png",
                            ),
                            size: 12),
                        Text(
                          " ",
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          "0",
                          style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 230, 185, 30)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 242, 242, 242),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                    'assets/icons/icn_s_posvote_red.png',
                                    color:
                                        const Color.fromARGB(255, 62, 62, 62),
                                    width: 12,
                                    height: 12),
                                const Text(
                                  ' 공감',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromARGB(255, 62, 62, 62),
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            onPressed: () {
                              checkPosvote();
                            }),
                        const SizedBox(width: 5),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 242, 242, 242),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                    'assets/icons/icn_s_star_yellow.png',
                                    color:
                                        const Color.fromARGB(255, 62, 62, 62),
                                    width: 12,
                                    height: 12),
                                const Text(
                                  ' 스크랩',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromARGB(255, 62, 62, 62),
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            onPressed: () {
                              checkScrap();
                            }),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Comment(),
                    const SizedBox(
                      height: 80,
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomSheet: BottomAppBar(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
          child: Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 240, 240, 240),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                isAnonym
                    ? Transform.scale(
                        scale: 1.0,
                        child: IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            iconSize: 50,
                            icon: Image.asset(anonym[0]),
                            onPressed: () {
                              setState(() {
                                isAnonym = !isAnonym;
                              });
                            }),
                      )
                    : Transform.scale(
                        scale: 1.0,
                        child: IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            iconSize: 50,
                            icon: Image.asset(anonym[1]),
                            onPressed: () {
                              setState(() {
                                isAnonym = !isAnonym;
                              });
                            }),
                      ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    style: const TextStyle(fontSize: 17.0),
                    cursorColor: const Color.fromARGB(255, 223, 70, 59),
                    cursorHeight: 22.5,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: '댓글을 입력하세요.',
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      suffixIcon: Transform.scale(
                        scale: 0.7,
                        child: IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/icons/icn_m_send_red.png',
                            height: 70,
                          ),
                        ),
                        //Image.asset(
                        //  'assets/icons/icn_m_send_red.png',
                        //  height: 50,
                        //),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

const List<Widget> icons = <Widget>[
  Icon(Icons.sunny),
  Icon(Icons.cloud),
  Icon(Icons.ac_unit),
];

const username = ["익명1", "익명2", "익명2", "익명1", "익명2", "익명2"];

const checkAnonym = [
  true,
  true,
  true,
  true,
  true,
  true,
];

const commentText = [
  "댓글 입니다.",
  "댓글 입니다22.",
  "대댓글입니다.",
  "댓글 입니다.",
  "댓글 입니다22.",
  "대댓글입니다.",
];

const CommentPosvote = ['0', '0', '1', '0', '2', '0'];

List<bool> reComment = [
  false,
  false,
  true,
  false,
  false,
  true,
];

class Comment extends StatefulWidget {
  const Comment({super.key});

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  @override
  Widget build(BuildContext context) {
    void commentPosvote() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              // title: Column(
              //   children: <Widget>[
              //     new Text("이 글을 공감하시겠습니까?"),
              //   ],
              // ),
              // //
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "이 댓글에 공감하시겠습니까?",
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    elevation: 0,
                  ),
                  child: const Text(
                    "취소",
                    style: TextStyle(color: Color.fromARGB(255, 206, 67, 67)),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    elevation: 0,
                  ),
                  child: const Text(
                    "확인",
                    style: TextStyle(color: Color.fromARGB(255, 206, 67, 67)),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          });
    }

    void checkReport() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("신고 사유 선택"),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                        width: double.infinity,
                        height: 30,
                        child: const Text(
                          "낚시/놀람/도배",
                          style: TextStyle(fontSize: 18),
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                        width: double.infinity,
                        height: 30,
                        child: const Text(
                          "욕설/비하",
                          style: TextStyle(fontSize: 18),
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                        width: double.infinity,
                        height: 30,
                        child: const Text(
                          "게시판 성격에 부적절함",
                          style: TextStyle(fontSize: 18),
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                        width: double.infinity,
                        height: 30,
                        child: const Text(
                          "상업적 광고 및 판매",
                          style: TextStyle(fontSize: 18),
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                        width: double.infinity,
                        height: 30,
                        child: const Text(
                          "음란물/불건전한 만남 및 대화",
                          style: TextStyle(fontSize: 18),
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                        width: double.infinity,
                        height: 30,
                        child: const Text(
                          "정담/정치인 비하 및 선거운동",
                          style: TextStyle(fontSize: 18),
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                        width: double.infinity,
                        height: 30,
                        child: const Text(
                          "유출/사칭/사기",
                          style: TextStyle(fontSize: 18),
                        )),
                  ),
                ],
              ),
            );
          });
    }

    void commentMore() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                      width: double.infinity,
                      height: 30,
                      child: const Text(
                        '대댓글 알림',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const WriteNote())));
                    },
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                        width: double.infinity,
                        height: 30,
                        child: const Text(
                          "쪽지 보내기",
                          style: TextStyle(fontSize: 18),
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      checkReport();
                    },
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                        width: double.infinity,
                        height: 30,
                        child: const Text(
                          "신고",
                          style: TextStyle(fontSize: 18),
                        )),
                  ),
                ],
              ),
            );
          });
    }

    void checkRecomment() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              // title: Column(
              //   children: <Widget>[
              //     new Text("이 글을 공감하시겠습니까?"),
              //   ],
              // ),
              // //
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "대댓글을 작성하시겠습니까?",
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    elevation: 0,
                  ),
                  child: const Text(
                    "취소",
                    style: TextStyle(color: Color.fromARGB(255, 206, 67, 67)),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    elevation: 0,
                  ),
                  child: const Text(
                    "확인",
                    style: TextStyle(color: Color.fromARGB(255, 206, 67, 67)),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      isRecomment = !isRecomment;
                    });
                  },
                ),
              ],
            );
          });
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: username.length,
      itemBuilder: (BuildContext context, index) {
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            children: [
              Column(
                children: [
                  if (reComment[index] == true)
                    const Icon(
                      Icons.subdirectory_arrow_right_rounded,
                      color: Color.fromARGB(255, 228, 228, 228),
                    ),
                  if (reComment[index] == true)
                    const SizedBox(
                      height: 50,
                    )
                ],
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: reComment[index]
                        ? const Color.fromARGB(255, 240, 240, 240)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(6, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (reComment[index] == false)
                          Container(
                            height: 1.0,
                            color: const Color.fromARGB(255, 212, 210, 210),
                          ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                if (checkAnonym[index] == true)
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
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
                                  username[index],
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 236, 236, 236),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    if (reComment[index] == false)
                                      IconButton(
                                        constraints: const BoxConstraints(),
                                        onPressed: () {
                                          checkRecomment();
                                        },
                                        icon: Image.asset(
                                          'assets/icons/icn_s_comment_cyan.png',
                                          color: const Color.fromARGB(
                                              255, 185, 185, 185),
                                          width: 15,
                                          height: 15,
                                        ),
                                      ),
                                    if (reComment[index] == false)
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 0),
                                        child: Container(
                                          height: 12.0,
                                          width: 1.0,
                                          color: const Color.fromARGB(
                                              255, 185, 185, 185),
                                        ),
                                      ),
                                    IconButton(
                                      constraints: const BoxConstraints(),
                                      onPressed: () {
                                        commentPosvote();
                                      },
                                      icon: Image.asset(
                                        'assets/icons/icn_s_posvote_red.png',
                                        color: const Color.fromARGB(
                                            255, 185, 185, 185),
                                        width: 15,
                                        height: 15,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Container(
                                        height: 12.0,
                                        width: 1.0,
                                        color: const Color.fromARGB(
                                            255, 185, 185, 185),
                                      ),
                                    ),
                                    IconButton(
                                      constraints: const BoxConstraints(),
                                      onPressed: () {
                                        commentMore();
                                      },
                                      icon: Image.asset(
                                        'assets/icons/icn_m_more_gray800.png',
                                        color: const Color.fromARGB(
                                            255, 185, 185, 185),
                                        width: 15,
                                        height: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          commentText[index],
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(date[index],
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Color.fromARGB(255, 189, 188, 188),
                                )),
                            const Text(" 18:24",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color.fromARGB(255, 189, 188, 188),
                                )),
                            if (CommentPosvote[index] != '0')
                              Row(
                                children: [
                                  const SizedBox(width: 5),
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
                                    CommentPosvote[index],
                                    style: const TextStyle(
                                        fontSize: 12,
                                        color:
                                            Color.fromARGB(255, 209, 31, 19)),
                                  ),
                                ],
                              )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

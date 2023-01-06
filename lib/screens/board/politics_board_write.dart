import 'package:clone_everytime/screens/term_screen.dart';
import 'package:flutter/material.dart';

const anonym = [
  "assets/icons/icn_e_anonym_off.png",
  "assets/icons/icn_e_anonym_on.png",
];

const question = [
  "assets/icons/icn_e_question_off.png",
  "assets/icons/icn_e_question_on.png",
];

class PoliticsBoardWrite extends StatefulWidget {
  const PoliticsBoardWrite({super.key});

  @override
  State<PoliticsBoardWrite> createState() => PoliticsBoardWriteState();
}

class PoliticsBoardWriteState extends State<PoliticsBoardWrite> {
  bool isAnonym = false;
  bool isQuestion = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const Text("글 쓰기"),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.black,
            icon: const Icon(Icons.close)),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: const Color.fromARGB(255, 201, 28, 28),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                '완료',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 15),
                child: TextField(
                  cursorColor: Colors.redAccent,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    hintText: '제목',
                  ),
                )),
            const Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  minLines: 6,
                  cursorColor: Colors.redAccent,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '내용을 입력하세요.',
                  ),
                )),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: ((context) => TermScreen(term: "community"))));
                      //Navigator.push(
                      //    context,
                      //    MaterialPageRoute(
                      //        builder: ((context) => board_rules())));
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: const Color.fromARGB(255, 242, 242, 242),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      '커뮤니티 이용규칙 전체 보기 >',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 54, 54, 54)),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "에브리타임은 누구나 기분 좋게 참여할 수 있는 커뮤니티를 만들기 위해 커뮤니티 이용규칙을 제정하여 운영하고 있습니다.위반 시 게시물이 삭제되고 서비스 이용이 일정 기간 제한될 수 있습니다.",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Text(
                    "\n아래는 이 게시판에 해당하는 핵심 내용에 대한 요약 사항이며,게시물 작성 전 커뮤니티 이용규칙 전문을 반드시 확인하시기 바랍니다.",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Text(
                    "\n※ 시사·이슈 게시판 작성 금지 게시물",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Text(
                    "- 언론·시민단체 등 관련 단체 옹호, 추천, 반대, 비하 행위\n- 특정 정당·후보에 대한 지지, 비방, 투표 독려 행위\n- 다른 이용자를 특정 정치 단체 관련자 및 특정 이념 옹호자로 몰아가는 행위\n- 다양한 의견을 배척하고 여론을 하나로 수렴하는 행위\n- 다른 이용자나 게시물에 대한 욕설, 비난, 비꼬는 행위\n- 기타 정치·사회 관련 갈등을 조장할 수 있는 행위 일체",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Text(
                    "\n※불법촬영물 유통 금지",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Text(
                    "불법촬영물등을 기재할 경우 전기통신사업법에 따라 삭제 조치 및 서비스 이용이 영구적으로 제한될 수 있으며 관련 법률에 따라 처벌받을 수 있습니다.",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Text(
                    "\n※그 밖의 규칙 위반",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Text(
                    "- 타인의 권리 침해하거나 불쾌감을 주는 행위\n- 범죄,불법 행위 등 법형을 위반하는 행위\n- 욕설,비하,차별,혐오,자살,폭력 관련 애용을 포함한 게시물 작성 행위",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomSheet: BottomAppBar(
        clipBehavior: Clip.none,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: SizedBox(
            height: 60,
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              IconButton(
                  icon: Image.asset('assets/icons/icn_m_camera_gray800.png', width: 25, height: 25),
                  onPressed: () {
                    //앨범 기능 추가
                  }),
              Row(
                children: [
                  isAnonym
                      ? IconButton(
                          iconSize: 50,
                          icon: Image.asset(anonym[0], width: 50, height: 100),
                          onPressed: () {
                            setState(() {
                              isAnonym = !isAnonym;
                            });
                          })
                      : IconButton(
                          iconSize: 50,
                          icon: Image.asset(anonym[1], width: 50, height: 100),
                          onPressed: () {
                            setState(() {
                              isAnonym = !isAnonym;
                            });
                          }),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}

import 'package:clone_everytime/screens/term_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

const anonym = [
  "assets/icons/icn_e_anonym_off.png",
  "assets/icons/icn_e_anonym_on.png",
];

const question = [
  "assets/icons/icn_e_question_off.png",
  "assets/icons/icn_e_question_on.png",
];

class StoreBoardWrite extends StatefulWidget {
  const StoreBoardWrite({super.key});

  @override
  State<StoreBoardWrite> createState() => StoreBoardWriteState();
}

class StoreBoardWriteState extends State<StoreBoardWrite> {
  bool isAnonym = false;
  bool isQuestion = false;
  int _value = 1;
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
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Radio(
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => const Color.fromARGB(255, 201, 28, 28)),
                      value: 1,
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value!;
                        });
                      }),
                ),
                const Text(
                  "팝니다",
                  style: TextStyle(fontSize: 13),
                ),
                Radio(
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => const Color.fromARGB(255, 201, 28, 28)),
                    value: 2,
                    groupValue: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value!;
                      });
                    }),
                const Text(
                  "삽니다",
                  style: TextStyle(fontSize: 13),
                ),
                Radio(
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => const Color.fromARGB(255, 201, 28, 28)),
                    value: 3,
                    groupValue: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value!;
                      });
                    }),
                const Text(
                  "나눔",
                  style: TextStyle(fontSize: 13),
                ),
                Radio(
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => const Color.fromARGB(255, 201, 28, 28)),
                    value: 4,
                    groupValue: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value!;
                      });
                    }),
                const Text(
                  "원룸",
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
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
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  TermScreen(term: "community"))));
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
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 54, 54, 54)),
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
                    "\n※ 장터게시판 이용안내",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Text(
                    "- 비상업적 목적의 일상 생활과 관련된 중고 품목 이외의 품목 판매 행위\n- 에브리타임은 이용자 간 합의한 거래에 대해 책임을 지지 않습니다. 허위 사실, 사기 등에 유의하시기 바랍니다.",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Text(
                    "\n※ 개인간 거래 불가능 품목 거래 금지",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Text(
                    "1. 주류, 담배, 마약류\n2. 안경, 콘택트렌즈, 의약품, 헌혈증\n3. 이미테이션 제품, 저작물 복사본\n4. 이미테이션 제품, 저작물 복사본",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Text(
                    "\n※ 홍보 및 판매 관련 금지 행위",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Text(
                    "- 영리 여부와 관계없이 사업체·기관·단체·개인에게 직간접적으로 영향을 줄 수 있는 게시물 작성 행위\n- 범죄,불법 행위 등 법형을 위반하는 행위\n- 위와 관련된 것으로 의심되거나 예상될 수 있는 바이럴 홍보 및 명칭·단어 언급 행위",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Text(
                    "\n※ 불법촬영물 유통 금지",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Text(
                    "- 불법촬영물등 유해정보를 게재할 경우 전기통신사업법에 따라 게시물 삭제 조치 및 회원 자격이 영구적으로 해지되며, 관련 법률에 따라 처벌받을 수 있습니다.",
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
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      icon: Image.asset('assets/icons/icn_m_camera_gray800.png',
                          width: 25, height: 25),
                      onPressed: () {
                        //앨범 기능 추가
                      }),
                  Row(
                    children: [
                      isAnonym
                          ? IconButton(
                              iconSize: 50,
                              icon: Image.asset(anonym[0],
                                  width: 50, height: 100),
                              onPressed: () {
                                setState(() {
                                  isAnonym = !isAnonym;
                                });
                              })
                          : IconButton(
                              iconSize: 50,
                              icon: Image.asset(anonym[1],
                                  width: 50, height: 100),
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

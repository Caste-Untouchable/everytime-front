import 'package:flutter/material.dart';

import 'package:clone_everytime/screens/my_page/screens/certification_screen.dart';
import 'package:clone_everytime/screens/my_page/widget/my_page_widget.dart';
import 'package:clone_everytime/widgets/everytime_card.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("내 정보"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            OutlinedCard(
                child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.15,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      'assets/icons/anonymous_icon.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("jins4218"),
                            SizedBox(height: 2.0),
                            Text(
                              "진희륜 / qwertycv",
                              style: TextStyle(color: Colors.grey, fontSize: 12.0),
                            ),
                            SizedBox(height: 2.0),
                            Text(
                              "동의대 18학번",
                              style: TextStyle(color: Colors.grey, fontSize: 12.0),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey[100],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(children: [
                              SizedBox(width: 30, child: Image.asset("assets/icons/icn_m_qrcode_gray800.png")),
                              const Text("QR 인증", style: TextStyle(fontSize: 12.0)),
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
            const SizedBox(height: 10.0),
            MyPageCard(title: "계정", menus: [
              [
                "학교 인증",
                () {
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => const CertificationScreeen())));
                },
                ""
              ],
              ["비밀번호 변경", () {}, ""],
              ["이메일 변경", () {}, ""],
            ]),
            const SizedBox(height: 10.0),
            MyPageCard(title: "커뮤니티", menus: [
              ["닉네임 설정", () {}, ""],
              ["프로필 이미지 변경", () {}, ""],
              ["이용 제한 내역", () {}, ""],
              ["쪽지 설정", () {}, ""],
              ["커뮤니티 이용규칙", () {}, ""],
            ]),
            const SizedBox(height: 10.0),
            MyPageCard(title: "앱 설정", menus: [
              ["다크 모드", () {}, "시스템 기본값"],
              ["알림 설정", () {}, ""],
              ["암호/지문 잠금", () {}, ""],
            ]),
            const SizedBox(height: 10.0),
            MyPageCard(title: "이용안내", menus: [
              ["앱 버전", () {}, "6.3.8"],
              ["문의하기", () {}, ""],
              ["공지사항", () {}, ""],
              ["서비스 이용 약관", () {}, ""],
              ["개인정보 처리 방침", () {}, ""],
              ["청소년 보호정책", () {}, ""],
              ["오픈소스 라이선스", () {}, ""],
            ]),
            const SizedBox(height: 10.0),
            MyPageCard(title: "기타", menus: [
              ["정보 동의 설정", () {}, ""],
              ["회원 탈퇴", () {}, ""],
              ["로그아웃", () {}, ""],
            ]),
          ]),
        ),
      ),
    );
  }
}

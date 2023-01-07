import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

import 'package:clone_everytime/providers/token_provider.dart';
import 'package:clone_everytime/screens/login/login_screen.dart';
import 'package:clone_everytime/screens/my_page/screens/certification_screen.dart';
import 'package:clone_everytime/screens/my_page/screens/email_change_screen.dart';
import 'package:clone_everytime/screens/my_page/screens/nick_change_screen.dart';
import 'package:clone_everytime/screens/my_page/screens/noti_setting_screen.dart';
import 'package:clone_everytime/screens/my_page/screens/password_chage_screen.dart';
import 'package:clone_everytime/screens/my_page/screens/restrict_screen.dart';
import 'package:clone_everytime/screens/my_page/widget/my_page_widget.dart';
import 'package:clone_everytime/widgets/everytime_card.dart';

class MyPageScreen extends StatelessWidget {
  late TokenProvider _tokenProvider;

  MyPageScreen({super.key});

  changeProfileImg(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            content: Builder(builder: (context) {
              return SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: InkWell(
                        onTap: () {},
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                          child: Text("프로필 이미지 변경"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: InkWell(
                        onTap: () {},
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                          child: Text("프로필 이미지 삭제"),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    _tokenProvider = Provider.of<TokenProvider>(context);

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
                          children: [
                            Text(_tokenProvider.user.userID!),
                            const SizedBox(height: 2.0),
                            Text(
                              "${_tokenProvider.user.name} / ${_tokenProvider.user.nickname}",
                              style: const TextStyle(color: Colors.grey, fontSize: 12.0),
                            ),
                            const SizedBox(height: 2.0),
                            Text(
                              "${_tokenProvider.user.schoolName!.substring(0, _tokenProvider.user.schoolName!.length - 2)} ${_tokenProvider.user.registeredYear.toString().substring(2, 4)}학번",
                              style: const TextStyle(color: Colors.grey, fontSize: 12.0),
                            ),
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: MediaQuery.of(context).size.width * 0.15,
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
              [
                "비밀번호 변경",
                () {
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => PasswordChangeScreen())));
                },
                ""
              ],
              [
                "이메일 변경",
                () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => EmailChangeScreen(
                                email: _tokenProvider.user.email!,
                              ))));
                },
                ""
              ],
            ]),
            const SizedBox(height: 10.0),
            MyPageCard(title: "커뮤니티", menus: [
              [
                "닉네임 설정",
                () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => NickChangeScreen(
                                nick: _tokenProvider.user.nickname!,
                              ))));
                },
                ""
              ],
              [
                "프로필 이미지 변경",
                () {
                  changeProfileImg(context);
                },
                ""
              ],
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
              [
                "로그아웃",
                () {
                  const storage = FlutterSecureStorage();

                  storage.delete(key: 'id');
                  storage.delete(key: 'pw');

                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: ((context) => const LoginScreen())), (route) => false);
                },
                ""
              ],
            ]),
          ]),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:clone_everytime/const.dart';
import 'package:clone_everytime/screens/login/register_screen.dart';
import 'package:clone_everytime/screens/login/widgets/login_widget.dart';

class AgreementScreen extends StatefulWidget {
  const AgreementScreen({super.key});

  @override
  State<AgreementScreen> createState() => _AgreementScreenState();
}

class _AgreementScreenState extends State<AgreementScreen> {
  bool isAllAgree = false;
  bool isAgeAgree = false;

  List<bool> isAgreeList = [false, false, false, false, false];
  var agreeList = [
    ['serviceagreement', "서비스이용약관 동의 (필수)", false],
    ['privacy_register', "개인정보 수집 및 이용 동의 (필수)", false],
    ['community', "커뮤니티이용규칙 확인 (필수)", false],
    ['advertise', "광고성 정보 수신 동의 (선택)", false],
    ['identity', "본인 명의를 이용하여 가입을 진행하겠습니다.", true],
    ['age14', "만 14세 이상입니다.", true]
  ];

  Future<String> loadHtml(String term) async {
    String termHtml = await rootBundle.loadString('assets/terms/$term.html');

    return termHtml;
  }

  @override
  Widget build(BuildContext context) {
    void agreeAll() {
      if (isAgreeList.contains(false)) {
        for (int i = 0; i < 4; i++) {
          isAgreeList[i] = true;
        }
        setState(() {
          isAllAgree = true;
          return;
        });
      }
      isAllAgree ? false : true;
    }

    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close))],
        title: const Text("회원가입"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "약관 동의",
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20.0),
              GestureDetector(
                onTap: () => agreeAll(),
                child: Row(
                  children: [
                    SizedBox(
                      width: 15.0,
                      height: 15.0,
                      child: isAllAgree
                          ? Image.asset(
                              'assets/icons/ic_checkbox_on_yellow_9dp.png',
                              color: EveryTimeColor.red,
                            )
                          : Image.asset('assets/icons/ic_checkbox_off_black166_9dp.png'),
                    ),
                    const SizedBox(width: 10.0),
                    const Text("아래 약관에 모두 동의합니다.", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              for (int i = 0; i < isAgreeList.length; i++)
                AgreeCheck(
                  title: agreeList[i][1].toString(),
                  htmlName: agreeList[i][0].toString(),
                  isBold: agreeList[i][2] == true,
                  isAgree: isAgreeList[i],
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
              AgreeCheck(
                title: agreeList[5][1].toString(),
                htmlName: agreeList[5][0].toString(),
                isBold: agreeList[5][2] == true,
                isAgree: isAgeAgree,
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              const SizedBox(height: 10.0),
              LoginScreenButton(
                color: EveryTimeColor.red,
                child: const Text("휴대폰 인증", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => RegisterScreen())));
                },
              ),
              LoginScreenButton(
                color: Colors.grey[100]!,
                child: const Text("아이핀 인증", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => RegisterScreen())));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

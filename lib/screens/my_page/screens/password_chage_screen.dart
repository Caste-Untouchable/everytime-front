import 'package:flutter/material.dart';

import 'package:clone_everytime/const.dart';
import 'package:clone_everytime/screens/my_page/widget/my_page_widget.dart';
import 'package:clone_everytime/widgets/everytime_widgets.dart';

class PasswordChangeScreen extends StatefulWidget {
  const PasswordChangeScreen({super.key});

  @override
  State<PasswordChangeScreen> createState() => _PasswordChangeScreenState();
}

class _PasswordChangeScreenState extends State<PasswordChangeScreen> {
  final TextEditingController _pwTextController = TextEditingController();
  final TextEditingController _pwCheckTextController = TextEditingController();
  final TextEditingController _pwNowTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close))],
        title: const Text("비밀번호 변경"),
      ),
      body: SingleChildScrollView(
        child: FocusScope(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 4.0, 12.0, 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "새 비밀번호",
                        style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w700, fontSize: 13.0),
                      ),
                      Text(
                        "영문, 숫자, 특문이 2종류 이상 조합된 8~20자",
                        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 12.0),
                      ),
                    ],
                  ),
                ),
                PasswordTextField(pwController: _pwTextController, hint: "새 비밀번호"),
                const SizedBox(height: 5.0),
                PasswordTextField(pwController: _pwCheckTextController, pwCheckController: _pwTextController, hint: "새 비밀번호 확인"),
                const SizedBox(height: 20.0),
                EverytimeTextField(title: "현재 비밀번호", hint: "현재 비밀번호", controller: _pwNowTextController),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: RichText(
                      text: const TextSpan(
                    text: "※ 혹시 타인에게 계정을 양도하려고 하시나요?\n",
                    style: TextStyle(color: Colors.black54, fontSize: 13.0, fontWeight: FontWeight.w800, height: 1.4),
                    children: [
                      TextSpan(
                        text: "에브리타임 이용약관에서는 타인에게 계정 판매, 양도 및 대여 등을 엄격하게 금지하고 있습니다.\n",
                        style: TextStyle(color: Colors.black45, fontSize: 12.0, fontWeight: FontWeight.w400),
                        children: [
                          TextSpan(text: "모니터링 시스템에 의해 계정 양도가 적발될 경우 해당 계정은 영구 정지, 탈퇴 등의 조치가 가해지며, 계정 양도로 인한 사기, 불법 행위가 발생할 경우 관련법에 따라"),
                          TextSpan(text: " 법적 책임을 지게 될 수 있습니다.", style: TextStyle(color: EveryTimeColor.red))
                        ],
                      )
                    ],
                  )),
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: RichText(
                      text: const TextSpan(
                    text: "※ 타인에 의한 계정 사용이 의심되시나요?\n",
                    style: TextStyle(color: Colors.black54, fontSize: 13.0, fontWeight: FontWeight.w800, height: 1.4),
                    children: [
                      TextSpan(
                        text: "개인정보 보호를 위해 비밀번호를 변경하여 주시기 바랍니다. 비밀번호를 변경하면",
                        style: TextStyle(color: Colors.black45, fontSize: 12.0, fontWeight: FontWeight.w400),
                        children: [TextSpan(text: " 모든 디바이스(앱, 브라우저 등)에서 즉시 로그아웃 처리됩니다.", style: TextStyle(color: EveryTimeColor.red))],
                      ),
                    ],
                  )),
                ),
                const SizedBox(height: 20.0),
                EverytimeButton(
                    color: EveryTimeColor.red,
                    child: const Text(
                      "비밀번호 변경",
                      style: TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:clone_everytime/const.dart';
import 'package:clone_everytime/widgets/everytime_widgets.dart';

class EmailChangeScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  String email;

  EmailChangeScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    _emailController.text = email;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close))],
        title: const Text("이메일 변경"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EverytimeTextField(title: "이메일", hint: "새 이메일", controller: _emailController),
            EverytimeTextField(title: "계정 비밀번호", hint: "계정 비밀번호", controller: _pwController),
            const Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                child: Text(
                  "※ 반드시 본인의 이메일을 입력해주세요.\n※ 계정 분실 시 아이디/비밀번호 찾기. 개인정보 관련 주요 고지사항 안내 등에 사용됩니다.",
                  style: TextStyle(color: Colors.black45, fontSize: 12.0, fontWeight: FontWeight.w400, height: 1.4),
                )),
            const SizedBox(height: 20.0),
            EverytimeButton(
                color: EveryTimeColor.red,
                child: const Text(
                  "이메일 변경",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {})
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:clone_everytime/const.dart';
import 'package:clone_everytime/widgets/everytime_widgets.dart';

class NickChangeScreen extends StatelessWidget {
  final TextEditingController _nickController = TextEditingController();

  String nick;

  NickChangeScreen({super.key, required this.nick});

  @override
  Widget build(BuildContext context) {
    _nickController.text = nick;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close))],
        title: const Text("닉네임 설정"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EverytimeTextField(title: "닉네임", hint: "닉네임", controller: _nickController),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: RichText(
                  text: const TextSpan(
                text: "※ 닉네임을 설정하면",
                style: TextStyle(color: Colors.black45, fontSize: 12.0, fontWeight: FontWeight.w400, height: 1.4),
                children: [TextSpan(text: " 법적 책임을 지게 될 수 있습니다.", style: TextStyle(color: EveryTimeColor.red))],
              )),
            ),
            const SizedBox(height: 20.0),
            EverytimeButton(
                color: EveryTimeColor.red,
                child: const Text(
                  "닉네임 설정",
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

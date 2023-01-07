import 'package:clone_everytime/const.dart';
import 'package:clone_everytime/widgets/everytime_card.dart';
import 'package:flutter/material.dart';

class NotiSettingScreen extends StatefulWidget {
  const NotiSettingScreen({super.key});

  @override
  State<NotiSettingScreen> createState() => _NotiSettingScreenState();
}

class _NotiSettingScreenState extends State<NotiSettingScreen> {
  final String msg =
      "[수신 및 발신을] 끄면 모든 쪽지에 대한 수신 및 발신이 차단됩니다. 이에 따라 서비스 안내, 이벤트 참여, 책방 등 서비스 이용에 제한이 있을 수 있습니다.\n\n특정 이용자의 쪽지를 차단하고 싶다면, 쪽지 내에서 [차단]혹은 [스팸 신고] 기능을 이용해주세요.\n\n푸시 알림을 차단하고 싶다면, [알림 설정] 기능을 이용해주세요.";
  bool isAllow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close))],
        title: const Text("쪽지 설정"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TitleOutlinedCard(
              title: "수신 및 발신",
              button: Switch(
                value: isAllow,
                activeColor: EveryTimeColor.red,
                onChanged: (bool value) {
                  setState(() {
                    isAllow = value;
                  });
                },
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  msg,
                  style: const TextStyle(color: Colors.grey, fontSize: 12.0, fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

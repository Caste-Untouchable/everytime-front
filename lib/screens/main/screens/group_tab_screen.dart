import 'package:flutter/material.dart';

import 'package:clone_everytime/const.dart';
import 'package:clone_everytime/widgets/everytime_card.dart';

class GroupTabScreen extends StatelessWidget {
  const GroupTabScreen({super.key});

  Widget buildNoticeBoard() {
    return TitleOutlinedCard(
      title: "전체 소식",
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Row(
              children: const [
                Text("공과대학 학생회"),
                SizedBox(width: 10.0),
                Text(
                  "💙제 9대 STAND BY ROYAL ICT공과대학 학생회💙",
                  style: TextStyle(color: Colors.grey, fontSize: 11.0, overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Row(
              children: const [
                Text("상경대학 학생회"),
                SizedBox(width: 10.0),
                Text(
                  "🙌🏻 3900 효경인이 가는 모든 길에 언제나 함께 하겠..",
                  style: TextStyle(color: Colors.grey, fontSize: 11.0, overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRequestCard() {
    return OutlinedCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "게시판 개설을 원하시나요?",
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4.0),
          const Text(
            "총학생회, 단과대 학생회, 공식 언론사 등\n개설을 원하는 교내단체는 문의해주세요.",
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 10.0),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                splashFactory: NoSplash.splashFactory,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0), side: const BorderSide(color: EveryTimeColor.red, width: 1.0)),
              ),
              child: const Text(
                "개설 요청하기",
                style: TextStyle(color: EveryTimeColor.red, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        buildNoticeBoard(),
        const SizedBox(height: 10.0),
        buildRequestCard(),
      ]),
    );
  }
}

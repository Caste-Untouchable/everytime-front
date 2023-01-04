import 'package:flutter/material.dart';

import 'package:clone_everytime/const.dart';
import 'package:clone_everytime/widgets/custom_button.dart';
import 'package:clone_everytime/widgets/everytime_card.dart';
import 'package:clone_everytime/screens/main/widgets/time_table_widget.dart';

class TimeTableAppBar extends StatelessWidget with PreferredSizeWidget {
  const TimeTableAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, // TODO : 구현 완료시 제거
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "2022년 1학기",
              style: TextStyle(color: Color(0xFFB33423), fontSize: 10.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text(
                  "기말",
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    NoSplashIconButton(
                      icon: const ImageIcon(AssetImage('assets/icons/icn_m_add_gray800.png')),
                      onPressed: () {},
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: NoSplashIconButton(
                        icon: const ImageIcon(AssetImage('assets/icons/icn_m_setting_gray800.png')),
                        onPressed: () {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: NoSplashIconButton(
                        icon: const ImageIcon(AssetImage('assets/icons/icn_m_list_gray800.png')),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TimeTableScreen extends StatelessWidget {
  const TimeTableScreen({super.key});

  Widget buildGPA() {
    return TitleOutlinedCard(
      title: "학점계산기",
      button: NoSplashIconButton(
        icon: const ImageIcon(AssetImage("assets/icons/icn_m_edit_gray800.png")),
        onPressed: () {},
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: const [
          Text("평균 학점  ", style: TextStyle(fontSize: 17.0)),
          Text(
            "3.92",
            style: TextStyle(color: EveryTimeColor.red, fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Text(
            " / 4.5",
            style: TextStyle(color: Colors.grey, fontSize: 12.0),
          ),
          SizedBox(width: 30.0),
          Text("취득 학점  ", style: TextStyle(fontSize: 17.0)),
          Text(
            "39",
            style: TextStyle(color: EveryTimeColor.red, fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Text(
            " / 150",
            style: TextStyle(color: Colors.grey, fontSize: 12.0),
          ),
        ]),
      ),
    );
  }

  Widget buildFriendTimeTable() {
    return TitleOutlinedCard(
      title: "친구 시간표",
      button: NoSplashIconButton(
        icon: const ImageIcon(AssetImage("assets/icons/icn_m_add_gray800.png")),
        onPressed: () {},
      ),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Text(
                index.toString(),
                style: const TextStyle(fontSize: 18.0),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildTimeTable(),
          const SizedBox(height: 15.0),
          buildGPA(),
          const SizedBox(height: 15.0),
          buildFriendTimeTable(),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}

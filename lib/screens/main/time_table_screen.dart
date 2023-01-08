import 'package:flutter/material.dart';

import 'package:clone_everytime/const.dart';
import 'package:clone_everytime/screens/main/grade_screen.dart';
import 'package:clone_everytime/screens/main/widgets/time_table_widget.dart';
import 'package:clone_everytime/providers/grade_provider.dart';
import 'package:clone_everytime/widgets/custom_button.dart';
import 'package:clone_everytime/widgets/everytime_card.dart';
import 'package:provider/provider.dart';

class TimeTableAppBar extends StatelessWidget with PreferredSizeWidget {
  const TimeTableAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "2022년 겨울학기",
              style: TextStyle(color: Color(0xFFB33423), fontSize: 10.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text(
                  "시간표",
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
  TimeTableScreen({super.key});

  late GradeProvider _gradeProvider;

  final List<String> _friendList = ["김남주", "윤채민", "이선학"];

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
                _friendList[index],
                style: const TextStyle(fontSize: 18.0),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildGPA(BuildContext context) {
    return TitleOutlinedCard(
      title: "학점계산기",
      button: NoSplashIconButton(
        icon: const ImageIcon(AssetImage("assets/icons/icn_m_edit_gray800.png")),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: ((context) => GradeScreen())));
        },
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
          const Text("평균 학점  ", style: TextStyle(fontSize: 17.0)),
          Text(
            "${_gradeProvider.totalGpa}",
            style: const TextStyle(color: EveryTimeColor.red, fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          const Text(
            " / 4.5",
            style: TextStyle(color: Colors.grey, fontSize: 12.0),
          ),
          const SizedBox(width: 30.0),
          const Text("취득 학점  ", style: TextStyle(fontSize: 17.0)),
          Text(
            _gradeProvider.smtCredit.toStringAsFixed(1),
            style: const TextStyle(color: EveryTimeColor.red, fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          const Text(
            " / 130",
            style: TextStyle(color: Colors.grey, fontSize: 12.0),
          ),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _gradeProvider = Provider.of<GradeProvider>(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          buildTimeTable(),
          const SizedBox(height: 15.0),
          buildGPA(context),
          const SizedBox(height: 15.0),
          buildFriendTimeTable(),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}

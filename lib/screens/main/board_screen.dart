import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:clone_everytime/providers/tab_provider.dart';
import 'package:clone_everytime/screens/main/screens/advertise_tab_screen.dart';
import 'package:clone_everytime/screens/main/screens/board_tab_screen.dart';
import 'package:clone_everytime/screens/main/screens/course_tab_screen.dart';
import 'package:clone_everytime/screens/main/screens/group_tab_screen.dart';

class BoardAppBar extends StatelessWidget with PreferredSizeWidget {
  BoardAppBar({super.key});

  List<String> tabBarTitle = ["게시판", "진로", "홍보", "단체"];

  late TabProvider _tabProvider;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    _tabProvider = Provider.of<TabProvider>(context);
    return AppBar(
      automaticallyImplyLeading: false, // TODO : 구현 완료시 제거
      title: Row(
        children: [
          for (int i = 0; i < tabBarTitle.length; i++)
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: GestureDetector(
                onTap: () {
                  _tabProvider.boardIndex = i;
                },
                child: Column(
                  children: [
                    Text(
                      tabBarTitle[i],
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600,
                        color: _tabProvider.boardIndex == i ? Colors.black : Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Container(
                      width: 20 * tabBarTitle[i].length.toDouble(),
                      height: 2.0,
                      color: _tabProvider.boardIndex == i ? Colors.black : Colors.transparent,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class BoardScreen extends StatelessWidget {
  BoardScreen({super.key});

  List<Widget> tabScreen = [
    const BoardTabScreen(),
    const CourseTabScreen(),
    const AdvertiseTabScreen(),
    const GroupTabScreen(),
  ];

  late TabProvider _tabProvider;

  @override
  Widget build(BuildContext context) {
    _tabProvider = Provider.of<TabProvider>(context);

    return tabScreen[_tabProvider.boardIndex];
  }
}

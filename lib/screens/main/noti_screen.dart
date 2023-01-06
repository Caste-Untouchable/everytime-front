import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:clone_everytime/providers/tab_provider.dart';
import 'package:clone_everytime/screens/main/screens/note_tab_screen.dart';
import 'package:clone_everytime/screens/main/screens/noti_tab_screen.dart';

class NotiAppBar extends StatelessWidget with PreferredSizeWidget {
  NotiAppBar({super.key});

  List<String> tabBarTitle = ["알림", "쪽지"];

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
                  _tabProvider.notiIndex = i;
                },
                child: Column(
                  children: [
                    Text(
                      tabBarTitle[i],
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600,
                        color: _tabProvider.notiIndex == i ? Colors.black : Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Container(
                      width: 20 * tabBarTitle[i].length.toDouble(),
                      height: 2.0,
                      color: _tabProvider.notiIndex == i ? Colors.black : Colors.transparent,
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

class NotiScreen extends StatelessWidget {
  NotiScreen({super.key});

  List<Widget> tabScreen = [
    const NotiTabScreen(),
    const NoteTabScreen(),
  ];

  late TabProvider _tabProvider;

  @override
  Widget build(BuildContext context) {
    _tabProvider = Provider.of<TabProvider>(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
      child: tabScreen[_tabProvider.notiIndex],
    );
  }
}

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:clone_everytime/providers/bottom_nav_provider.dart';
import 'package:clone_everytime/screens/main/board_screen.dart';
import 'package:clone_everytime/screens/main/home_screen.dart';
import 'package:clone_everytime/screens/main/noti_screen.dart';
import 'package:clone_everytime/screens/main/time_table_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  late BottomNavigationProvider _bottomNavigationProvider;

  PreferredSizeWidget _navigationAppBar() {
    switch (_bottomNavigationProvider.currentPage) {
      // TODO : Implement AppBar
      case 0:
        return const HomeAppBar();
      case 1:
        return const TimeTableAppBar();
      case 2:
        return BoardAppBar();
      case 3:
        return NotiAppBar();
      // case 4:
      //   return CampusPickAppBar();
    }
    return AppBar();
  }

  Widget _navigationBody() {
    switch (_bottomNavigationProvider.currentPage) {
      // TODO : Implement Screen
      case 0:
        return HomeScreen();
      case 1:
        return TimeTableScreen();
      case 2:
        return BoardScreen();
      case 3:
        return NotiScreen();
      // case 4:
      //   return CampusPickScreen();
    }
    return Container();
  }

  Widget _bottomNavigationBarWidget() {
    return BottomNavigationBar(
      items: [
        const BottomNavigationBarItem(
          label: "홈",
          icon: ImageIcon(
            AssetImage("assets/icons/icn_tab_home_active.png"),
          ),
        ),
        const BottomNavigationBarItem(
          label: "시간표",
          icon: ImageIcon(
            AssetImage("assets/icons/icn_tab_timetable_active.png"),
          ),
        ),
        const BottomNavigationBarItem(
          label: "게시판",
          icon: ImageIcon(
            AssetImage("assets/icons/icn_tab_board_active.png"),
          ),
        ),
        BottomNavigationBarItem(
          label: "알림",
          icon: Badge(
            badgeContent: const Text("3", style: TextStyle(color: Colors.white, fontSize: 9.0)),
            padding: const EdgeInsets.all(4.0),
            child: const ImageIcon(
              AssetImage("assets/icons/icn_tab_notification_active.png"),
            ),
          ),
        ),
        const BottomNavigationBarItem(
          label: "캠퍼스픽",
          icon: ImageIcon(
            AssetImage("assets/icons/icn_tab_campuspick_active.png"),
          ),
        ),
      ],
      onTap: (index) {
        _bottomNavigationProvider.updateCurrentPage(index);
      },
      currentIndex: _bottomNavigationProvider.currentPage,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    _bottomNavigationProvider = Provider.of<BottomNavigationProvider>(context);

    return Scaffold(
      appBar: _navigationAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _navigationBody(),
      ),
      bottomNavigationBar: _bottomNavigationBarWidget(),
    );
  }
}

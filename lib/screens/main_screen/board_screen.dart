import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:clone_everytime/providers/tab_provider.dart';

class BoardAppBar extends StatelessWidget with PreferredSizeWidget {
  BoardAppBar({super.key});

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
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: GestureDetector(
              onTap: () {
                _tabProvider.boardIndex = 0;
              },
              child: Column(
                children: [
                  Text(
                    "게시판",
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                      color: _tabProvider.boardIndex == 0 ? Colors.black : Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Container(
                    width: 60.0,
                    height: 2.0,
                    color: _tabProvider.boardIndex == 0 ? Colors.black : Colors.transparent,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: GestureDetector(
              onTap: () {
                _tabProvider.boardIndex = 1;
              },
              child: Column(
                children: [
                  Text(
                    "진로",
                    style: TextStyle(
                      fontSize: 23.0,
                      fontWeight: FontWeight.w600,
                      color: _tabProvider.boardIndex == 1 ? Colors.black : Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Container(
                    width: 40.0,
                    height: 2.0,
                    color: _tabProvider.boardIndex == 1 ? Colors.black : Colors.transparent,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: GestureDetector(
              onTap: () {
                _tabProvider.boardIndex = 2;
              },
              child: Column(
                children: [
                  Text(
                    "홍보",
                    style: TextStyle(
                      fontSize: 23.0,
                      fontWeight: FontWeight.w600,
                      color: _tabProvider.boardIndex == 2 ? Colors.black : Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Container(
                    width: 40.0,
                    height: 2.0,
                    color: _tabProvider.boardIndex == 2 ? Colors.black : Colors.transparent,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: GestureDetector(
              onTap: () {
                _tabProvider.boardIndex = 3;
              },
              child: Column(
                children: [
                  Text(
                    "단체",
                    style: TextStyle(
                      fontSize: 23.0,
                      fontWeight: FontWeight.w600,
                      color: _tabProvider.boardIndex == 3 ? Colors.black : Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Container(
                    width: 40.0,
                    height: 2.0,
                    color: _tabProvider.boardIndex == 3 ? Colors.black : Colors.transparent,
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
  const BoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

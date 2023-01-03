import 'package:clone_everytime/widgets/time_table.dart';
import 'package:flutter/material.dart';

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
                    SizedBox(
                      child: IconButton(
                        onPressed: () {},
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        icon: const ImageIcon(AssetImage('assets/icons/icn_m_add_gray800.png')),
                        constraints: const BoxConstraints(),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: IconButton(
                        onPressed: () {},
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        icon: const ImageIcon(AssetImage('assets/icons/icn_m_setting_gray800.png')),
                        constraints: const BoxConstraints(),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: IconButton(
                        onPressed: () {},
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        icon: const ImageIcon(AssetImage('assets/icons/icn_m_list_gray800.png')),
                        constraints: const BoxConstraints(),
                        padding: EdgeInsets.zero,
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: kColumnLength / 2 * kBoxSize + kColumnLength + 4,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            buildTimeColumn(),
            for (int i = 0; i < 5; i++)
              Expanded(
                child: Row(
                  children: buildDayColumn(i),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

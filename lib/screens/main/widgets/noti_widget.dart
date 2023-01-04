import 'package:ellipsis_overflow_text/ellipsis_overflow_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:clone_everytime/const.dart';

class NotiTile extends StatelessWidget {
  NotiTile({super.key, required this.board, required this.title, required this.date, this.isRead = false});

  String board;
  String title;
  DateTime date;
  bool isRead;

  @override
  Widget build(BuildContext context) {
    String dateString;

    if (date.year == DateTime.now().year) {
      dateString = DateFormat('MM/dd hh:mm').format(date);
    } else {
      dateString = DateFormat('yy/MM/dd hh:mm').format(date);
    }

    return Ink(
      decoration: isRead ? null : const BoxDecoration(color: EveryTimeColor.accent),
      child: InkWell(
        splashColor: isRead ? null : EveryTimeColor.accentSplash,
        highlightColor: isRead ? null : EveryTimeColor.accentSplash,
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 10.0),
                child: Stack(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey[400]!, width: 1.0),
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: 40,
                          width: 40,
                          child: Image.asset("assets/icons/icn_e_notification_3.png"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        board,
                        style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4.0),
                      EllipsisOverflowText(
                        title,
                        maxLines: 2,
                        showEllipsisOnBreakLineOverflow: true,
                      ),
                      const SizedBox(height: 2.0),
                      Text(
                        dateString,
                        style: const TextStyle(color: Colors.grey, fontSize: 12.0),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:configurable_expansion_tile_null_safety/configurable_expansion_tile_null_safety.dart';
import 'package:ellipsis_overflow_text/ellipsis_overflow_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:clone_everytime/const.dart';
import 'package:clone_everytime/widgets/everytime_card.dart';

class PopularArticle extends StatelessWidget {
  PopularArticle({
    Key? key,
    required this.writer,
    this.profileImageUrl,
    required this.text,
    required this.board,
    required this.date,
    required this.recommend,
    required this.comment,
  }) : super(key: key);

  String board;
  int comment;
  DateTime date;
  String? profileImageUrl;
  int recommend;
  String text;
  String writer;

  @override
  Widget build(BuildContext context) {
    String dateString = DateFormat('MM/dd hh:mm').format(date);

    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              profileImageUrl == null ? const Icon(Icons.person) : Image.network(profileImageUrl!),
              const SizedBox(width: 10.0),
              Text(
                writer,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const Flexible(fit: FlexFit.tight, child: SizedBox()),
              Text(
                dateString,
                style: const TextStyle(color: Colors.grey, fontSize: 11.0),
              ),
            ],
          ),
          EllipsisOverflowText(
            text,
            maxLines: 2,
            showEllipsisOnBreakLineOverflow: true,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                board,
                style: const TextStyle(color: Colors.grey, fontSize: 10.0),
              ),
              Row(children: [
                SizedBox(
                  width: 11.0,
                  height: 11.0,
                  child: Image.asset('assets/icons/icn_s_posvote_red.png'),
                ),
                const SizedBox(width: 4.0),
                Text(
                  recommend.toString(),
                  style: const TextStyle(color: EveryTimeColor.red, fontSize: 12.0),
                ),
                const SizedBox(width: 8.0),
                SizedBox(
                  width: 11.0,
                  height: 11.0,
                  child: Image.asset('assets/icons/icn_s_comment_cyan.png'),
                ),
                const SizedBox(width: 4.0),
                Text(
                  comment.toString(),
                  style: const TextStyle(color: EveryTimeColor.cyan, fontSize: 12.0),
                ),
              ])
            ],
          )
        ],
      ),
    );
  }
}

class LatestLectureArticle extends StatelessWidget {
  LatestLectureArticle({
    super.key,
    required this.lectureName,
    required this.profName,
    required this.text,
    required this.rating,
  });

  String lectureName;
  String profName;
  int rating;
  String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              for (int i = 0; i < rating; i++)
                SizedBox(
                  width: 15,
                  height: 15,
                  child: Image.asset('assets/icons/ic_scrap_yellow_24dp.png'),
                ),
              for (int i = 0; i < 5 - rating; i++)
                SizedBox(
                  width: 15,
                  height: 15,
                  child: Image.asset('assets/icons/ic_scrap_black214_24dp.png'),
                ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            "$lectureName : $profName",
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Text(text, maxLines: 2)
        ],
      ),
    );
  }
}

class HotArticle extends StatelessWidget {
  HotArticle({
    Key? key,
    required this.title,
    required this.date,
    required this.recommend,
    required this.comment,
  }) : super(key: key);

  int comment;
  DateTime date;
  int recommend;
  String title;

  @override
  Widget build(BuildContext context) {
    String dateString = DateFormat('MM/dd hh:mm').format(date);

    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 15.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                dateString,
                style: const TextStyle(color: Colors.grey, fontSize: 10.0),
              ),
              const Flexible(fit: FlexFit.tight, child: SizedBox()),
              Row(children: [
                SizedBox(
                  width: 11.0,
                  height: 11.0,
                  child: Image.asset('assets/icons/icn_s_posvote_red.png'),
                ),
                const SizedBox(width: 4.0),
                Text(
                  recommend.toString(),
                  style: const TextStyle(color: EveryTimeColor.red, fontSize: 12.0),
                ),
                const SizedBox(width: 8.0),
                SizedBox(
                  width: 11.0,
                  height: 11.0,
                  child: Image.asset('assets/icons/icn_s_comment_cyan.png'),
                ),
                const SizedBox(width: 4.0),
                Text(
                  comment.toString(),
                  style: const TextStyle(color: EveryTimeColor.cyan, fontSize: 12.0),
                ),
              ])
            ],
          )
        ],
      ),
    );
  }
}

class BoardListButton extends StatelessWidget {
  BoardListButton({
    Key? key,
    required this.boardName,
    this.subTitle,
    required this.iconName,
    required this.onTap,
    this.isNew = false,
  }) : super(key: key);

  String boardName;
  String? subTitle;
  String iconName;
  VoidCallback onTap;
  bool isNew;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 30.0,
              height: 30.0,
              child: Image.asset("assets/icons/icn_mcr_board_$iconName.png"),
            ),
            const SizedBox(width: 15.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      boardName,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    const SizedBox(width: 5.0),
                    isNew ? SizedBox(width: 10, height: 10, child: Image.asset('assets/icons/icn_e_new.png')) : const SizedBox(),
                  ],
                ),
                subTitle != null
                    ? Column(
                        children: [
                          const SizedBox(height: 4.0),
                          Text(subTitle!, style: const TextStyle(color: Colors.grey, fontSize: 11.0)),
                        ],
                      )
                    : Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BoardExpansionTile extends StatelessWidget {
  BoardExpansionTile({super.key, required this.title, required this.boardList});

  String title;
  String boardName = "";
  List<String> boardList;

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < boardList.length; i++) {
      boardName += "${boardList[i]}, ";
    }

    return OutlinedCard(
      child: ConfigurableExpansionTile(
        header: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold)),
              const Icon(Icons.keyboard_arrow_down, color: EveryTimeColor.red)
            ],
          ),
        ),
        headerExpanded: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(title, style: const TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold)),
                  const SizedBox(width: 10.0),
                  Text(
                    boardName.substring(0, boardName.length - 2),
                    style: const TextStyle(color: Colors.grey, fontSize: 12.0, overflow: TextOverflow.ellipsis),
                  )
                ],
              ),
              const Icon(Icons.keyboard_arrow_up, color: EveryTimeColor.red)
            ],
          ),
        ),
        childrenBody: Column(children: [
          const SizedBox(height: 15.0),
          for (int i = 0; i < boardList.length; i++)
            BoardListButton(
              boardName: boardList[i],
              iconName: i % 2 == 0 ? "pin_on" : "pin_off",
              isNew: i % 2 == 0 ? true : false,
              onTap: () {},
            ),
        ]),
      ),
    );
  }
}

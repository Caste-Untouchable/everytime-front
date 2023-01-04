import 'package:ellipsis_overflow_text/ellipsis_overflow_text.dart';
import 'package:flutter/material.dart';

import 'package:clone_everytime/const.dart';
import 'package:intl/intl.dart';

class PopularArticle extends StatelessWidget {
  String writer;
  String? profileImageUrl;
  String text;
  String board;
  DateTime date;
  int recommend;
  int comment;

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
  String lectureName;
  String profName;
  String text;
  int rating;

  LatestLectureArticle({
    super.key,
    required this.lectureName,
    required this.profName,
    required this.text,
    required this.rating,
  });

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

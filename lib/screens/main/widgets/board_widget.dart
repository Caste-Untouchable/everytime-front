import 'package:configurable_expansion_tile_null_safety/configurable_expansion_tile_null_safety.dart';
import 'package:ellipsis_overflow_text/ellipsis_overflow_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:clone_everytime/const.dart';
import 'package:clone_everytime/models/board.dart';
import 'package:clone_everytime/providers/user_provider.dart';
import 'package:clone_everytime/screens/board/politics_board.dart';
import 'package:clone_everytime/widgets/everytime_card.dart';

class AdvertiseArticle extends StatelessWidget {
  AdvertiseArticle({
    Key? key,
    this.imageUrl,
    this.imagePath,
    this.title,
    required this.text,
    required this.board,
    this.recommend,
    this.comment,
    this.hasImage = false,
  }) : super(key: key);

  String? imageUrl;
  String? imagePath;
  String? title;
  String text;
  String board;
  int? recommend;
  int? comment;
  bool hasImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Row(
        children: [
          Flexible(
            flex: 7,
            child: Padding(
              padding: hasImage ? const EdgeInsets.only(right: 10.0) : const EdgeInsets.all(0),
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (title != null) ...[
                      Text(
                        title!,
                        style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
                      ),
                    ],
                    const SizedBox(height: 3.0),
                    EllipsisOverflowText(
                      text,
                      maxLines: 2,
                      showEllipsisOnBreakLineOverflow: true,
                    ),
                    const SizedBox(height: 3.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          board,
                          style: const TextStyle(color: Colors.grey, fontSize: 12.0),
                        ),
                        if (comment != null)
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
              ),
            ),
          ),
          if (imageUrl != null)
            Flexible(
              flex: 3,
              child: Image.network(imageUrl!, fit: BoxFit.cover),
            ),
          if (imagePath != null)
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              child: Image.asset(imagePath!, fit: BoxFit.fill),
            ),
        ],
      ),
    );
  }
}

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
          EllipsisOverflowText(text, maxLines: 2)
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
            style: const TextStyle(fontSize: 13.0),
          ),
          const SizedBox(height: 2.0),
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
    required this.board,
    this.subTitle,
    required this.iconName,
    this.isNew = false,
  }) : super(key: key);

  late UserProvider _tokenProvider;
  Board board;
  String? subTitle;
  String iconName;
  bool isNew;

  @override
  Widget build(BuildContext context) {
    _tokenProvider = Provider.of<UserProvider>(context);

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => PoliticsBoard(
                      boardTitle: board.boardType!,
                      boardTypeId: board.boardTypePK!,
                      jwt: _tokenProvider.jwt,
                    ))));
      },
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
                      board.boardType!,
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
  List<Board> boardList;

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < boardList.length; i++) {
      boardName += "${boardList[i].boardType}, ";
    }

    return OutlinedCard(
      child: ConfigurableExpansionTile(
        header: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              const Icon(Icons.keyboard_arrow_down, color: EveryTimeColor.red)
            ],
          ),
        ),
        headerExpanded: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(title, style: const TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold)),
              const Icon(Icons.keyboard_arrow_up, color: EveryTimeColor.red)
            ],
          ),
        ),
        childrenBody: Column(children: [
          const SizedBox(height: 15.0),
          for (int i = 0; i < boardList.length; i++)
            BoardListButton(
              board: boardList[i],
              iconName: i % 2 == 0 ? "pin_on" : "pin_off",
              isNew: i % 2 == 0 ? true : false,
            ),
        ]),
      ),
    );
  }
}

import 'package:clone_everytime/const.dart';
import 'package:clone_everytime/widgets/article_widget.dart';
import 'package:clone_everytime/widgets/custom_button.dart';
import 'package:clone_everytime/widgets/custom_card.dart';
import 'package:clone_everytime/widgets/custom_container.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBar({super.key});

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
              "에브리타임",
              style: TextStyle(color: EveryTimeColor.red, fontSize: 10.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text(
                  "동의대",
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    NoSplashIconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: NoSplashIconButton(
                        icon: const Icon(Icons.person_outline),
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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget buildNotiCard(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: CustomCard(
                title: "방학 동안 뭐하지?",
                subTitle: "인기 공모전, 대외활동 찾아보기",
                subColor: EveryTimeColor.bulb,
                icon: Image.asset("assets/icons/icn_mcb_home_dinner.png"),
                button: ActionChip(
                  label: const Text(
                    "자세히 >",
                    style: TextStyle(fontSize: 12.0),
                  ),
                  onPressed: () {},
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildQuickBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleButton(title: "학교\n홈", iconName: "icn_mcr_home_home", onTap: () {}),
        CircleButton(title: "열람실\n현황", iconName: "icn_mcr_home_library", onTap: () {}),
        CircleButton(title: "셔틀\n버스", iconName: "icn_mcr_home_bus", onTap: () {}),
        CircleButton(title: "학사\n공지", iconName: "icn_mcb_home_news", onTap: () {}),
        CircleButton(title: "학사\n일정", iconName: "icn_mcr_home_calendar", onTap: () {}),
        CircleButton(title: "도서관", iconName: "icn_mcr_home_library", onTap: () {}),
      ],
    );
  }

  Widget buildFavoriteBoard() {
    return CustomTitleContainer(
      title: "즐겨찾는 게시판",
      button: GestureDetector(
        onTap: () {},
        child: const Text(
          "더 보기 >",
          style: TextStyle(color: EveryTimeColor.red, fontSize: 15.0),
        ),
      ),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "게시판",
                    style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 15),
                  const Text(
                    "내용",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const Flexible(fit: FlexFit.tight, child: SizedBox()),
                  SizedBox(width: 13, height: 13, child: Image.asset('assets/icons/icn_e_new.png'))
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildPopularArticle() {
    return CustomTitleContainer(
        title: "실시간 인기 글",
        child: Column(
          children: [
            PopularArticle(
                writer: "익명",
                profileImageUrl: null,
                text: "본문",
                board: "새내기게시판",
                date: DateTime(2023, 1, 3, 12, 01),
                recommend: 69,
                comment: 6),
            PopularArticle(
                writer: "익명",
                profileImageUrl: null,
                text: "본문\n본문\n본문",
                board: "새내기게시판",
                date: DateTime(2023, 1, 3, 12, 01),
                recommend: 27,
                comment: 0),
          ],
        ));
  }

  Widget buildLatestLectureArticle() {
    return CustomTitleContainer(
      title: "최근 강의평",
      button: GestureDetector(
        onTap: () {},
        child: const Text(
          "더 보기 >",
          style: TextStyle(color: EveryTimeColor.red, fontSize: 15.0),
        ),
      ),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return LatestLectureArticle(lectureName: "전공탐색과생애설계", profName: "신희승", text: "설명", rating: 4);
        },
      ),
    );
  }

  Widget buildHotArticle() {
    return CustomTitleContainer(
        title: "HOT 게시글",
        button: GestureDetector(
          onTap: () {},
          child: const Text(
            "더 보기 >",
            style: TextStyle(color: EveryTimeColor.red, fontSize: 15.0),
          ),
        ),
        child: Column(
          children: [
            HotArticle(title: "제에목1", date: DateTime(2023, 1, 3, 12, 00), recommend: 11, comment: 5),
            HotArticle(title: "제에목2", date: DateTime(2023, 1, 2, 12, 00), recommend: 51, comment: 12),
            HotArticle(title: "제에목3", date: DateTime(2023, 1, 1, 12, 00), recommend: 23, comment: 4),
            HotArticle(title: "제에목4", date: DateTime(2023, 1, 4, 12, 00), recommend: 41, comment: 6),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildNotiCard(context),
          const SizedBox(height: 20),
          buildQuickBtn(),
          const SizedBox(height: 20),
          buildFavoriteBoard(),
          const SizedBox(height: 10),
          buildPopularArticle(),
          const SizedBox(height: 10),
          buildLatestLectureArticle(),
          const SizedBox(height: 10),
          buildHotArticle(),
        ],
      ),
    );
  }
}

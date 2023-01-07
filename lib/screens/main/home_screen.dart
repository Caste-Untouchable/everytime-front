import 'package:flutter/material.dart';

import 'package:clone_everytime/const.dart';
import 'package:clone_everytime/screens/main/widgets/board_widget.dart';
import 'package:clone_everytime/screens/main/widgets/home_widget.dart';
import 'package:clone_everytime/screens/my_page/my_page_screen.dart';
import 'package:clone_everytime/widgets/custom_button.dart';
import 'package:clone_everytime/widgets/everytime_card.dart';

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
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: ((context) => const MyPageScreen())));
                        },
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
              child: HomeCard(
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
    return TitleOutlinedCard(
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
    return TitleOutlinedCard(
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
    return TitleOutlinedCard(
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
    return TitleOutlinedCard(
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

  Widget buildRecruit(BuildContext context) {
    return TitleOutlinedCard(
      title: "채용 정보",
      button: GestureDetector(
        onTap: () {},
        child: const Text(
          "더 보기 >",
          style: TextStyle(color: EveryTimeColor.red, fontSize: 15.0),
        ),
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.28,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return HomeImageCard(
              title: "호텔롯데",
              date: DateTime(2023, 1, 8),
              imageUrl: "https://cf-eba.everytime.kr/homecard_230101.png",
            );
          },
        ),
      ),
    );
  }

  Widget buildWelfare(BuildContext context) {
    return TitleOutlinedCard(
      title: "대학생 복지 혜택",
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return HomeImageCard(
              title: "대학생 전용 혜택\n합리적인 교육 할인",
              subTitle: "학생복지스토어",
              imageUrl: "https://cf-eba.everytime.kr/homecard_230101.png",
            );
          },
        ),
      ),
    );
  }

  Widget buildActivities(BuildContext context) {
    return TitleOutlinedCard(
      title: "대외활동",
      button: GestureDetector(
        onTap: () {},
        child: const Text(
          "더 보기 >",
          style: TextStyle(color: EveryTimeColor.red, fontSize: 15.0),
        ),
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return HomeImageCard(
              title: "제 20회 KPR 공모전",
              subTitle: "KPR",
              imageUrl: "https://cf-eba.everytime.kr/homecard_230101.png",
            );
          },
        ),
      ),
    );
  }

  Widget buildCompetition(BuildContext context) {
    return TitleOutlinedCard(
      title: "공모전",
      button: GestureDetector(
        onTap: () {},
        child: const Text(
          "더 보기 >",
          style: TextStyle(color: EveryTimeColor.red, fontSize: 15.0),
        ),
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return HomeImageCard(
              title: "국제청년센터 본부 홍보국 디자인팀 모집합니다.",
              subTitle: "국제청년센터",
              imageUrl: "https://cf-eba.everytime.kr/homecard_230101.png",
            );
          },
        ),
      ),
    );
  }

  Widget buildMarketArticle(BuildContext context) {
    return TitleOutlinedCard(
      title: "판매 중인 책",
      button: GestureDetector(
        onTap: () {},
        child: const Text(
          "더 보기 >",
          style: TextStyle(color: EveryTimeColor.red, fontSize: 15.0),
        ),
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return HomeImageCard(
              title: "일반기계기사 필기대비",
              price: 20000,
              imageUrl: "https://cf-cii.everytime.kr/1bfe7bf4ccf45d9576f1bca717adcc0aa80de21ecce5416ef1a7cc1d6e1d5d43/1672741293471_0.jpg",
            );
          },
        ),
      ),
    );
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
          const SizedBox(height: 10),
          buildRecruit(context),
          const SizedBox(height: 10),
          buildWelfare(context),
          const SizedBox(height: 10),
          buildCompetition(context),
          const SizedBox(height: 10),
          buildActivities(context),
          const SizedBox(height: 10),
          buildMarketArticle(context),
        ],
      ),
    );
  }
}

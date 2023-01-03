import 'package:clone_everytime/const.dart';
import 'package:clone_everytime/widgets/custom_button.dart';
import 'package:clone_everytime/widgets/custom_card.dart';
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

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildNotiCard(context),
        const SizedBox(height: 20),
        buildQuickBtn(),
      ],
    );
  }
}

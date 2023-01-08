import 'package:clone_everytime/providers/bottom_nav_provider.dart';
import 'package:clone_everytime/screens/board/book_board.dart';
import 'package:clone_everytime/screens/main/screens/webview_screen.dart';
import 'package:flutter/material.dart';

import 'package:clone_everytime/const.dart';
import 'package:clone_everytime/screens/main/widgets/board_widget.dart';
import 'package:clone_everytime/screens/main/widgets/home_widget.dart';
import 'package:clone_everytime/screens/my_page/my_page_screen.dart';
import 'package:clone_everytime/widgets/custom_button.dart';
import 'package:clone_everytime/widgets/everytime_card.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
                          Navigator.push(context, MaterialPageRoute(builder: ((context) => MyPageScreen())));
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
  late BottomNavigationProvider _bottomNavigationProvider;

  HomeScreen({super.key});

  Widget buildNotiCard(BuildContext context) {
    _bottomNavigationProvider = Provider.of<BottomNavigationProvider>(context);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.2,
        child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: HomeCard(
                    title: "방학 동안 뭐하지?",
                    subTitle: "인기 공모전, 대외활동 찾아보기",
                    subColor: EveryTimeColor.bulb,
                    icon: Image.asset("assets/icons/icn_mcb_home_bulb.png"),
                    button: ActionChip(
                      backgroundColor: Colors.grey[200],
                      label: const Text(
                        "자세히 >",
                        style: TextStyle(fontSize: 12.0),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: HomeCard(
                    title: "오늘의 할 일",
                    subTitle: DateFormat('MM월 dd일 (E)', 'ko').format(DateTime.now()),
                    subColor: EveryTimeColor.todo,
                    icon: Image.asset("assets/icons/icn_mcb_home_todo.png"),
                    button: Row(
                      children: [
                        ActionChip(
                          backgroundColor: Colors.grey[200],
                          label: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text(
                                "추가 ",
                                style: TextStyle(fontSize: 12.0),
                              ),
                              Icon(Icons.add_box_outlined, color: Colors.grey, size: 20)
                            ],
                          ),
                          onPressed: () {},
                        ),
                        const SizedBox(width: 5),
                        ActionChip(
                          backgroundColor: Colors.grey[200],
                          label: const Text(
                            "자세히 >",
                            style: TextStyle(fontSize: 12.0),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Widget buildQuickBtn() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleButton(title: "학교\n홈", iconName: "icn_mcr_home_home", url: "https://www.deu.ac.kr/www"),
          CircleButton(title: "열람실\n현황", iconName: "icn_mcr_home_library", url: "https://lib.deu.ac.kr/lib/SlimaPlus.csp"),
          CircleButton(title: "셔틀\n버스", iconName: "icn_mcr_home_bus", url: "https://www.deu.ac.kr/www/content/13"),
          CircleButton(title: "학사\n공지", iconName: "icn_mcb_home_news", url: "https://www.deu.ac.kr/www/board/3"),
          CircleButton(title: "학사\n일정", iconName: "icn_mcr_home_calendar", url: "https://www.deu.ac.kr/www/academic_calendar"),
          CircleButton(title: "도서관", iconName: "icn_mcr_home_library", url: "https://lib.deu.ac.kr/lib/SlimaPlus.csp"),
        ],
      ),
    );
  }

  Widget buildFavoriteBoard() {
    return TitleOutlinedCard(
      title: "즐겨찾는 게시판",
      button: InkWell(
        onTap: () {
          _bottomNavigationProvider.updateCurrentPage(2);
        },
        child: const Text(
          "더 보기 >",
          style: TextStyle(color: EveryTimeColor.red, fontSize: 15.0),
        ),
      ),
      child: Column(children: [
        InkWell(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "자유게시판",
                  style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 15),
                const Text(
                  "여자신발",
                  style: TextStyle(color: Colors.grey),
                ),
                const Flexible(fit: FlexFit.tight, child: SizedBox()),
                SizedBox(width: 13, height: 13, child: Image.asset('assets/icons/icn_e_new.png'))
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "비밀게시판",
                  style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 15),
                const Text(
                  "술마실사람",
                  style: TextStyle(color: Colors.grey),
                ),
                const Flexible(fit: FlexFit.tight, child: SizedBox()),
                SizedBox(width: 13, height: 13, child: Image.asset('assets/icons/icn_e_new.png'))
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "졸업생게시판",
                  style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 15),
                const Text(
                  "경찰준비하는애들아",
                  style: TextStyle(color: Colors.grey),
                ),
                const Flexible(fit: FlexFit.tight, child: SizedBox()),
                SizedBox(width: 13, height: 13, child: Image.asset('assets/icons/icn_e_new.png'))
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "취업·진로",
                  style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 15),
                const Text(
                  "전과 질문",
                  style: TextStyle(color: Colors.grey),
                ),
                const Flexible(fit: FlexFit.tight, child: SizedBox()),
                SizedBox(width: 13, height: 13, child: Image.asset('assets/icons/icn_e_new.png'))
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "동아리·학회",
                  style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 15),
                const Text(
                  "태연동",
                  style: TextStyle(color: Colors.grey),
                ),
                const Flexible(fit: FlexFit.tight, child: SizedBox()),
                SizedBox(width: 13, height: 13, child: Image.asset('assets/icons/icn_e_new.png'))
              ],
            ),
          ),
        ),
      ]),
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
                text: "남친이랑 헤어질까",
                board: "비밀게시판",
                date: DateTime(2023, 1, 8, 12, 00),
                recommend: 10,
                comment: 8)
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
        child: Column(
          children: [
            LatestLectureArticle(lectureName: "기초수학", profName: "류재칠", text: "시험 성적이 전부입니다 고등학교때 수학 좀 했다 싶으면 이 강의 추천합니다", rating: 5),
            LatestLectureArticle(
                lectureName: "전공탐색과생애설계 Ⅰ - Ⅱ", profName: "임영재", text: "초청강좌의 비중이 굉장히 많았음\np과목이기에 좋은 팁 얻는다 생각하고 편안히 들음녀 되는 강의", rating: 4),
            LatestLectureArticle(lectureName: "문학과삶(슬로리딩)", profName: "김도희", text: "참여점수 10프로가 은근 크기 때문에 성적 잘 받으시려면 발표 많이 하세요", rating: 5),
            LatestLectureArticle(
                lectureName: "철학의향기와역사이야기", profName: "김명우", text: "발표 많이 하는걸 추천하고 시험은 그냥 할만해요 교수님 목소리 작아서 앞에 앉으세요", rating: 5),
          ],
        ));
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
            HotArticle(title: "남친이랑 헤어질까", date: DateTime(2023, 1, 8, 12, 00), recommend: 10, comment: 8),
            HotArticle(title: "3000 공대인들의 새로운 학교생활에 다시금 바람을 불어오겠습니다.", date: DateTime(2023, 1, 7, 14, 18), recommend: 25, comment: 7),
            HotArticle(title: "동의대 은근 호감임", date: DateTime(2023, 1, 7, 10, 47), recommend: 18, comment: 15),
            HotArticle(title: "반갑습니다. 화학환경공학부 학생회입니다😀", date: DateTime(2023, 1, 7, 9, 46), recommend: 24, comment: 1),
          ],
        ));
  }

  Widget buildRecruit(BuildContext context) {
    return TitleOutlinedCard(
      title: "채용 정보",
      button: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => WebviewScreen(url: "https://www.campuspick.com/job", title: "채용 정보", isCampus: true))));
        },
        child: const Text(
          "더 보기 >",
          style: TextStyle(color: EveryTimeColor.red, fontSize: 15.0),
        ),
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              HomeImageCard(
                title: "2023년 신입사원 채용",
                webViewTitle: "채용 정보",
                date: DateTime(2023, 1, 17),
                url: "https://www.campuspick.com/job/view?id=8851",
                imageUrl: "https://cf-cpi.campuspick.com/jobcompany/1672995434686727.png",
              ),
              HomeImageCard(
                title: "Software Engineering Intern (채용 연계형 인턴)",
                webViewTitle: "채용 정보",
                date: DateTime(2023, 5, 31),
                url: "https://www.campuspick.com/job/view?id=8852",
                imageUrl: "https://cf-cpi.campuspick.com/jobcompany/1585724491435050.png",
              ),
              HomeImageCard(
                title: "2023년 상반기 일반직 채용 (경영기획, 신용정보 보호/관리, 신용리스크컨설팅 분야)",
                webViewTitle: "채용 정보",
                date: DateTime(2023, 1, 15),
                url: "https://www.campuspick.com/job/view?id=8850",
                imageUrl: "https://cf-cpi.campuspick.com/jobcompany/1672994571552855.png",
              ),
              HomeImageCard(
                title: "신입 엔지니어 채용(전국)",
                webViewTitle: "채용 정보",
                date: DateTime(2023, 1, 13),
                url: "https://www.campuspick.com/job/view?id=8848",
                imageUrl: "https://cf-cpi.campuspick.com/jobcompany/1672992790984690.png",
              ),
              HomeImageCard(
                title: "상용차 법규 인증",
                webViewTitle: "채용 정보",
                date: DateTime(2023, 1, 15),
                url: "https://www.campuspick.com/job/view?id=8849",
                imageUrl: "https://cf-cpi.campuspick.com/jobcompany/1585721036589354.png",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildWelfare(BuildContext context) {
    return TitleOutlinedCard(
      title: "대학생 복지 혜택",
      button: GestureDetector(
        onTap: () {},
        child: const Text(
          "더 보기 >",
          style: TextStyle(color: EveryTimeColor.red, fontSize: 15.0),
        ),
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              HomeImageCard(
                title: "대학생 전용혜택\n합리적인 교육할인",
                subTitle: "학생복지스토어",
                url: "https://www.campuspick.com/contest/view?id=20217",
                imageUrl: "https://k.kakaocdn.net/dn/cqtr8Z/btq0ewZIuxu/mSjiQ98SVk9eUPM92DP7e1/img_xl.jpg",
              ),
              HomeImageCard(
                title: "애플 공식파트너\n최대 21% 교육할인",
                subTitle: "Apple",
                url: "https://www.campuspick.com/job/view?id=8852",
                imageUrl: "https://blog.kakaocdn.net/dn/uqJpZ/btqyenBIIXx/mh1Cc5F023UGpfQTFBdqV0/img.jpg",
              ),
              HomeImageCard(
                title: "대학생만을 위한\n컨템포러리 브랜드",
                subTitle: "Mur",
                url: "https://www.campuspick.com/job/view?id=8850",
                imageUrl: "https://image.wconcept.co.kr/productimg/image/img9/09/301715509_HP75338.jpg",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildActivities(BuildContext context) {
    return TitleOutlinedCard(
      title: "대외활동",
      button: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => WebviewScreen(url: "https://www.campuspick.com/activity", title: "대외활동", isCampus: true))));
        },
        child: const Text(
          "더 보기 >",
          style: TextStyle(color: EveryTimeColor.red, fontSize: 15.0),
        ),
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              HomeImageCard(
                title: "[ADRF] 동화책 영어 번역 동아리 <희망드림 12기> 모집",
                webViewTitle: "대외활동 정보",
                subTitle: "아프리카아시아난민교육후원회(ADRF)",
                url: "https://www.campuspick.com/activity/view?id=20400",
                imageUrl: "https://cf-cpi.campuspick.com/activity/1672733823167221_thumb.jpg",
              ),
              HomeImageCard(
                title: "대한민국청소년기자단 6기 대학생기자 모집",
                webViewTitle: "대외활동 정보",
                subTitle: "대한민국청소년기자단",
                url: "https://www.campuspick.com/activity/view?id=20427",
                imageUrl: "https://cf-cpi.campuspick.com/activity/1672898677914330_thumb.jpg",
              ),
              HomeImageCard(
                title: "[GEYK] 제1회 생물다양성 포럼: 우리 모두의 생물다양성 이야기",
                webViewTitle: "대외활동 정보",
                subTitle: "기후변화청년단체 GEYK",
                url: "https://www.campuspick.com/activity/view?id=20388",
                imageUrl: "https://cf-cpi.campuspick.com/activity/1672647730172456_thumb.jpg",
              ),
              HomeImageCard(
                title: "슈콤마보니 일반인 앰버서더를 모집합니다.",
                webViewTitle: "대외활동 정보",
                subTitle: "코오롱인더스트리 슈콤마보니",
                url: "https://www.campuspick.com/activity/view?id=20432",
                imageUrl: "https://cf-cpi.campuspick.com/activity/1672973300794450_thumb.jpg",
              ),
              HomeImageCard(
                title: "삼성물산 에버랜드 순간(SOONGAN) 서포터즈 1기 모집",
                webViewTitle: "대외활동 정보",
                subTitle: "삼성물산리조트",
                url: "https://www.campuspick.com/activity/view?id=20437",
                imageUrl: "https://cf-cpi.campuspick.com/activity/1672985805769577_thumb.jpg",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCompetition(BuildContext context) {
    return TitleOutlinedCard(
      title: "공모전",
      button: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => WebviewScreen(url: "https://www.campuspick.com/contest", title: "공모전", isCampus: true))));
        },
        child: const Text(
          "더 보기 >",
          style: TextStyle(color: EveryTimeColor.red, fontSize: 15.0),
        ),
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              HomeImageCard(
                title: "하동군 도시브랜드 슬로건 및 BI 공모전",
                webViewTitle: "공모전 정보",
                subTitle: "하동군",
                url: "https://www.campuspick.com/contest/view?id=20217",
                imageUrl: "https://cf-cpi.campuspick.com/activity/1669713130116994_thumb.jpg",
              ),
              HomeImageCard(
                title: "2022 KR 자산개발사업 대학생 사진 공모전",
                webViewTitle: "공모전 정보",
                subTitle: "국가철도공단",
                url: "https://www.campuspick.com/contest/view?id=20340",
                imageUrl: "https://cf-cpi.campuspick.com/activity/1671783136407469_thumb.jpg",
              ),
              HomeImageCard(
                title: "2023 몽몽공장 아뜰리에 제3회 대학생 공모전",
                webViewTitle: "공모전 정보",
                subTitle: "몽몽공장 아뜰리에",
                url: "https://www.campuspick.com/contest/view?id=20346",
                imageUrl: "https://cf-cpi.campuspick.com/activity/1671943087033262_thumb.jpg",
              ),
              HomeImageCard(
                title: "2022년 재영솔루텍 신사업 아이디어 공모전",
                webViewTitle: "공모전 정보",
                subTitle: "재영솔루텍",
                url: "https://www.campuspick.com/contest/view?id=20297",
                imageUrl: "https://cf-cpi.campuspick.com/activity/167107349304350_thumb.jpg",
              ),
              HomeImageCard(
                title: "[경기아트센터 / 경기도극단] 2023년 창작희곡공모전",
                webViewTitle: "공모전 정보",
                subTitle: "경기아트센터",
                url: "https://www.campuspick.com/contest/view?id=20430",
                imageUrl: "https://cf-cpi.campuspick.com/activity/1672902741799374_thumb.jpg",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMarketArticle(BuildContext context) {
    return TitleOutlinedCard(
      title: "판매 중인 책",
      button: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: ((context) => const BookBoard())));
        },
        child: const Text(
          "더 보기 >",
          style: TextStyle(color: EveryTimeColor.red, fontSize: 15.0),
        ),
      ),
      child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                HomeImageCard(
                  title: "전자상거래(디지털 트랜스포메이션 시대의)",
                  price: 16000,
                  imageUrl:
                      "https://cf-cii.everytime.kr/1357aa849d7bee3291b1a83dad649fefffb32a15ef05728154186f7a9e5a4683/1673112503313_0.jpg",
                ),
                HomeImageCard(
                  title: "물류관리와 SCM(5판)",
                  price: 16000,
                  imageUrl:
                      "https://cf-cii.everytime.kr/3deeece5abfa6b4b5abcc279bdc88393ac9103596d26889e1c156ee2adc839a0/1673112347498_0.jpg",
                ),
                HomeImageCard(
                    title: "제품개발과 브랜드구축(고객가치를 창조하는)(양장본 HardCover)",
                    price: 10000,
                    imageUrl:
                        "https://cf-cii.everytime.kr/0c7f6a0212f65b6dfc4520dc9c1818e51aa50151d45cd41cf9a6f4aaae8f152c/1673112108650_0.jpg"),
                HomeImageCard(
                  title: "영양판정(3판)",
                  price: 12000,
                  imageUrl:
                      "https://cf-cii.everytime.kr/c219a600756dd787ce87c28e939fd9265b93e41f88cf77cb8e9ff10784444e62/1673074141301_0.jpg",
                ),
              ],
            ),
          )),
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
          buildActivities(context),
          const SizedBox(height: 10),
          buildCompetition(context),
          const SizedBox(height: 10),
          buildMarketArticle(context),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:clone_everytime/const.dart';
import 'package:clone_everytime/screens/main/widgets/board_widget.dart';
import 'package:clone_everytime/widgets/everytime_card.dart';

class AdvertiseTabScreen extends StatelessWidget {
  const AdvertiseTabScreen({super.key});

  Widget buildPopularBoard() {
    return Column(
      children: [
        TitleOutlinedCard(
          title: "인기 게시물",
          child: Column(
            children: [
              AdvertiseArticle(
                title: "당감동 CU 22일 대타 구합니다!(시급1만)",
                text: "오전10~오후5시\n업무는 할거 정말 없습니다 청소 안해도 상관없어요\n물류(삼각김밥,빵,커피) 한두박스 들어오면 그거 체크하는게 거의 전부예요! (30분정도면 다 함)",
                board: "홍보게시판",
              ),
              const SizedBox(height: 10.0),
              AdvertiseArticle(
                title: "같이 시험공부!",
                text: "이번 시험 준비 잘하고 계신가요,,",
                board: "자율 스터디",
              ),
              const SizedBox(height: 10.0),
              AdvertiseArticle(
                imagePath: "assets/images/adv_2.jpg",
                title: "청소년과 함께하실 봉사자를 모집합니다",
                text: "안녕하세요!\n사상구 청소년 수련관에서 23년 학습멘토를 모집중입니다!",
                board: "홍보게시판",
                recommend: 0,
                comment: 2,
              ),
              const SizedBox(height: 10.0),
              AdvertiseArticle(
                imagePath: "assets/images/adv_1.jpg",
                title: "태연동",
                text: "🥋태연동🥋부원 모집\n안녕하십니까! 동의대학교 제 38대 총 동아리 연합회 생활체육 2분과 소속 중앙동아리 태연동입니다!!",
                board: "홍보게시판",
                recommend: 2,
                comment: 0,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget buildStudyBoard() {
    return Column(
      children: [
        TitleOutlinedCard(
          title: "스터디",
          button: GestureDetector(
            onTap: () {},
            child: const Text(
              "더 보기 >",
              style: TextStyle(color: EveryTimeColor.red, fontSize: 15.0),
            ),
          ),
          child: AdvertiseArticle(
            text: "공부할 사람",
            board: "자율 스터디",
          ),
        )
      ],
    );
  }

  Widget buildAdBoard() {
    return Column(
      children: [
        TitleOutlinedCard(
          title: "홍보",
          button: GestureDetector(
            onTap: () {},
            child: const Text(
              "더 보기 >",
              style: TextStyle(color: EveryTimeColor.red, fontSize: 15.0),
            ),
          ),
          child: Column(
            children: [
              AdvertiseArticle(
                text: "청소년과 함께하실 봉사자를 모집합니다",
                board: "01/04",
                recommend: 0,
                comment: 2,
              ),
              AdvertiseArticle(
                text: "해주시면 천원 드려요",
                board: "01/04",
                recommend: 0,
                comment: 0,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget buildCirclesBoard() {
    return Column(
      children: [
        TitleOutlinedCard(
          title: "동아리·학회",
          button: GestureDetector(
            onTap: () {},
            child: const Text(
              "더 보기 >",
              style: TextStyle(color: EveryTimeColor.red, fontSize: 15.0),
            ),
          ),
          child: Column(
            children: [
              AdvertiseArticle(
                text: "패션디자인 교외 동아리(작업실 보유)👗🥼💕💕💕",
                board: "01/01",
                recommend: 3,
                comment: 0,
              ),
              AdvertiseArticle(
                text: "🛹보드동아리 ♥CALIS♥ 🛹",
                board: "12/31",
                recommend: 0,
                comment: 0,
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildPopularBoard(),
          const SizedBox(height: 10.0),
          buildStudyBoard(),
          const SizedBox(height: 10.0),
          buildAdBoard(),
          const SizedBox(height: 10.0),
          buildCirclesBoard(),
        ],
      ),
    );
  }
}

import 'package:clone_everytime/const.dart';
import 'package:clone_everytime/widgets/everytime_card.dart';
import 'package:flutter/material.dart';

class CourseTabScreen extends StatelessWidget {
  const CourseTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TitleOutlinedCard(
        title: "취업·진로",
        button: GestureDetector(
          onTap: () {},
          child: const Text(
            "더 보기 >",
            style: TextStyle(color: EveryTimeColor.red, fontSize: 15.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: OutlinedCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            "자유 >",
                            style: TextStyle(color: EveryTimeColor.red, fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Flexible(
                                  flex: 8,
                                  child: Text("전과 질문", style: TextStyle(overflow: TextOverflow.ellipsis)),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: Text("01/05", style: TextStyle(color: Colors.grey, fontSize: 12.0)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Flexible(
                                  flex: 8,
                                  child: Text("진로고민 들어주실분", style: TextStyle(overflow: TextOverflow.ellipsis)),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: Text("01/05", style: TextStyle(color: Colors.grey, fontSize: 12.0)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Flexible(
                                  flex: 8,
                                  child: Text("교외공모전", style: TextStyle(overflow: TextOverflow.ellipsis)),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: Text("01/01", style: TextStyle(color: Colors.grey, fontSize: 12.0)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: OutlinedCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            "꿀팁 >",
                            style: TextStyle(color: EveryTimeColor.red, fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Flexible(
                                  flex: 8,
                                  child: Text("국민취업제도 모르는 사람 없게 해주세요", style: TextStyle(overflow: TextOverflow.ellipsis)),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: Text("05/03", style: TextStyle(color: Colors.grey, fontSize: 12.0)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Flexible(
                                  flex: 8,
                                  child: Text("국민취업제도 신청해보세요!", style: TextStyle(overflow: TextOverflow.ellipsis)),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: Text("05/02", style: TextStyle(color: Colors.grey, fontSize: 12.0)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Flexible(
                                  flex: 8,
                                  child: Text("체육교육과로 편입 준비하시는 선배님 계시나요", style: TextStyle(overflow: TextOverflow.ellipsis)),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: Text("05/03", style: TextStyle(color: Colors.grey, fontSize: 12.0)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: OutlinedCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            "후기 >",
                            style: TextStyle(color: EveryTimeColor.red, fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Flexible(
                                  flex: 8,
                                  child: Text("ICT 인턴십 제도", style: TextStyle(overflow: TextOverflow.ellipsis)),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: Text("07/08", style: TextStyle(color: Colors.grey, fontSize: 12.0)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Flexible(
                                  flex: 8,
                                  child: Text("ICT 인턴십 제도", style: TextStyle(overflow: TextOverflow.ellipsis)),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: Text("07/08", style: TextStyle(color: Colors.grey, fontSize: 12.0)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Flexible(
                                  flex: 8,
                                  child: Text("벡스코 대학생서포터즈 채용공고(~01/24)", style: TextStyle(overflow: TextOverflow.ellipsis)),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: Text("2년전", style: TextStyle(color: Colors.grey, fontSize: 12.0)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      const SizedBox(height: 10),
      TitleOutlinedCard(
          title: "공기업 준비 게시판",
          button: GestureDetector(
            onTap: () {},
            child: const Text(
              "더 보기 >",
              style: TextStyle(color: EveryTimeColor.red, fontSize: 15.0),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Align(alignment: Alignment.centerLeft, child: Text("글이 없습니다")),
          ))
    ]);
  }
}

import 'package:clone_everytime/const.dart';
import 'package:clone_everytime/models/gpa_data.dart';
import 'package:clone_everytime/providers/grade_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GpaTable extends StatefulWidget {
  const GpaTable({super.key});

  @override
  State<GpaTable> createState() => _GpaTableState();
}

class _GpaTableState extends State<GpaTable> {
  @override
  Widget build(BuildContext context) {
    final GradeProvider gradeProvider = Provider.of<GradeProvider>(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Consumer<GradeProvider>(builder: (context, provider, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      gradeProvider.tabTitleList[gradeProvider.gradeIndex],
                      style: const TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4.0),
                    RichText(
                        text: TextSpan(children: [
                      const TextSpan(text: "평점 ", style: TextStyle(color: Colors.black, fontSize: 12.0)),
                      TextSpan(
                          text: "${gradeProvider.smtGpa.toStringAsFixed(1)}  ",
                          style: const TextStyle(color: EveryTimeColor.red, fontSize: 12.0, fontWeight: FontWeight.bold)),
                      const TextSpan(text: "전공 ", style: TextStyle(color: Colors.black, fontSize: 12.0)),
                      TextSpan(
                          text: "${gradeProvider.smtMajorGpa.toStringAsFixed(1)}  ",
                          style: const TextStyle(color: EveryTimeColor.red, fontSize: 12.0, fontWeight: FontWeight.bold)),
                      const TextSpan(text: "취득 ", style: TextStyle(color: Colors.black, fontSize: 12.0)),
                      TextSpan(
                          text: "${gradeProvider.smtCredit.toStringAsFixed(1)}  ",
                          style: const TextStyle(color: EveryTimeColor.red, fontSize: 12.0, fontWeight: FontWeight.bold)),
                    ]))
                  ],
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: SizedBox(
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: EveryTimeColor.red,
                    splashFactory: NoSplash.splashFactory,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide.none,
                    ),
                  ),
                  child: const Text(
                    "시간표 불러오기",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15.0),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: [
              Consumer<GradeProvider>(builder: (context, provider, child) {
                return Table(
                  border: TableBorder.symmetric(inside: BorderSide(color: Colors.grey[300]!, width: 1.0)),
                  columnWidths: const {0: IntrinsicColumnWidth()},
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    TableRow(children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "과목명",
                                style: TextStyle(color: Colors.grey),
                              )),
                        ),
                      ),
                      const SizedBox(
                        child: Align(alignment: Alignment.center, child: Text("학점", style: TextStyle(color: Colors.grey))),
                      ),
                      const SizedBox(
                        child: Align(alignment: Alignment.center, child: Text("성적", style: TextStyle(color: Colors.grey))),
                      ),
                      const SizedBox(
                        child: Align(alignment: Alignment.center, child: Text("전공", style: TextStyle(color: Colors.grey))),
                      ),
                    ]),
                    for (int i = 0; i < gradeProvider.gradeList.length; i++)
                      if (gradeProvider.gradeList[i].smt == gradeProvider.gradeIndex)
                        TableRow(children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(color: Colors.grey[100]),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 8.0),
                              child: TextField(
                                controller: gradeProvider.gradeList[i].nameTextController,
                                cursorColor: Colors.grey,
                                decoration: const InputDecoration(border: InputBorder.none),
                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(color: Colors.grey[100]),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 8.0),
                              child: TextField(
                                controller: gradeProvider.gradeList[i].creditTextController,
                                cursorColor: Colors.grey,
                                decoration: const InputDecoration(border: InputBorder.none),
                                onSubmitted: (value) {
                                  gradeProvider.refresh();
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0, right: 4.0),
                            child: Center(
                              child: DropdownButton(
                                  value: gradeProvider.gradeList[i].grade,
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  underline: const SizedBox(),
                                  isExpanded: true,
                                  isDense: true,
                                  items: gradeProvider.gradeGpa.keys.toList().map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem(value: value, child: Text(value));
                                  }).toList(),
                                  onChanged: (String? value) {
                                    gradeProvider.gradeList[i].grade = value!;
                                    gradeProvider.refresh();
                                  }),
                            ),
                          ),
                          Consumer<GradeProvider>(builder: (context, provider, child) {
                            return SizedBox(
                              width: 18,
                              height: 18,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    gradeProvider.gradeList[i].isMajor = !gradeProvider.gradeList[i].isMajor;
                                  });
                                  gradeProvider.refresh();
                                },
                                child: gradeProvider.gradeList[i].isMajor
                                    ? Image.asset(
                                        'assets/icons/ic_checkbox_on_yellow_9dp.png',
                                        color: EveryTimeColor.red,
                                      )
                                    : Image.asset(
                                        'assets/icons/ic_checkbox_off_black166_9dp.png',
                                      ),
                              ),
                            );
                          }),
                        ]),
                  ],
                );
              }),
              Divider(
                color: Colors.grey[300],
                height: 0.0,
                thickness: 1.0,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            gradeProvider.gradeList.add(Grade(smt: gradeProvider.gradeIndex));
                          });
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            "더 입력하기",
                            style: TextStyle(color: EveryTimeColor.red, fontSize: 12.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            gradeProvider.clear();
                          });
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            "초기화",
                            style: TextStyle(color: Colors.grey, fontSize: 12.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            for (var i in gradeProvider.gradeList) {
                              print(i.toString());
                            }
                          });
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            "성적 정보 확인",
                            style: TextStyle(color: Colors.grey, fontSize: 12.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

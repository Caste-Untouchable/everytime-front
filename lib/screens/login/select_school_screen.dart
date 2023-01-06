import 'package:flutter/material.dart';

import 'package:clone_everytime/const.dart';
import 'package:clone_everytime/screens/login/agreement_screen.dart';
import 'package:clone_everytime/screens/login/widgets/login_widget.dart';

class SelectSchoolScreen extends StatefulWidget {
  const SelectSchoolScreen({super.key});

  @override
  State<SelectSchoolScreen> createState() => _SelectSchoolScreenState();
}

class _SelectSchoolScreenState extends State<SelectSchoolScreen> {
  String stuId = "연도 선택(학번)";
  List<DropdownMenuItem<String>> stuIdList = [];

  @override
  void initState() {
    stuIdList.add(
      const DropdownMenuItem<String>(
        value: "연도 선택(학번)",
        enabled: false,
        child: Text("연도 선택(학번)"),
      ),
    );

    for (int i = 1994; i < 2024; i++) {
      String itemValue = "$i학번";
      stuIdList.add(DropdownMenuItem<String>(value: itemValue, child: Text(itemValue)));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close))],
        title: const Text("회원가입"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "학교 선택",
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                "입학년도",
                style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0, right: 4.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey[100],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton<String>(
                      isDense: true,
                      isExpanded: true,
                      icon: const Icon(Icons.keyboard_arrow_down_outlined),
                      items: stuIdList,
                      onChanged: (String? value) {
                        setState(() {
                          stuId = value!;
                        });
                      },
                      value: stuId,
                      underline: const SizedBox(),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                "학교",
                style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0, right: 4.0),
              child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.05,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[100],
                ),
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 8.0),
                  child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                          isDense: true,
                          isCollapsed: true,
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: "학교 이름을 검색하세요.",
                          suffixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          hoverColor: Colors.grey)),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            LoginScreenButton(
                color: EveryTimeColor.red,
                child: const Text("다음", style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => const AgreementScreen())));
                })
          ],
        ),
      ),
    );
  }
}

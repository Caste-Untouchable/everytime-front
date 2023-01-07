import 'package:flutter/material.dart';

import 'package:clone_everytime/screens/my_page/widget/my_page_widget.dart';

class CertificationScreeen extends StatelessWidget {
  const CertificationScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close))],
        title: const Text("학교 인증"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "인증 방식 선택",
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20.0),
              CertButton(
                title: "합격자 인증",
                text: "새내기 게시판만 이용 가능하며,\n합격 증명 자료를 통해 인증",
              ),
              CertButton(
                title: "재학생 인증",
                text: "게시판, 캠퍼스픽 등 모든 커뮤니티 이용이 가능하며,\n재학 증명 자료를 통해 인증",
              ),
              CertButton(
                title: "졸업생 인증",
                text: "게시판, 캠퍼스픽 등 모든 커뮤니티 이용이 가능하며,\n재학 증명 자료를 통해 인증",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

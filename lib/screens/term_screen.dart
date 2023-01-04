import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';

class TermScreen extends StatelessWidget {
  TermScreen({super.key, required this.term});

  final String term;

  Map<String, String> terms = {
    'privacy': "개인정보 처리방침",
    'serviceagreement': "이용약관",
  };

  Future<String> _loadHtml() async {
    String termHtml = await rootBundle.loadString('assets/terms/$term.html');

    return termHtml;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close))],
        title: Text(terms[term]!),
      ),
      body: FutureBuilder(
        future: _loadHtml(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(child: Html(data: snapshot.data)),
            );
          } else if (snapshot.hasData == false) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const Center(child: Text("약관을 불러오는 중 오류가 발생하였습니다."));
          }
        },
      ),
    );
  }
}

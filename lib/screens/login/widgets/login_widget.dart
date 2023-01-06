import 'package:clone_everytime/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';

Widget LoginTextField({required String hintText, required TextEditingController controller, bool isObscure = false}) {
  return Padding(
    padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 5.0),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: const Color(0xFFF2F2F2),
        isDense: true,
      ),
      obscureText: isObscure,
    ),
  );
}

class LoginScreenButton extends StatelessWidget {
  LoginScreenButton({
    super.key,
    required this.color,
    required this.child,
    required this.onPressed,
  });

  Color color;
  VoidCallback onPressed;
  Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0, right: 4.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: color,
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide.none,
              ),
              splashFactory: NoSplash.splashFactory,
            ),
            onPressed: onPressed,
            child: child),
      ),
    );
  }
}

class AgreeCheck extends StatelessWidget {
  AgreeCheck({super.key, required this.title, required this.htmlName, required this.isBold, required this.isAgree});

  String title;
  String htmlName;
  bool isBold;
  bool isAgree;

  Future<String> _loadHtml(String term) async {
    String termHtml = await rootBundle.loadString('assets/terms/$term.html');

    return termHtml;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 13.0,
              height: 13.0,
              child: Image.asset(
                'assets/icons/ic_checkbox_on_yellow_9dp.png',
                color: EveryTimeColor.red,
              ),
            ),
            const SizedBox(width: 10.0),
            Text(title, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          ],
        ),
        const SizedBox(height: 15.0),
        Container(
          height: MediaQuery.of(context).size.height * 0.2,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.grey[100],
          ),
          child: FutureBuilder(
            future: _loadHtml(htmlName),
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
        ),
        const SizedBox(height: 15.0),
      ],
    );
  }
}

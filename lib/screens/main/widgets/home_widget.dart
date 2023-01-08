import 'package:ellipsis_overflow_text/ellipsis_overflow_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:clone_everytime/screens/main/screens/webview_screen.dart';
import 'package:clone_everytime/widgets/everytime_card.dart';

class CircleButton extends StatelessWidget {
  CircleButton({
    Key? key,
    required this.title,
    required this.iconName,
    required this.url,
  }) : super(key: key);

  String iconName;
  String title;
  String url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: ((context) => WebviewScreen(url: url))));
      },
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  shape: BoxShape.circle,
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset("assets/icons/$iconName.png"),
                  ),
                ),
              ),
            ],
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 40),
            child: Text(
              title,
              style: const TextStyle(fontSize: 14.0),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  HomeCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.subColor,
    required this.icon,
    required this.button,
  });

  Widget button;
  Widget icon;
  Color subColor;
  String subTitle;
  String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: OutlinedCard(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 25.0,
                height: 25.0,
                child: icon,
              ),
            ),
            const SizedBox(width: 5.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4.0),
                Text(
                  subTitle,
                  style: TextStyle(color: subColor, fontSize: 12.0),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                button,
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HomeImageCard extends StatelessWidget {
  HomeImageCard({
    Key? key,
    required this.title,
    this.url,
    required this.imageUrl,
    this.subTitle,
    this.date,
    this.price,
    this.webViewTitle = "",
  }) : super(key: key);

  DateTime? date;
  String? url;
  String imageUrl;
  int? price;
  String? subTitle;
  String title;
  String webViewTitle;

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.simpleCurrency(locale: "ko_KR", name: "", decimalDigits: 0);

    return Padding(
      padding: const EdgeInsets.only(top: 15.0, right: 10.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.35,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Ink(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[400]!, width: 1),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: InkWell(
              onTap: (() {
                Navigator.push(
                    context, MaterialPageRoute(builder: ((context) => WebviewScreen(url: url!, title: webViewTitle, isCampus: true))));
              }),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.35,
                    height: MediaQuery.of(context).size.width * 0.35,
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: EllipsisOverflowText(
                      title,
                      maxLines: 2,
                      showEllipsisOnBreakLineOverflow: true,
                      style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                  if (subTitle != null)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 15.0),
                      child: EllipsisOverflowText(
                        subTitle!,
                        maxLines: 1,
                        style: const TextStyle(color: Colors.grey, fontSize: 11.0),
                      ),
                    ),
                  if (date != null)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 15.0),
                      child: Text(
                        DateFormat('~ MM/dd').format(date!),
                        style: const TextStyle(color: Colors.grey, fontSize: 11.0),
                      ),
                    ),
                  if (price != null)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 15.0),
                      child: Text(
                        "${formatCurrency.format(price!)}원",
                        style: const TextStyle(color: Colors.grey, fontSize: 11.0),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:clone_everytime/widgets/custom_container.dart';

class CustomCard extends StatelessWidget {
  String title;
  String subTitle;
  Color subColor;
  Widget icon;
  Widget button;

  CustomCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.subColor,
    required this.icon,
    required this.button,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: CustomContainer(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: icon,
              ),
            ),
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

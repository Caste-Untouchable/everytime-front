import 'package:flutter/material.dart';

import 'package:clone_everytime/widgets/custom_container.dart';
import 'package:intl/intl.dart';

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

class CustomImageCard extends StatelessWidget {
  String title;
  String? subTitle;
  String imageUrl;
  DateTime? date;

  CustomImageCard({
    Key? key,
    required this.title,
    required this.imageUrl,
    this.subTitle,
    this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, right: 10.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.35,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[400]!, width: 1),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: MediaQuery.of(context).size.width * 0.35,
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
                  ),
                ),
                if (subTitle != null)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 15.0),
                    child: Text(
                      subTitle!,
                      style: const TextStyle(color: Colors.grey, fontSize: 11.0),
                    ),
                  ),
                if (date != null)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 15.0),
                    child: Text(
                      DateFormat('~MM/dd').format(date!),
                      style: const TextStyle(color: Colors.grey, fontSize: 11.0),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

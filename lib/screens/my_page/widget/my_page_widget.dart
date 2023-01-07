import 'package:clone_everytime/widgets/everytime_card.dart';
import 'package:flutter/material.dart';

class MyPageCard extends StatelessWidget {
  String title;
  var menus;

  MyPageCard({super.key, required this.title, required this.menus});

  @override
  Widget build(BuildContext context) {
    return OutlinedCard(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15.0),
        Text(
          title,
          style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15.0),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: menus.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: InkWell(
                    onTap: menus[index][1],
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            menus[index][0],
                            style: const TextStyle(fontSize: 15.0),
                          ),
                          Text(
                            menus[index][2]!,
                            style: const TextStyle(color: Colors.grey, fontSize: 12.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    ));
  }
}

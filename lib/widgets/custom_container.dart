import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;

  const CustomContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 25.0),
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!, width: 1),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: child,
    );
  }
}

class CustomButtonContainer extends StatelessWidget {
  final String title;
  final Widget button;
  final Widget child;

  const CustomButtonContainer({super.key, required this.title, required this.button, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 25.0),
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!, width: 1),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            button,
          ],
        ),
        const SizedBox(height: 20.0),
        child,
      ]),
    );
  }
}

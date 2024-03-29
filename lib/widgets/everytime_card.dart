import 'package:flutter/material.dart';

class OutlinedCard extends StatelessWidget {
  const OutlinedCard({super.key, required this.child, this.padding});

  final Widget child;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!, width: 1),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: child,
    );
  }
}

class TitleOutlinedCard extends StatelessWidget {
  const TitleOutlinedCard({super.key, required this.title, this.button, required this.child});

  final Widget? button;
  final Widget child;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
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
            button == null ? const SizedBox() : button!,
          ],
        ),
        const SizedBox(height: 5.0),
        child,
      ]),
    );
  }
}

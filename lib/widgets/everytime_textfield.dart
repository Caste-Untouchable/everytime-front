import 'package:flutter/material.dart';

class EverytimeTextField extends StatelessWidget {
  EverytimeTextField({super.key, required this.title, required this.controller, this.isObscure = false});

  String title;
  TextEditingController controller;
  bool isObscure;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            title,
            style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w700),
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
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 8.0),
              child: TextField(
                  controller: controller,
                  obscureText: isObscure,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: const InputDecoration(
                      isDense: true,
                      isCollapsed: true,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hoverColor: Colors.grey)),
            ),
          ),
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }
}

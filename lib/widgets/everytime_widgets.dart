import 'package:flutter/material.dart';

class EverytimeButton extends StatelessWidget {
  EverytimeButton({
    super.key,
    required this.color,
    required this.child,
    required this.onPressed,
  });

  Widget child;
  Color color;
  VoidCallback onPressed;

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

class EverytimeTextField extends StatelessWidget {
  EverytimeTextField({super.key, required this.title, required this.controller, this.isObscure = false, this.hint});

  String title;
  String? hint;
  TextEditingController controller;
  bool isObscure;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 4.0, 4.0, 4.0),
          child: Text(
            title,
            style: const TextStyle(color: Colors.black54, fontWeight: FontWeight.w700, fontSize: 13.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4.0, right: 4.0),
          child: Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.05,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!, width: 1.0),
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.grey[100],
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 8.0),
              child: TextField(
                  controller: controller,
                  obscureText: isObscure,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                      isDense: true,
                      isCollapsed: true,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hoverColor: Colors.grey,
                      hintText: hint,
                      hintStyle: const TextStyle(color: Colors.grey))),
            ),
          ),
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }
}

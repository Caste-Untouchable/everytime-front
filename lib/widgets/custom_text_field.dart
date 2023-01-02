import 'package:flutter/material.dart';

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

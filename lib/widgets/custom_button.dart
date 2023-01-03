import 'package:flutter/material.dart';

class NoSplashIconButton extends StatelessWidget {
  final Function() onPressed;
  final Widget icon;

  const NoSplashIconButton({super.key, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      constraints: const BoxConstraints(),
      icon: icon,
      onPressed: onPressed,
      highlightColor: Colors.transparent,
      padding: EdgeInsets.zero,
      splashColor: Colors.transparent,
    );
  }
}

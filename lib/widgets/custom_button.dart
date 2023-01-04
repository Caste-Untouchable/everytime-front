import 'package:flutter/material.dart';

class NoSplashIconButton extends StatelessWidget {
  const NoSplashIconButton({super.key, required this.onPressed, required this.icon});

  final Widget icon;
  final Function() onPressed;

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

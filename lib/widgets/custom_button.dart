import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  String title;
  String iconName;
  Function() onTap;

  CircleButton({
    Key? key,
    required this.title,
    required this.iconName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  shape: BoxShape.circle,
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset("assets/icons/$iconName.png"),
                  ),
                ),
              ),
            ],
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 40),
            child: Text(
              title,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

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

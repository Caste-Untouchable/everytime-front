import 'package:clone_everytime/screen/login_screen.dart';
import 'package:clone_everytime/screen/main_screen.dart';
import 'package:flutter/material.dart';

class TempScreen extends StatelessWidget {
  const TempScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => LoginScreen())));
                },
                child: const Text("로그인 화면")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => const MainScreen())));
                },
                child: const Text("메인 화면")),
          ],
        ),
      ),
    );
  }
}

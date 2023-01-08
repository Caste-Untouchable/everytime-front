import 'package:flutter/material.dart';

class RestrictScreen extends StatelessWidget {
  const RestrictScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close))],
          title: const Text("이용 제한 내역"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            const Center(
              child: Text(
                "이용 제한 내역이 없어요",
                style: TextStyle(color: Colors.grey, fontSize: 18.0, fontWeight: FontWeight.w800),
              ),
            )
          ],
        ));
  }
}

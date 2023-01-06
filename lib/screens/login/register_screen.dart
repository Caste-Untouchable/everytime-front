import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:clone_everytime/const.dart';
import 'package:clone_everytime/providers/register_provider.dart';
import 'package:clone_everytime/screens/login/login_screen.dart';
import 'package:clone_everytime/screens/login/widgets/login_widget.dart';
import 'package:clone_everytime/utils/database/every_time_api.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _idTextController = TextEditingController();
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _nickNameTextController = TextEditingController();
  final TextEditingController _pwTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final RegisterProvider registerProvider = Provider.of<RegisterProvider>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close))],
        title: const Text("회원가입"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "회원 가입",
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20.0),
              RegisterTextField(title: "아이디", controller: _idTextController),
              RegisterTextField(title: "비밀번호", controller: _pwTextController, isObscure: true),
              RegisterTextField(title: "이름", controller: _nameTextController),
              RegisterTextField(title: "닉네임", controller: _nickNameTextController),
              RegisterTextField(title: "이메일", controller: _emailTextController),
              LoginScreenButton(
                onPressed: () async {
                  registerProvider.setUser(
                      userId: _idTextController.text,
                      name: _nameTextController.text,
                      nickName: _nickNameTextController.text,
                      email: _emailTextController.text,
                      pwd: _pwTextController.text);
                  bool isSuccess = await EveryTimeApi.signUp(registerProvider.userData);

                  if (isSuccess) {
                    Navigator.push(context, MaterialPageRoute(builder: ((context) => LoginScreen())));
                  } else {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            actionsAlignment: MainAxisAlignment.end,
                            actionsPadding: EdgeInsets.zero,
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text("확인", style: TextStyle(color: EveryTimeColor.red))),
                            ],
                            content: const Text("이미 존재하는 회원 정보입니다."),
                            contentPadding: const EdgeInsets.all(16.0),
                          );
                        });
                  }
                },
                color: EveryTimeColor.red,
                child: const Text(
                  "회원가입",
                  style: TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

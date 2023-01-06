import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

import 'package:clone_everytime/const.dart';
import 'package:clone_everytime/providers/token_provider.dart';
import 'package:clone_everytime/screens/login/select_school_screen.dart';
import 'package:clone_everytime/screens/login/widgets/login_widget.dart';
import 'package:clone_everytime/screens/main_screen.dart';
import 'package:clone_everytime/screens/term_screen.dart';
import 'package:clone_everytime/utils/database/every_time_api.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _storage = const FlutterSecureStorage();

  final _idTextController = TextEditingController();
  final _pwTextController = TextEditingController();
  late TokenProvider _tokenProvider;

  bool isRunLogin = true;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _tokenProvider = Provider.of<TokenProvider>(context, listen: false);
      _getAccountData();
    });
    super.initState();
  }

  void _getAccountData() async {
    String? savedId = await _storage.read(key: 'id');
    String? savedPw = await _storage.read(key: 'pw');

    if (savedId != null && savedPw != null) {
      String jwt = await EveryTimeApi.login(id: savedId, pw: savedPw);

      if (jwt.isNotEmpty) {
        if (mounted) {
          _tokenProvider.jwt = jwt;
          Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => MainScreen())));
        }
      } else {
        _idTextController.text = savedId;
      }
    }
  }

  loginFailure(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            actionsAlignment: MainAxisAlignment.end,
            actionsPadding: EdgeInsets.zero,
            actions: [
              TextButton(onPressed: () => Navigator.pop(context), child: const Text("확인", style: TextStyle(color: EveryTimeColor.red))),
            ],
            content: const Text("비밀번호가 일치하지 않습니다."),
            contentPadding: const EdgeInsets.all(16.0),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Image.asset('assets/images/auth_logo.png'),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                LoginTextField(hintText: "아이디", controller: _idTextController),
                LoginTextField(hintText: "비밀번호", controller: _pwTextController, isObscure: true),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () async {
                        String jwt = await EveryTimeApi.login(id: _idTextController.text, pw: _pwTextController.text);

                        if (mounted) {
                          if (jwt.isNotEmpty) {
                            _tokenProvider.jwt = jwt;
                            _storage.write(key: 'id', value: _idTextController.text);
                            _storage.write(key: 'pw', value: _pwTextController.text);

                            Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => MainScreen())));
                          } else {
                            setState(() {
                              isRunLogin = false;
                            });

                            loginFailure(context);
                          }
                        }
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: EveryTimeColor.red,
                        splashFactory: NoSplash.splashFactory,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide.none,
                        ),
                        padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      ),
                      child: isRunLogin
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                              "에브리타임 로그인",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                TextButton(
                  // TODO : 아이디/비밀번호 찾기 기능 구현
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    splashFactory: NoSplash.splashFactory,
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text(
                    "아이디/비밀번호 찾기",
                    style: TextStyle(
                      color: Color(0xFFB0B0B0),
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: ((context) => const SelectSchoolScreen())));
                  },
                  style: TextButton.styleFrom(
                    splashFactory: NoSplash.splashFactory,
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text(
                    "회원가입",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: ((context) => TermScreen(term: "privacy"))));
                        },
                        child: const Text(
                          "개인정보 처리방침",
                          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 13.0),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "문의하기",
                          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: ((context) => TermScreen(term: "serviceagreement"))));
                        },
                        child: const Text(
                          "이용약관",
                          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

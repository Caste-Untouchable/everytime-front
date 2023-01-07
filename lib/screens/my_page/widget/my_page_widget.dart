import 'package:flutter/material.dart';

import 'package:clone_everytime/const.dart';
import 'package:clone_everytime/widgets/everytime_card.dart';

class MyPageCard extends StatelessWidget {
  String title;
  var menus;

  MyPageCard({super.key, required this.title, required this.menus});

  @override
  Widget build(BuildContext context) {
    return OutlinedCard(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15.0),
        Text(
          title,
          style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15.0),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: menus.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: InkWell(
                    onTap: menus[index][1],
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            menus[index][0],
                            style: const TextStyle(fontSize: 15.0),
                          ),
                          Text(
                            menus[index][2]!,
                            style: const TextStyle(color: Colors.grey, fontSize: 12.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    ));
  }
}

class CertButton extends StatelessWidget {
  String title;
  String text;

  CertButton({super.key, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Material(
        child: Ink(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.grey[200],
          ),
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 1.2),
                Text(
                  text,
                  style: const TextStyle(color: Colors.grey, height: 1.2, fontSize: 12.0),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key, required this.hint, required this.pwController, this.pwCheckController});

  final String hint;
  final TextEditingController pwController;
  final TextEditingController? pwCheckController;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  String? _pwValidate;
  bool _isPwValidate = false;
  Icon _validateIcon = const Icon(Icons.error_outline, color: EveryTimeColor.red);

  String? validatePassword(String value) {
    RegExp regex = RegExp(r'^(?=.*?[0-9A-Za-z])(?=.*?[!@#\$&*~]).{8,}$');

    if (value.isEmpty) {
      _isPwValidate = false;
      return null;
    } else if (widget.pwCheckController != null && widget.pwController.text != widget.pwCheckController!.text) {
      _isPwValidate = true;
      _validateIcon = const Icon(Icons.error_outline, color: EveryTimeColor.red);
      return "비밀번호가 일치하지 않습니다";
    } else if (value.length < 8) {
      _isPwValidate = true;
      _validateIcon = const Icon(Icons.error_outline, color: EveryTimeColor.red);
      return "8자 이상 입력하세요";
    } else {
      if (!regex.hasMatch(value)) {
        _isPwValidate = true;
        _validateIcon = const Icon(Icons.error_outline, color: EveryTimeColor.red);
        return "영문, 숫자, 특수문자를 2종류 이상 조합해주세요";
      } else {
        _validateIcon = const Icon(Icons.check_circle_outline, color: Color(0xFF55D840));

        return null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Focus(
          child: Builder(builder: (context) {
            final FocusNode focusNode = Focus.of(context);
            final bool hasFocus = focusNode.hasFocus;

            return Padding(
              padding: const EdgeInsets.only(left: 4.0, right: 4.0),
              child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.05,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                  color: hasFocus ? Colors.white : Colors.grey[100],
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 8.0, 0.0, 8.0),
                  child: TextField(
                      onChanged: ((value) {
                        setState(() {
                          _pwValidate = validatePassword(value);
                        });
                      }),
                      controller: widget.pwController,
                      obscureText: true,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                          isDense: true,
                          isCollapsed: true,
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hoverColor: Colors.grey,
                          hintText: widget.hint,
                          hintStyle: const TextStyle(color: Colors.grey),
                          suffixIcon: _isPwValidate ? _validateIcon : null)),
                ),
              ),
            );
          }),
        ),
        if (_pwValidate != null)
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 5.0),
            child: Text(
              _pwValidate!,
              style: const TextStyle(color: EveryTimeColor.red, fontSize: 12.0),
            ),
          )
      ],
    );
  }
}

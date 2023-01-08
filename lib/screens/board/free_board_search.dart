import 'package:flutter/material.dart';

class FreeBoardSearch extends StatefulWidget {
  const FreeBoardSearch({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<FreeBoardSearch> {
  //const board_search({super.key});

  final TextEditingController _filter = TextEditingController();
  FocusNode focusNode = FocusNode();

  _SearchScreenState() {
    _filter.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.grey[200],
          title: Row(
            children: [
              Expanded(
                  flex: 6,
                  child: TextField(
                    focusNode: focusNode,
                    cursorColor: Colors.redAccent,
                    style: const TextStyle(fontSize: 18),
                    autofocus: true,
                    controller: _filter,
                    decoration: InputDecoration(
                        hintText: '글 제목, 내용, 해시태그',
                        border: InputBorder.none,
                        suffixIcon: //focusNode.hasFocus
                            _filter.text == ""
                                ? const SizedBox()
                                : IconButton(
                                    icon: const Icon(
                                      Icons.close,
                                      size: 20,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _filter.clear();
                                      });
                                    },
                                  )
                        //: Container(),
                        ),
                  ))
            ],
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: Container(
            padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/icons/icn_m_search_gray800.png',
                  width: 100,
                  height: 100,
                  color: const Color.fromARGB(255, 177, 177, 177),
                ),
                const Center(
                  child: Text(
                    "게시판의 글을 검색해보세요",
                    style: TextStyle(
                        color: Color.fromARGB(255, 177, 177, 177),
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                )
              ],
            )));
  }
}

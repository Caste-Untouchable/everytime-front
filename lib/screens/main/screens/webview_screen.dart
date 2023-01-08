import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreen extends StatefulWidget {
  String url;
  String title;
  bool isCampus;

  WebviewScreen({super.key, required this.url, this.title = "", this.isCampus = false});

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  late final WebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.close, color: widget.isCampus ? Colors.white : Colors.black))
        ],
        title: Text(
          widget.title,
          style: TextStyle(color: widget.isCampus ? Colors.white : Colors.black),
        ),
        backgroundColor: widget.isCampus ? const Color(0xFF1DCDFF) : Colors.white,
      ),
      body: WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: ((controller) {
          _controller.complete(controller);
          _webViewController = controller;
        }),
        onPageFinished: ((url) async {
          if (!widget.isCampus) {
            String? webTitle = await _webViewController.getTitle();
            setState(() {
              widget.title = webTitle!;
            });
          }
        }),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreen extends StatefulWidget {
  String url;

  WebviewScreen({super.key, required this.url});

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  late final WebViewController _webViewController;

  String title = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close))],
        title: Text(title),
      ),
      body: WebView(
        initialUrl: widget.url,
        onWebViewCreated: ((controller) {
          _controller.complete(controller);
          _webViewController = controller;
        }),
        onPageFinished: ((url) async {
          String? webTitle = await _webViewController.getTitle();
          setState(() {
            title = webTitle!;
          });
        }),
      ),
    );
  }
}

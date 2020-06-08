import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Itineraire extends StatelessWidget {
  final String title;
  final String url;


  Itineraire(this.url, this.title);

  final Completer<WebViewController> _controller =
  Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: new Uri.dataFromString('<html><body><iframe src=\"${url}\" width=\"100%\" height=\"100%\"/></body></html>', mimeType: 'text/html').toString(),
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
    );
  }
}

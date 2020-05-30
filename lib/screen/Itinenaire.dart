import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Itineraire extends StatefulWidget {
  final String title;
  final String url;


  Itineraire(this.url, this.title);

  @override
  _ItineraireState createState() => _ItineraireState();
}

class _ItineraireState extends State<Itineraire> {
  String page;
  Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  void initState() {
    print(widget.url);
    setState(() {
      page = "";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 400,
            width: 400,
            child: WebView(
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: "<html>\n"
                  "       <head>\n\n"
                  "       </head>\n"
                  "      <body style=\"padding: 0\">\n"
                  "        <iframe src=\"${widget.url}\" width=\"100%\" height=\"100%\"/>\n"
                  "    </body>\n"
                  "</html>",
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
            ),
          )
        ],
      )
    );
  }
}

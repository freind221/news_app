import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const WebView(
      initialUrl: 'https://dev-yakuza.posstree.com/en/',
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}

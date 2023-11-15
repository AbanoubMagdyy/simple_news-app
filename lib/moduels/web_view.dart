import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../components/components.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen(this.url, {super.key});

  final String url;

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
late  final WebViewController controller ;


@override
  void initState() {
    // TODO: implement initState
    super.initState();
  controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0x00000000))
  ..setNavigationDelegate(
  NavigationDelegate(
  onProgress: (int progress) {
    defLinearProgressIndicator(
      value: progress / 100
    );
  },
  onPageStarted: (String url) {},
  onPageFinished: (String url) {},
  onWebResourceError: (WebResourceError error) {},
  onNavigationRequest: (NavigationRequest request) {
  return NavigationDecision.navigate;
  },
  ),
  )
  ..loadRequest(Uri.parse(widget.url));
   // controller = WebViewController()..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: ()=>controller.reload(),
              icon: const Icon(Icons.replay),
          )
        ],
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}

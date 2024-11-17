import 'package:flutter/material.dart';
import 'package:news_app/models/articel_model.dart';

import 'package:webview_flutter/webview_flutter.dart';

class Viewdetailesnews extends StatefulWidget {
  final String obj;
  const Viewdetailesnews({super.key, required this.obj});

  @override
  State<Viewdetailesnews> createState() => _ViewdetailesnewsState();
}

class _ViewdetailesnewsState extends State<Viewdetailesnews> {
  late WebViewController _controller;
  bool _isControllerReady = false; // Track if the controller is ready

  @override

  // Track if the controller is ready

  @override
  void initState() {
    super.initState();
    _initializeWebViewController();
  }

  Future<void> _initializeWebViewController() async {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar or progress indicator if needed
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      );

    // Load the URL from the widget's obj property
    await _controller.loadRequest(Uri.parse(widget.obj));

    // Update the state when the controller is ready
    setState(() {
      _isControllerReady = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: _isControllerReady
          ? WebViewWidget(
              controller: _controller) // Only show the WebView when ready
          : Center(child: CircularProgressIndicator()),
    );
  }
}

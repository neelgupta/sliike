import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViews extends StatefulWidget {
  const WebViews({Key? key}) : super(key: key);

  @override
  State<WebViews> createState() => _WebViewsState();
}

class _WebViewsState extends State<WebViews> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    // #docregion platform_features
    late final PlatformWebViewControllerCreationParams params;

      params = const PlatformWebViewControllerCreationParams();


    final WebViewController controller =
    WebViewController.fromPlatformCreationParams(params);
    // #enddocregion platform_features

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
Page resource error:
  code: ${error.errorCode}
  description: ${error.description}
  errorType: ${error.errorType}
  isForMainFrame: ${error.isForMainFrame}
          ''');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://connect.stripe.com/express/oauth/v2/authorize?response_type=code&client_id=ca_NkQ7Gkmm99MkOCt1mMuv1ZognhdUMVDr&scope=read_write&stripe_user%5Bemail%5D=test@gmail.com')) {
              print("Done Setup : ${request.isMainFrame}");
              // return NavigationDecision.prevent;
            }
            debugPrint('allowing navigation to ${request.url}');
            return NavigationDecision.navigate;
          },
          // onUrlChange: (UrlChange change) {
          //   debugPrint('url change to ${change.url}');
          // },
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      )
      ..loadRequest(Uri.parse('https://connect.stripe.com/express/oauth/v2/authorize?response_type=code&client_id=ca_NkQ7Gkmm99MkOCt1mMuv1ZognhdUMVDr&scope=read_write&stripe_user%5Bemail%5D=test@gmail.com'));

    // #docregion platform_features
    // #enddocregion platform_features

    _controller = controller;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebViewWidget(
          controller: _controller,
      ),
    );
  }
}
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/bottomnavbar.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';
import 'package:new_sliikeapps_apps/utils/util.dart';
import 'package:webview_flutter/webview_flutter.dart';

class StripeWebViews extends StatefulWidget {
  final String email;
  const StripeWebViews({Key? key, required this.email}) : super(key: key);

  @override
  State<StripeWebViews> createState() => _StripeWebViewsState();
}

class _StripeWebViewsState extends State<StripeWebViews> {
  late final WebViewController _controller;
  bool isLoading = true;
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
            setState(() {
              isLoading = false;
            });
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
            if (request.url.startsWith(
                'https://connect.stripe.com/connect/default/oauth/test?code=')) {
              addStripeToken(request.url);
              debugPrint('blocking navigation to ${request.url}');
              return NavigationDecision.prevent;
            }
            debugPrint('allowing navigation to ${request.url}');
            return NavigationDecision.navigate;
          },
        ),
      )
      ..addJavaScriptChannel('Toaster',
          onMessageReceived: (JavaScriptMessage message) {
        print("212121 ${message.message}");

        if (message.message
                .contains('Congrats, you\'ve almost finished setting') ||
            message.message.contains(
                'Congrats, you\'re almost done setting up your application')) {
          print("121212 ${message.message}");
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(content: Text(message.message)),
          // );
        }
      })
      ..loadRequest(Uri.parse(
          'https://connect.stripe.com/express/oauth/v2/authorize?response_type=code&client_id=ca_NkQ7Gkmm99MkOCt1mMuv1ZognhdUMVDr&scope=read_write&stripe_user[email]=${widget.email}'));

    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return SafeArea(
      child: Scaffold(
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SizedBox(
                height: height,
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width * 0.05,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Center(
                              child: Icon(
                            Icons.arrow_back_ios,
                            size: 25,
                          )),
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: const Text("Bank Account Setup",
                                  style: TextStyle(
                                      fontSize: 16,
                                      overflow: TextOverflow.ellipsis,
                                      color: const Color(0xff292929),
                                      fontFamily: "spartan",
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Expanded(
                      child: WebViewWidget(
                        controller: _controller,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  addStripeToken(String url) async {
    print(url);
    print(url.split("code=").last);
    var bodyDat = {'accountID': url.split("code=").last};

    var headers = {
      'Content-Type': "application/json; charset=utf-8",
      "authorization": "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
    };
    var response = await http.post(
      Uri.parse(ApiUrlList.saveStripeCode),
      body: jsonEncode(bodyDat),
      headers: headers,
    );

    print("Webview response code : ${response.statusCode}");
    print("Webview response body : ${response.body}");

    if (response.statusCode == 200 || response.statusCode == 201) {
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) {
            return  BottomNavigation();
          },
        ),
        (route) => false,
      );
      showToast(
        message: "Stripe Setup Done!!",
      );
    } else {
      showToast(
        message: jsonDecode(response.body)["message"],
      );
    }
  }
}

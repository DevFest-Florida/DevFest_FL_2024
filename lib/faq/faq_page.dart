import 'package:devfestfl/universal/dev_scaffold.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FaqPage extends StatefulWidget {
  static const String routeName = "/faq";

  const FaqPage({Key? key}) : super(key: key);

  @override
  FaqPageState createState() => FaqPageState();
}

class FaqPageState extends State<FaqPage> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    if (!kIsWeb) {
      controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(Uri.parse("https://devfestflorida.org/blog"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return DevScaffold(
      title: "Blog",
      body: kIsWeb
          ? Center(
              child: ElevatedButton(
                child: const Text('Open FAQ in browser'),
                onPressed: () => launchUrl(Uri.parse("https://devfestflorida.org/blog")),
              ),
            )
          : Stack(
              children: [
                WebViewWidget(controller: controller),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        onPressed: () async {
                          if (await controller.canGoBack()) {
                            await controller.goBack();
                          } else {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("No back history item"),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            }
                          }
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.replay),
                        onPressed: () => controller.reload(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
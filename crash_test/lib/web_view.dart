import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key, required this.url});

  final String url;

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  double progress = 0;
  late InAppWebViewGroupOptions webViewOptions;
  final GlobalKey webViewKey = GlobalKey();

  @override
  void initState() {
    webViewOptions = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        resourceCustomSchemes: ['intent'],
        javaScriptEnabled: true,
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
        supportZoom: false,
        useOnDownloadStart: true,
        transparentBackground: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
        disableInputAccessoryView: true,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        InAppWebView(
          key: webViewKey,
          initialOptions: webViewOptions,
          initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
          onProgressChanged: (controller, progress) {
            setState(() {
              this.progress = progress / 100;
            });
          },
          iosOnWebContentProcessDidTerminate: (controller) {
            controller.reload();
          },
        ),
        Center(
          child: progress < 1.0
              ? const CircularProgressIndicator(
                  strokeWidth: 6.0, color: Color(0xff1D77FF))
              : const SizedBox(),
        ),
      ]), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

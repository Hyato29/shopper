import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';

HeadlessInAppWebView? headlessWebView;

class MyHeadlessWebView extends HeadlessInAppWebView {
  MyHeadlessWebView({
    required this.url,
    required this.onLoadStopped,
  }) : super(
          initialUrlRequest: URLRequest(url: WebUri(url)),
          initialOptions: InAppWebViewGroupOptions(
            crossPlatform: InAppWebViewOptions(
              userAgent:
                  'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36',
            ),
          ),
        );
  final String url;

  final Function(String) onLoadStopped;

  @override
  void Function(InAppWebViewController controller)? get onWebViewCreated =>
      (controller) {};

  @override
  void Function(
          InAppWebViewController controller, ConsoleMessage consoleMessage)?
      get onConsoleMessage => (controller, consoleMessage) {};

  @override
  void Function(InAppWebViewController controller, Uri? url)? get onLoadStart =>
      (controller, url) {};

  @override
  void Function(InAppWebViewController controller, int progress)?
      get onProgressChanged => (controller, progress) {};

  @override
  void Function(InAppWebViewController controller, Uri? url)? get onLoadStop =>
      (controller, url) async {
        if (!(url?.path ?? '').contains('/search')) return;

        final html = await controller.injectJavascriptFileFromAsset(
          assetFilePath: 'assets/inner.js',
        );

        if (html == null) return;

        onLoadStopped(html as String);
      };

  @override
  void Function(InAppWebViewController controller, Uri? url, int code,
      String message)? get onLoadError => (controller, url, code, message) {};

  @override
  void Function(InAppWebViewController controller, Uri? url, int statusCode,
          String description)?
      get onLoadHttpError => (controller, url, statusCode, description) {};
}

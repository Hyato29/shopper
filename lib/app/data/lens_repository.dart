import 'dart:math';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:fskeleton/core.dart';
import 'package:html/parser.dart';

class LensRepository {
  LensRepository();

  static final provider = Provider<LensRepository>(
    (ref) {
      return LensRepository();
    },
  );

  HeadlessInAppWebView? _webView;

  Future<void> searchLensKeyword({
    required String fileUrl,
    required Function(String) onKeywordFound,
  }) async {
    InAppWebViewController? webViewController;
    final lensUrl = 'https://lens.google.com/uploadbyurl?url=$fileUrl';
    const userAgent =
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36';

    _webView = HeadlessInAppWebView(
      initialUrlRequest: URLRequest(url: WebUri(lensUrl)),
      initialOptions: InAppWebViewGroupOptions(
        crossPlatform: InAppWebViewOptions(userAgent: userAgent),
      ),
      onWebViewCreated: (controller) async {
        webViewController = controller;
      },
      onLoadStart: (controller, url) {},
      onUpdateVisitedHistory: (controller, url, androidIsReload) {},
      onLoadStop: (controller, url) async {
        final html = await webViewController?.injectJavascriptFileFromAsset(
          assetFilePath: 'assets/inner.js',
        );

        if (html == null) return;

        var keywordFound = _detectFirstProductStringWithParser(html as String);
        if (keywordFound == null) {
          keywordFound ??= _detectRelatedSearchStringWithParser(html);

          if (keywordFound != null) {
            await Future.delayed(Duration(seconds: Random().nextInt(2) + 1));
            onKeywordFound(keywordFound);
            await _webView?.dispose();
          }
        } else {
          onKeywordFound(keywordFound);
          // await _webView?.dispose();
        }
      },
    );

    await _webView?.run();
  }

  String? _detectFirstProductStringWithParser(String html) {
    try {
      final document = parse(html);
      final elements = document.getElementsByClassName('UAiK1e');
      if (elements.isNotEmpty) {
        final firstElement = elements.first.text;

        return firstElement;
      }

      return null;
    } catch (e) {
      return null;
    }
  }

  String? _detectRelatedSearchStringWithParser(String html) {
    try {
      final document = parse(html);
      final elements = document.getElementsByClassName('LzliJc');
      if (elements.isNotEmpty) {
        final firstElement = elements.first.text;

        return firstElement;
      }

      return null;
    } catch (e) {
      return null;
    }
  }
}

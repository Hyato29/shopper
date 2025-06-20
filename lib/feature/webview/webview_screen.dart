import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fskeleton/app/common/common_screen.dart';
import 'package:fskeleton/app/ui/buttons/button_size.dart';
import 'package:fskeleton/app/ui/buttons/my_primary_button.dart';
import 'package:fskeleton/app/ui/theme/my_colors.dart';
import 'package:fskeleton/core.dart';
import 'package:go_router/go_router.dart';
import 'package:html/parser.dart';

class WebViewScreen extends ConsumerStatefulWidget {
  const WebViewScreen({
    super.key,
    required this.image,
    required this.fileUrl,
    required this.onSuccessFetching,
  });

  final String image;
  final String fileUrl;
  final Function(String) onSuccessFetching;

  @override
  ConsumerState<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends ConsumerState<WebViewScreen> {
  InAppWebViewController? webViewController;
  bool isLoading = true;
  bool isFound = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            toolbarHeight: 90,
            title: const Text(
              'Searching by Image',
              style: TextStyle(color: MyColors.black),
            ),
            backgroundColor: MyColors.white,
            bottomOpacity: 0,
            leading: InkWell(
              onTap: () => context.pop(),
              child: const Icon(Icons.arrow_back, color: MyColors.black),
            ),
          ),
        ),
        backgroundColor: MyColors.bodyBackground,
        body: Stack(
          children: [
            _content(),
            Container(
              color: MyColors.bodyBackground.withOpacity(0.7),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: const SizedBox.shrink(),
            ),
            if (isLoading)
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: MyColors.bodyBackground.withOpacity(0.7),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: MyColors.yellowButton,
                    ),
                  ),
                ),
              ),
          ],
        ),
        bottomNavigationBar: ColoredBox(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: MyPrimaryButton(
              buttonSize: ButtonSize.medium,
              label: const Text('Reload'),
              onPressed: () {
                webViewController?.reload();
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _content() {
    return _lensWidget();
  }

  Widget _lensWidget() {
    final url = 'https://lens.google.com/uploadbyurl?url=${widget.fileUrl}';
    const userAgent =
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36';

    return InAppWebView(
      initialUrlRequest: URLRequest(url: WebUri(url)),
      initialOptions: InAppWebViewGroupOptions(
        crossPlatform: InAppWebViewOptions(userAgent: userAgent),
      ),
      onWebViewCreated: (controller) async {
        webViewController = controller;
      },
      onLoadStart: (controller, url) {
        setState(() {
          isLoading = true;
        });
      },
      onUpdateVisitedHistory: (controller, url, androidIsReload) {},
      onLoadStop: (controller, url) async {
        final html = await webViewController?.injectJavascriptFileFromAsset(
          assetFilePath: 'assets/inner.js',
        );

        var keywordFound = _detectFirstProductStringWithParser(html as String);
        if (keywordFound == null) {
          keywordFound ??= _detectRelatedSearchStringWithParser(html);

          if (keywordFound != null) {
            await keywordFounded(keywordFound);
          }
        } else {
          await keywordFounded(keywordFound);
        }
      },
    );
  }

  Future<void> keywordFounded(String keyword) async {
    if (isFound) return;
    isFound = true;
    await Future.delayed(Duration(seconds: Random().nextInt(2) + 1));
    widget.onSuccessFetching(keyword);

    setState(() {
      isLoading = false;
    });
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

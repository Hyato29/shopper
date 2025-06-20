import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:fskeleton/app/data/serpapi/model/shopping_response.dart';
import 'package:fskeleton/core.dart';
import 'package:html/parser.dart';

class ShoppingProduct {
  ShoppingProduct({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.source,
  });

  final String imageUrl;
  final String title;
  final String price;
  final String source;
}

class ShoppingRepository {
  ShoppingRepository();

  static final provider = Provider<ShoppingRepository>(
    (ref) {
      return ShoppingRepository();
    },
  );

  HeadlessInAppWebView? _webView;

  Future<void> shoppingResults({
    required String query,
    required Function(List<ShoppingResult>) onItemsFound,
  }) async {
    InAppWebViewController? webViewController;
    final shoppingUrl =
        Uri.encodeFull('https://www.google.com/search?tbm=shop&q=$query');
    const userAgent =
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36';

    _webView = HeadlessInAppWebView(
      initialUrlRequest: URLRequest(url: WebUri(shoppingUrl)),
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

        final document = parse(html as String);
        final docProducts = document.getElementsByClassName('i0X6df');
        final products = docProducts.map(
          (e) {
            final imageUrl = e
                    .getElementsByClassName('ArOc1c')
                    .first
                    .getElementsByTagName('img')
                    .first
                    .attributes['src'] ??
                '';
            final title = e.getElementsByClassName('tAxDx').first.text;
            final price = e.getElementsByClassName('OFFNJ').first.text;
            final source = e.getElementsByClassName('IuHnof').first.text;
            final productLink =
                e.getElementsByClassName('shntl').first.attributes['href'] ??
                    '';

            return ShoppingResult(
              title: title,
              link: productLink,
              thumbnail: imageUrl,
              source: source,
              price: price,
              productLink: productLink,
            );
          },
        ).toList();

        products.removeAt(0);

        onItemsFound(products);
        await _webView?.dispose();
      },
    );

    await _webView?.run();
  }
}

import 'dart:math';

import 'package:flutter/widgets.dart';

class TabletDetector {
  late final String? uselessInstanceVariable;

  static bool isTablet(MediaQueryData query) {
    final size = query.size;
    final diagonal =
        sqrt((size.width * size.width) + (size.height * size.height));

    return diagonal > 1100.0;
  }
}

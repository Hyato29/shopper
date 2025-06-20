import 'package:flutter/widgets.dart';

List<TextSpan> highlightOccurrences({
  required String source,
  required String query,
  required TextStyle highlightStyle,
  TextSpan? suffixTextSpan,
}) {
  if (query.isEmpty || !source.toLowerCase().contains(query.toLowerCase())) {
    return [TextSpan(text: source)];
  }
  final matches = query.toLowerCase().allMatches(source.toLowerCase());

  int lastMatchEnd = 0;

  final List<TextSpan> children = [];
  for (var i = 0; i < matches.length; i++) {
    final match = matches.elementAt(i);

    if (match.start != lastMatchEnd) {
      children.add(
        TextSpan(
          text: source.substring(lastMatchEnd, match.start),
        ),
      );
    }

    children.add(
      TextSpan(
        text: source.substring(match.start, match.end),
        style: highlightStyle,
      ),
    );

    if (i == matches.length - 1 && match.end != source.length) {
      children.add(
        TextSpan(
          text: source.substring(match.end, source.length),
        ),
      );
    }

    lastMatchEnd = match.end;
  }

  if (suffixTextSpan != null) {
    children.add(suffixTextSpan);
  }

  return children;
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageNetwork extends StatelessWidget {
  const ImageNetwork({required this.imageUrl, required this.imageSize});

  final String imageUrl;
  final double imageSize;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        height: imageSize,
        width: imageSize,
        fit: BoxFit.cover,
        placeholder: (context, url) => const SizedBox.shrink(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}

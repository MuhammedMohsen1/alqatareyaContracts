import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  CustomNetworkImage(
      {Key? key,
      required this.width,
      required this.height,
      required this.imageUrl,
      this.radius})
      : super(key: key);
  String imageUrl;
  final double width;
  final double height;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius ?? 0)),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) => Container(
          height: height,
          width: width,
          color: Colors.grey.withOpacity(.5),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        fadeInCurve: Curves.ease,
        fadeInDuration: const Duration(milliseconds: 300),
        fit: BoxFit.cover, // You can use BoxFit.fill, BoxFit.contain, etc.
        width: width,
        height: height,
      ),
    );
  }
}

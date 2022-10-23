import 'package:flutter/material.dart';
import 'package:progressive_image/progressive_image.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.placeholder,
    required this.thumbnail,
    required this.image,
    required this.width,
    required this.height,
    this.radius = BorderRadius.zero,
    this.fit = BoxFit.fill,
  });

  final String placeholder;
  final String thumbnail;
  final String image;
  final double width;
  final double height;
  final BoxFit fit;
  final BorderRadius radius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadius: radius,
      child: image != '' && Uri.tryParse(image)!.hasAbsolutePath
          ? ProgressiveImage.assetNetwork(
              placeholder: placeholder,
              thumbnail: thumbnail,
              image: image,
              width: width,
              height: height,
              fit: fit,
            )
          : Image.asset(
              placeholder,
              fit: fit,
              width: width,
              height: height,
            ),
    );
  }
}

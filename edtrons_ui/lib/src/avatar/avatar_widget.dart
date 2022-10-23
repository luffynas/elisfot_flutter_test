import 'package:edtrons_ui/src/image/image_widget.dart';
import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    super.key,
    this.width = 32.0,
    this.height = 32.0,
    this.radius = 100,
    this.url,
  });

  final double width;
  final double height;
  final String? url;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return EdtronsImageWidget(
      placeholder: 'assets/images/placeholder/ic_default_avatar.png',
      image: url ?? '',
      width: width,
      height: height,
      radius: BorderRadius.all(Radius.circular(radius)),
    );
  }
}

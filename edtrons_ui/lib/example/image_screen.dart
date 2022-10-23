import 'package:edtrons_ui/edtrons_ui.dart';
import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Image Screen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            Text('Sample Avatar'),
            AvatarWidget(
              radius: 8,
            ),
            AvatarWidget(
              radius: 8,
              width: 64,
              height: 64,
            ),
            AvatarWidget(
              radius: 100,
              width: 64,
              height: 64,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class PreferredCustomWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const PreferredCustomWidget({super.key, required this.child});

  final Widget child;

  @override
  Size get preferredSize => const Size.fromHeight(72);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

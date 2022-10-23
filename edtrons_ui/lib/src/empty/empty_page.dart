import 'package:edtrons_ui/edtrons_ui.dart';
import 'package:flutter/material.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({
    super.key,
    required this.title,
    required this.content,
    this.icon,
    this.image,
    this.textButton = 'Ulangi',
    this.onPressed,
  });

  final Icon? icon;
  final String? image;
  final String title;
  final String content;
  final String textButton;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          icon ??
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Image.asset(image!),
              ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, top: 16),
            child: Text(
              title,
              style: AppTypography.extraSmallMedium.copyWith(
                color: AppColors.gray,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              // "Yuk, cari dan jelajahi berbagai macam topik dan group pilihan",
              content,
              style: AppTypography.smallRegular.copyWith(
                color: AppColors.gray,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Visibility(
            visible: onPressed != null,
            child: FittedBox(
              child: EdtronsButton(
                minWidth: 150,
                title: textButton,
                // isFill: true,
                onPressed: onPressed,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

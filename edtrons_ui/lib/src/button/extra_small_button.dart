import 'package:edtrons_ui/edtrons_ui.dart';
import 'package:flutter/material.dart';

class ExtraSmallButton extends StatelessWidget {
  const ExtraSmallButton({
    super.key,
    this.onPressed,
    this.minWidth = 24,
    this.color,
    this.colorBorder,
    required this.title,
    this.prefixIcon,
    this.suffixIcon,
    this.toggle = WidgetToggle.active,
    this.backgroundColor,
  }) : super();

  final VoidCallback? onPressed;
  final double minWidth;
  final Color? color;
  final Color? colorBorder;
  final String title;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final WidgetToggle toggle;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return OutlinedButtonTheme(
      data: OutlinedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(
            (backgroundColor == null || backgroundColor == AppColors.white)
                ? AppColors.gray[700]!
                : AppColors.white,
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColors.gray.shade200;
            }
            return backgroundColor ?? AppColors.white[500]!;
          }),
          // overlayColor: MaterialStateProperty.all<Color>(Colors.red),
          // surfaceTintColor: MaterialStateProperty.all<Color>(Colors.red),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: MaterialStateProperty.all<Size>(Size(minWidth, 24)),
          textStyle: MaterialStateProperty.resolveWith<TextStyle>(
            (states) {
              if (states.contains(MaterialState.disabled)) {
                return AppTypography.extraSmallBold
                    .copyWith(color: AppColors.gray[200]);
              } else {
                return (AppTypography.extraSmallBold);
              }
              // return (AppTypography.extraSmallBold.copyWith(color: Colors.red));
            },
          ),
          side: MaterialStateProperty.all<BorderSide>(
            BorderSide(color: colorBorder ?? AppColors.gray[200]!),
          ),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(borderRadius: AppRadius.md),
          ),
        ),
      ),
      child: OutlinedButton(
        onPressed: null, //toggle == WidgetToggle.active ? onPressed : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              child: Container(
                padding: const EdgeInsets.only(right: 8),
                child: prefixIcon,
              ),
            ),
            Text(
              title,
            ),
            Visibility(
              child: Container(
                padding: const EdgeInsets.only(left: 8),
                child: prefixIcon,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

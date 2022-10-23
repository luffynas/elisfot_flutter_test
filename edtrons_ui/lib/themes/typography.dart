import 'package:edtrons_ui/themes/themes.dart';
import 'package:flutter/widgets.dart';

class AppTypography {
  static Widget textWidget({text, color, weight, size, aligment}) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontWeight: weight,
          fontSize: size,
          fontFamily: 'Montserrat',
          package: 'edtrons_ui'),
      textAlign: aligment,
    );
  }

  static TextStyle appBarTitle = TextStyle(
    fontSize: 18,
    color: AppColors.gray[700],
    fontWeight: FontWeight.w400,
    fontFamily: 'Montserrat',
    package: 'edtrons_ui',
  );

  // re-format Typoghrapy
  static TextStyle heading1 = TextStyle(
    fontSize: 56,
    fontWeight: FontWeight.w700,
    color: AppColors.gray[700],
    fontFamily: 'Montserrat',
    package: 'edtrons_ui',
  );

  static TextStyle heading2 = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w700,
    color: AppColors.gray[700],
    fontFamily: 'Montserrat',
    package: 'edtrons_ui',
  );

  static TextStyle heading3 = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w600,
    color: AppColors.gray[700],
    fontFamily: 'Montserrat',
    package: 'edtrons_ui',
  );

  static TextStyle heading4 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: AppColors.gray[700],
    fontFamily: 'Montserrat',
    package: 'edtrons_ui',
  );

  static TextStyle heading5 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.gray[700],
    fontFamily: 'Montserrat',
    package: 'edtrons_ui',
  );

  static TextStyle heading6 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.gray[700],
    fontFamily: 'Montserrat',
    package: 'edtrons_ui',
  );

  static TextStyle largeRegular = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: AppColors.gray[700],
    fontFamily: 'Montserrat',
    package: 'edtrons_ui',
  );

  static TextStyle largeBold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.gray[700],
    fontFamily: 'Montserrat',
    package: 'edtrons_ui',
  );

  static TextStyle mediumRegular = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.gray[700],
    fontFamily: 'Montserrat',
    package: 'edtrons_ui',
  );

  static TextStyle mediumMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.gray[700],
    fontFamily: 'Montserrat',
    package: 'edtrons_ui',
  );

  static TextStyle mediumBold = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.gray[700],
    fontFamily: 'Montserrat',
    package: 'edtrons_ui',
  );

  static TextStyle normalRegular = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.gray[700],
    fontFamily: 'Montserrat',
    package: 'edtrons_ui',
  );

  static TextStyle normalMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.gray[700],
    fontFamily: 'Montserrat',
    package: 'edtrons_ui',
  );

  static TextStyle normalBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.gray[700],
    fontFamily: 'Montserrat',
    package: 'edtrons_ui',
  );

  static TextStyle smallRegular = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.gray[700],
    fontFamily: 'Montserrat',
    package: 'edtrons_ui',
  );

  static TextStyle smallMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.gray[700],
    fontFamily: 'Montserrat',
    package: 'edtrons_ui',
  );

  static TextStyle smallSemiBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.gray[700],
    fontFamily: 'Montserrat',
    package: 'edtrons_ui',
  );

  static TextStyle smallBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.gray[700],
    fontFamily: 'Montserrat',
    package: 'edtrons_ui',
  );

  static TextStyle extraSmallRegular = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.gray[700],
    fontFamily: 'Montserrat',
    package: 'edtrons_ui',
  );

  static TextStyle extraSmallMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.gray[700],
    fontFamily: 'Montserrat',
    package: 'edtrons_ui',
  );

  static TextStyle extraSmallBold = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColors.gray[700],
    fontFamily: 'Montserrat',
    package: 'edtrons_ui',
  );
}

import 'package:edtrons_ui/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

export 'app_icons.dart';
export 'colors.dart';
export 'typography.dart';

ThemeData themeLight() {
  return ThemeData.light(useMaterial3: true).copyWith(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors.gray[200],
      primary: AppColors.gray[700],
    ),
    backgroundColor: AppColors.gray[50],
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      actionsIconTheme: IconThemeData(color: AppColors.gray[700]),
      iconTheme: IconThemeData(color: AppColors.gray[700]),
      titleTextStyle: AppTypography.normalRegular,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColors.bluePrimary,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: Colors.white,
    ),
    primaryTextTheme: TextTheme(
      button: TextStyle(
        color: AppColors.gray[200],
      ),
    ),
    // tabBarTheme: const TabBarTheme(
    //   labelColor: AppColors.tabSelected,
    //   unselectedLabelColor: AppColors.tabUnSelected,
    // ),
    // checkboxTheme: const CheckboxThemeData(
    //   side: BorderSide(color: AppColors.checkboxPrimary),
    // ),
  );
}

ThemeData themeDark() {
  return ThemeData.dark();
}

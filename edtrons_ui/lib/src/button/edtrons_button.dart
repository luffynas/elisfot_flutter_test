import 'package:edtrons_ui/src/button/extra_small_button.dart';
import 'package:edtrons_ui/src/button/large_button.dart';
import 'package:edtrons_ui/src/button/medium_button.dart';
import 'package:edtrons_ui/src/button/small_button.dart';
import 'package:edtrons_ui/src/widget_toggle.dart';
import 'package:edtrons_ui/src/widget_type.dart';
import 'package:flutter/material.dart';

class EdtronsButton extends StatelessWidget {
  const EdtronsButton({
    super.key,
    this.widgetType = WidgetType.md,
    this.onPressed,
    this.minWidth,
    this.color,
    this.colorBorder,
    this.backgroundColor,
    required this.title,
    this.prefixIcon,
    this.suffixIcon,
    this.toggle = WidgetToggle.active,
  });

  final WidgetType widgetType;
  final VoidCallback? onPressed;
  final double? minWidth;
  final Color? color;
  final Color? colorBorder;
  final Color? backgroundColor;
  final String title;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final WidgetToggle toggle;

  @override
  Widget build(BuildContext context) {
    switch (widgetType) {
      case WidgetType.xs:
        return ExtraSmallButton(
          key: key,
          title: title,
          color: color,
          colorBorder: colorBorder,
          backgroundColor: backgroundColor,
          minWidth: minWidth ?? 16,
          onPressed: onPressed,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          toggle: toggle,
        );
      case WidgetType.sm:
        return SmallButton(
          key: key,
          title: title,
          color: color,
          colorBorder: colorBorder,
          backgroundColor: backgroundColor,
          minWidth: minWidth ?? 22,
          onPressed: onPressed,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          toggle: toggle,
        );
      case WidgetType.md:
        return MediumButton(
          key: key,
          title: title,
          color: color,
          colorBorder: colorBorder,
          backgroundColor: backgroundColor,
          minWidth: minWidth ?? 24,
          onPressed: onPressed,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          toggle: toggle,
        );
      case WidgetType.lg:
        return LargeButton(
          key: key,
          title: title,
          color: color,
          colorBorder: colorBorder,
          backgroundColor: backgroundColor,
          minWidth: minWidth ?? 32,
          onPressed: onPressed,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          toggle: toggle,
        );
    }
  }
}

import 'package:flutter/widgets.dart';

class MenuItemApp {
  MenuItemApp({
    required this.title,
    required this.slug,
    this.description,
    this.menuIcon,
    this.righIcon,
    this.isActive = false,
    this.valueRadio,
  });

  factory MenuItemApp.empty() {
    return MenuItemApp(title: 'title', slug: 'slug');
  }

  final String title;
  final String slug;
  final String? description;
  final Widget? menuIcon;
  final Widget? righIcon;
  bool isActive;
  final int? valueRadio;
}

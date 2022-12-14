import 'package:flutter/material.dart';

class TabModel {
  TabModel({
    required this.title,
    this.icon,
    required this.isActive,
  });
  final String title;
  final IconData? icon;
  bool isActive;
}

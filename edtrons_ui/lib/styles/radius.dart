import 'package:flutter/widgets.dart';

abstract class AppRadius {
  static BorderRadius none = const BorderRadius.all(
    Radius.circular(0),
  );

  static BorderRadius sm = const BorderRadius.all(
    Radius.circular(2),
  );

  static BorderRadius base = const BorderRadius.all(
    Radius.circular(4),
  );

  static BorderRadius md = const BorderRadius.all(
    Radius.circular(6),
  );

  static BorderRadius lg = const BorderRadius.all(
    Radius.circular(8),
  );

  static BorderRadius xl = const BorderRadius.all(
    Radius.circular(12),
  );

  static BorderRadius xxl = const BorderRadius.all(
    Radius.circular(16),
  );

  static BorderRadius xxxl = const BorderRadius.all(
    Radius.circular(24),
  );

  static BorderRadius full = const BorderRadius.all(
    Radius.circular(9999),
  );
}

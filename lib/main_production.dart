import 'package:device_preview/device_preview.dart';
import 'package:elisoft_flutter_test/app.dart';
import 'package:elisoft_flutter_test/bootstrap.dart';
import 'package:flutter/foundation.dart';

void main() {
  bootstrap(
    () => DevicePreview(
      enabled: !kReleaseMode,
      builder: (ctx) => App(),
    ),
  );
}

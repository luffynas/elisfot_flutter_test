import 'dart:math';

String getRandString(int len) {
  const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final random = Random.secure();
  return String.fromCharCodes(
    Iterable.generate(
      len,
      (_) => _chars.codeUnitAt(random.nextInt(_chars.length)),
    ),
  );
}

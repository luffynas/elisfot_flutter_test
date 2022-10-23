import 'package:intl/intl.dart';

class TimeFormatter {
  static String dateFormat(String? date) {
    final dateFormat = DateFormat('HH:mm:SS');
    final dateTime = dateFormat.parse(date!, true);
    final timeResultFormat = DateFormat('HH.mm').format(dateTime);

    return timeResultFormat;
  }
}

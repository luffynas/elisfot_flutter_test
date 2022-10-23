import 'package:intl/intl.dart';

String formatedYYYYMMDD(int timestamp) {
  if (timestamp == 0) {
    return "-";
  }
  var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  var formatter = DateFormat('yyyy-MM-dd', Intl.getCurrentLocale()); //.yMMMd();
  return formatter.format(date);
}

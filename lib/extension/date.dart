import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

extension DateExtension on DateTime {
  String toShort() {
    final currentDate = DateTime.now();
    if (year == currentDate.year &&
        month == currentDate.month &&
        day == currentDate.day) {
      return "Today";
    }
    final formatter = DateFormat('EEE, dd MMM');
    return formatter.format(this);
  }

  String toTimeAgo() {
    return timeago.format(this);
  }

  String toTimeString() {
    final formatter = DateFormat('HH:mm');
    return formatter.format(this);
  }

  String toDayMonth() {
    final formatter = DateFormat('dd MMM');
    return formatter.format(this);
  }

  String toCurrentMonth() {
    final formatter = DateFormat('MMMM yyyy');
    return formatter.format(this);
  }

  String toFullDateTime() {
    final formatter =
        DateFormat('EEEE, dd MMMM yyyy HH:mm', Intl.getCurrentLocale());
    return formatter.format(this);
  }

  DateTime toLocalDateTime({String format = 'yyyy-MM-dd HH:mm:ss'}) {
    final dateTime = DateFormat(format).parse(toString(), true);
    return dateTime.toLocal();
  }

  DateTime toLocalDateTimeEvent() {
    final dateTime =
        DateFormat('EEEE, dd MM yyyy HH:mm', Intl.getCurrentLocale())
            .parse(toString(), true);
    return dateTime.toLocal();
  }

  String toDefaultDatePadLeft() {
    final formatter = DateFormat('yyyy-M-d');
    final dateSplit = formatter.format(this).split('-');
    return '${dateSplit[0]}-${dateSplit[1].padLeft(2, '0')}-${dateSplit[2].padLeft(2, '0')}';
  }

  // String toSocialMediaTime(BuildContext context) {
  //   DateTime now = DateTime.now();
  //   DateTime justNow = now.subtract(Duration(minutes: 1));
  //   DateTime localDateTime = this.toLocalDateTime();

  //   final localizations = AppLocalizations.of(context);
  //   // String tag = localizations.locale.toLanguageTag();

  //   //Just now
  //   if (!localDateTime.difference(justNow).isNegative) {
  //     return localizations.counterAppBarTitle;
  //   }

  //   //Today
  //   var roughTimeString = DateFormat('jm', tag).format(localDateTime);
  //   //1-60 minutes time ago
  //   if (now.difference(localDateTime).inMinutes < 60) {
  //     var time = now.difference(localDateTime).inMinutes + 1;
  //     return "$time ${localizations.localeName}";
  //   }

  //   //1-24 hours time ago
  //   if (now.difference(localDateTime).inHours < 24) {
  //     var time = now.difference(localDateTime).inHours + 1;
  //     return "$time ${localizations.translate('dateFormatter_one_seven_time_ago')}";
  //   }

  //   //0-6 days ago
  //   if (now.difference(localDateTime).inDays < 8) {
  //     var day = now.difference(localDateTime).inDays;
  //     return "$day ${localizations.translate('dateFormatter_one_seven_day_ago')}";
  //   }

  //   //grether then 7 days ago
  //   if (now.difference(localDateTime).inDays > 7) {
  //     String day = DateFormat('dd MMMM yyyy', tag).format(localDateTime);
  //     return "$day";
  //   }

  //   //Last couple of days
  //   if (now.difference(localDateTime).inDays < 4) {
  //     String weekday = DateFormat('EEEE').format(localDateTime);

  //     return '$weekday, $roughTimeString';
  //   }

  //   //Otherwise
  //   return '${DateFormat('yMd', tag).format(this)}, $roughTimeString';
  // }
}

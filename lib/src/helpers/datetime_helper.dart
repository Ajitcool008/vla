import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

String greeting() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Good Morning';
  }
  if (hour < 17) {
    return 'Good Afternoon';
  }
  return 'Good Evening';
}

class DateTimeHelper {
  static const String longFormat = "yyyy-MM-dd'T'HH:mm:ss";
  static const String longTimeFormat = "yyyy-MM-dd HH:mm:ssZ";
  static const String longFormatWithTZ = "yyyy-MM-dd'T'HH:mm:ss+0000";

  static String stringFromDate(DateTime dateTime, {String format = "dd MMM yyyy"}) {
    return DateFormat(format).format(dateTime);
  }

  static String dateForApi(DateTime dateTime, {String format = "yyyy-MM-dd"}) {
    return DateFormat(format).format(dateTime);
  }

  static String getPresentTimeString({String format = longFormat, bool local = false}) {
    return stringFromDate(local ? DateTime.now().toLocal() : DateTime.now().toUtc(),
        format: format);
  }

  static String changeStringDateFormat(String dateStr,
      {String inDateFormat = longTimeFormat, outDateFormat = "dd MMM hh:mm a"}) {
    DateTime inDate = dateFromString(dateStr, format: inDateFormat);
    return stringFromDate(inDate, format: outDateFormat);
  }

  static DateTime dateFromString(String dateString, {String format = "yyyy-MM-dd HH:mm:ssZ"}) {
    return DateFormat(format).parse(dateString);
  }

  static String getRelativeDisplayTime(String dateStr) {
    DateTime date = dateFromString(dateStr);
    DateTime date2 = DateTime.now().subtract(Duration(hours: 5, minutes: 30));

    var diff = date2.difference(date).inDays;
    if (diff > 1) {
      return DateTimeHelper.changeStringDateFormat(dateStr);
    } else if (diff == 1) {
      return "Yesterday";
    }

    return timeago.format(date, clock: date2);
  }
}

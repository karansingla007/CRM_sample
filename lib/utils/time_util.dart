import 'package:intl/intl.dart';

class TimeUtil {
  static int convertStringToEpochTime(String val) {
    var epochTimeStamp = DateTime.parse(val).toUtc().millisecondsSinceEpoch;
    return epochTimeStamp;
  }

  static DateTime getCurrentDateTime() {
    return DateTime.now();
  }

  static DateTime convertEpochToDateTime(int epochTimeStamp) {
    return DateTime.fromMillisecondsSinceEpoch(epochTimeStamp);
  }

  static String convertEpochToString(int epochTimeStamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(epochTimeStamp);
    DateTime now = DateTime.now();
    if (now.difference(dateTime).inDays == 1) {
      var format = DateFormat('HH:mm');
      return format.format(dateTime);
    } else {
      var format = DateFormat('dd-MM-yyyy');
      return format.format(dateTime);
    }
  }

  static String convertEpochToDateTimeString(int epochTimeStamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(epochTimeStamp);
    DateTime now = DateTime.now();
    var format = DateFormat('dd-MM-yyyy HH:mm');
    return format.format(dateTime);
  }

  static String getTimeDiff(int diffMilliSeconds) {
    Duration diff = Duration(milliseconds: diffMilliSeconds);
    String time = '';

    if (diff.inSeconds >= 0 && diff.inMinutes == 0) {
      time = '${diff.inSeconds} seconds';
    } else if (diff.inMinutes > 0 && diff.inHours == 0) {
      time = '${diff.inMinutes} minute';
    } else if (diff.inHours > 0 && diff.inDays == 0) {
      time = '${diff.inHours} hours';
    } else {
      if (diff.inDays == 1) {
        time = '${diff.inDays}Day';
      } else {
        time = '${diff.inDays}Days';
      }
    }
    return time;
  }
}

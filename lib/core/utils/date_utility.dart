import 'package:flutter/material.dart';
// import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:intl/intl.dart';

class DateUtility {
  DateUtility._();

  static String formatDate(DateTime? data, {bool useToday = true}) {
    if (data == null) return '';
    String time;
    DateTime now = DateTime.now();
    if (data.year == now.year &&
        data.month == now.month &&
        data.day == now.day &&
        useToday) {
      time = 'Hari ini ${dateToString(data, 'HH:mm')}';
    } else {
      time = dateToString(data, 'd MMM HH:mm');
    }
    return time;
  }

  static String dateToString(DateTime? time, String format) {
    if (time == null) return '-';

    var formatter = DateFormat(format, 'id');
    String formatted = formatter.format(time);
    return formatted;
  }

  static String formatTimeDifference(DateTime? dateTime) {
    if (dateTime == null) return '-';
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays >= 365) {
      final years = (difference.inDays / 365).floor();
      return '$years ${years == 1 ? 'year' : 'years'} ago';
    } else if (difference.inDays >= 30) {
      final months = (difference.inDays / 30).floor();
      return '$months ${months == 1 ? 'month' : 'months'} ago';
    } else if (difference.inDays >= 1) {
      return '${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago';
    } else if (difference.inHours >= 1) {
      return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
    } else if (difference.inMinutes >= 1) {
      return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago';
    } else {
      return 'Just now';
    }
  }

  static DateTime apiToDateTime(String data) {
    return DateTime.parse('$data+0000').toLocal();
  }

  static String dateTimeToApi(DateTime data) {
    return DateFormat('yyyy-MM-ddTHH:mm:ss').format(data.toUtc());
  }

  // static Future<DateTime?> pickDate(BuildContext context) async {
  //   return await DatePicker.showDatePicker(
  //     context,
  //     showTitleActions: true,
  //     locale: LocaleType.id,
  //     minTime: DateTime.now(),
  //     maxTime: DateTime(2027, 12, 31),
  //     onChanged: (date) {},
  //     onConfirm: (DateTime date) {
  //       return date;
  //     },
  //     currentTime: DateTime.now(),
  //   );
  // }
}

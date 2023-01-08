import 'package:intl/intl.dart';

class DateUtil {
  static String dateToString(DateTime createdAt) {
    Duration timeDiff = createdAt.difference(DateTime.now());

    if (timeDiff.inMinutes < 600) {
      return DateFormat('mm분전').format(createdAt);
    } else if (timeDiff.inDays > 0) {
      return DateFormat('MM/dd').format(createdAt);
    }

    return createdAt.toString();
  }
}

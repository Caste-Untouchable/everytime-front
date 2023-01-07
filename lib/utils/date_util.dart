import 'package:intl/intl.dart';

class DateUtil {
  static String boardTimeToString(DateTime createdAt) {
    Duration timeDiff = DateTime.now().difference(createdAt);

    createdAt = createdAt.add(const Duration(hours: 9));

    if (timeDiff.inMinutes < 60) {
      return '$timeDiff분전';
    } else if (timeDiff.inDays > 0) {
      return DateFormat('MM/dd').format(createdAt);
    } else {
      return DateFormat('HH:mm').format(createdAt);
    }
  }
}

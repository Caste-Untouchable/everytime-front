import 'package:intl/intl.dart';

class DateUtil {
  static String boardTimeToString(DateTime createdAt) {
    Duration timeDiff = DateTime.now().difference(createdAt);

    if (timeDiff.inMinutes < 60) {
      return '${timeDiff.inMinutes}분전';
    } else if (timeDiff.inDays > 0) {
      return DateFormat('MM/dd').format(createdAt);
    } else {
      return DateFormat('HH:mm').format(createdAt);
    }
  }
}

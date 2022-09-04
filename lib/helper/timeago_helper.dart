import 'package:intl/intl.dart';

class TimeagoHelper {
  static String convertToAgo(var input) {
    Duration diff;

    if (input == null || 'null' == input || '' == input) {
      diff = DateTime.now().difference(DateTime.now());
    } else {
      diff = DateTime.now().difference(DateTime.parse(input));
    }

    if (diff.inDays >= 1) {
      return '${diff.inDays} day${diff.inDays > 1 ? 's' : ''} ago';
    } else if (diff.inDays >= 7) {
      return 'one week ago';
    } else if (diff.inDays >= 8) {
      return DateFormat("MM/dd/yy h:mm a")
          .format(DateTime.parse(input))
          .toString();
    } else if (diff.inHours >= 1) {
      return '${diff.inHours} hour${diff.inHours > 1 ? 's' : ''} ago';
    } else if (diff.inMinutes >= 1) {
      return '${diff.inMinutes} minute${diff.inMinutes > 1 ? 's' : ''} ago';
    } else if (diff.inSeconds >= 1) {
      return '${diff.inSeconds} second${diff.inSeconds > 1 ? 's' : ''} ago';
    } else {
      return 'just now';
    }
  }
}

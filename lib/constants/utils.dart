import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class Utils {
  static String dateFormatter(DateTime? date) {
    if (date != null) {
      var f = DateFormat('h:mm a, MM/dd/y');
      return f.format(date);
    } else {
      return '';
    }
  }

  static String getUID() {
    return const Uuid().v4();
  }
}

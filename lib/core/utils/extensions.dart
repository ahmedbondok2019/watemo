import 'package:intl/intl.dart';

extension IntExtensions on int {
  String get getDurationReminder {
    if (toString().length == 1) {
      return '0$this';
    } else {
      return '$this';
    }
  }
}

extension DateTimeExtensions on DateTime? {
  String get appDateFormat {
    if (this == null) {
      return '';
    }

    return DateFormat('d/M/y', 'en').format(this!);
  }
}

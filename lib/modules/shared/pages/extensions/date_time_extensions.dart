import 'package:intl/intl.dart';

extension DateExt on DateTime {
  String toDateString() {
    if (day == DateTime.now().day) {
      return 'Hoje';
    } else if (day == (DateTime.now().day - 1)) {
      return 'Ontem';
    } else {
      return DateFormat('dd/MM/yyyy').format(this);
    }
  }
}

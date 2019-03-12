import 'package:intl/intl.dart';

String getCurrentWeekendString() {
  DateTime today = DateTime.now();
  var date = DateFormat('yyyy-MM-dd HH:mm:ss.SSS').parse(today.subtract(
      Duration(days: today.weekday)).add(Duration(days: 7)).toString());
  return DateFormat('yyyy-MM-dd').format(date);
}
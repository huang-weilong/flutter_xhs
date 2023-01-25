import 'package:intl/intl.dart';

class SDateUtils {
  SDateUtils._internal();
  factory SDateUtils() => _instance;
  static final SDateUtils _instance = SDateUtils._internal();

  /// 传入时间字符串2022-12-21T07:30:00
  static String formatDate(String? date, {String pattern = "yyyy-MM-dd"}) {
    date ??= DateTime.now().toString();
    DateTime dateTime = DateTime.tryParse(date)!;
    // NumberFormat nf = NumberFormat("00");
    // print(nf.format(12));
    return DateFormat(pattern).format(dateTime);
  }

  static String formatDateByInt(int millisecondsSinceEpoch, {String pattern = "yyyy-MM-dd HH:mm"}) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch, isUtc: true);

    return DateFormat(pattern).format(dateTime);
  }
}

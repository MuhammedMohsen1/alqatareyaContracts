import 'package:intl/intl.dart' as intl;

String? formateDate(DateTime? date) {
  if (date == null) {
    return null;
  }
  return intl.DateFormat('dd/MM/yyyy').format(date);
}

String? formatDayinArab(DateTime? date) {
  if (date == null) {
    return null;
  }

  // Format the date with day name in Arabic
  final englishFormat = intl.DateFormat('EEEE').format(date);

  /// e.g Thursday;

  return convertDayToArabic(englishFormat);
}

Map<String, String> _englishToArabicDays = {
  'Monday': 'الاثنين',
  'Tuesday': 'الثلاثاء',
  'Wednesday': 'الأربعاء',
  'Thursday': 'الخميس',
  'Friday': 'الجمعة',
  'Saturday': 'السبت',
  'Sunday': 'الأحد',
};

String? convertDayToArabic(String? englishDay) {
  if (englishDay == null) {
    return null;
  }
  return _englishToArabicDays[englishDay];
}

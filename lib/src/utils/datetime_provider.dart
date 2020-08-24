// Package imports:
import 'package:intl/intl.dart';

final dateTimeProvider = new DateTimeProvider();

class DateTimeProvider {
  formatearDateTime(dateTimeAFormatear, tipoFormato, pattern) {
    var parsedDate = DateTime.parse(dateTimeAFormatear);

    var fechaFormateada =
        new DateFormat('$tipoFormato').addPattern(pattern).format(parsedDate);

    return fechaFormateada;
  }

  convertTimestampToDate(timestamp) {
    var date = new DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

    return date;
  }

  getFinalDateTime(timeStamp, timeZoneSeconds) {
    var finalDate = convertTimestampToDate(timeStamp);

    var formattedDate =
        formatearDateTime(finalDate.toIso8601String(), 'Hm', null);

    return formattedDate;
  }
}

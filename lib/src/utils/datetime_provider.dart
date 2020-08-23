// Package imports:
import 'package:intl/intl.dart';

final dateTimeProvider = new DateTimeProvider();

class DateTimeProvider {
  formatearDateTime(dateTimeAFormatear, tipoFormato, pattern) {
    var parsedDate = DateTime.parse(dateTimeAFormatear);

    var fechaFormateada =
        new DateFormat('$tipoFormato').addPattern(pattern).format(parsedDate);

    print(fechaFormateada);

    return fechaFormateada;
  }
}

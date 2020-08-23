import 'package:weather_app/src/utils/datetime_provider.dart';

final weatherStatsService = new WeatherStatsService();

class WeatherStatsService {
  convertMetersToKm(double visibility) {
    var visibilityKm = (visibility / 100).round();

    return visibilityKm;
  }

  convertTimestampToDate(timestamp) {
    var date = new DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

    return date;
  }

  getFinalDateTime(timeStamp, timeZoneSeconds) {
    var timestamptWithGMT = timeStamp + timeZoneSeconds;

    var finalDate = convertTimestampToDate(timestamptWithGMT);

    var formattedDate = dateTimeProvider.formatearDateTime(
        finalDate.toIso8601String(), 'Hm', null);

    return formattedDate;
  }
}

// Project imports:
import 'package:weather_app/src/utils/datetime_provider.dart';

final weatherStatsService = new WeatherStatsService();

class WeatherStatsService {
  convertMetersToKm(double mts) {
    var km = (mts / 100).round();

    return km;
  }
}

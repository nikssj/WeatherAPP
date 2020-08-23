import 'package:flutter/material.dart';
import 'package:weather_app/helpers/APIHelper.dart';
import 'package:weather_app/helpers/Constants.dart';
import 'package:weather_app/models/WeatherResponse_model.dart';

final weatherProvider = new WeatherProvider();

ApiBaseHelper _helper = ApiBaseHelper();

class WeatherProvider {
  Future<WeatherResponse> obtenerClima(BuildContext context, location) async {
    var q = location;

    print(q);
    final response = await _helper.get(
        APIURL + 'weather?q=$q&appid=$WEATHER_API&units=metric', context);

    var weatherResponse;

    if (response != null) {
      weatherResponse = WeatherResponse.fromJson(response);
    }

    return weatherResponse;
  }
}

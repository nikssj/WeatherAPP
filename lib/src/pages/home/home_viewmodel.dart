import 'package:flutter/material.dart';
import 'package:weather_app/helpers/BaseModel.dart';
import 'package:weather_app/models/WeatherResponse_model.dart';
import 'package:weather_app/src/providers/weather_provider.dart';
import 'package:weather_app/src/widgets/Snackbars/Snackbars_functions.dart';

class HomeViewModel extends BaseModel {
  WeatherResponse _weatherData;

  WeatherResponse get weatherData => _weatherData;

  set setWeatherData(WeatherResponse data) {
    _weatherData = data;
  }

  String _location;

  String get location => _location;

  set setLocation(String value) {
    _location = value;
  }

  Widget _widgetInfo;

  Widget get widgetInfo => _widgetInfo;

  set setWidgetInfo(Widget widget) {
    _widgetInfo = widget;
    notifyListeners();
  }

  var _selectedStat = 'TempStat';

  get selectedStat => _selectedStat;

  set setSelectedStat(value) {
    _selectedStat = value;
  }

  Future fetchWeather(BuildContext context) async {
    setState(ViewState.Busy);

    final response = await weatherProvider.obtenerClima(context, location);

    if (response != null) {
      setWeatherData = response;
    }

    setState(ViewState.Idle);
  }

  //Cargar pagina
  Future cargarPagina(BuildContext context) async {
    setState(ViewState.Busy);

    setPaginaCargada(false);

    final response = await weatherProvider.obtenerClima(context, 'Miami');

    setWeatherData = response;

    setPaginaCargada(true);

    setState(ViewState.Idle);
  }
}

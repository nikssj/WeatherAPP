import 'package:flutter/material.dart';
import 'package:weather_app/helpers/BaseModel.dart';
import 'package:weather_app/models/WeatherResponse_model.dart';
import 'package:weather_app/src/providers/weather_provider.dart';

class HomeViewModel extends BaseModel {
  //Reporte diario
  WeatherResponse _weatherData;

  WeatherResponse get weatherData => _weatherData;

  set setWeatherData(WeatherResponse data) {
    _weatherData = data;
  }

  Widget _widgetInfo;

  Widget get widgetInfo => _widgetInfo;

  set setWidgetInfo(Widget widget) {
    _widgetInfo = widget;
    notifyListeners();
  }

  //Cargar pagina
  Future cargarPagina(BuildContext context) async {
    setState(ViewState.Busy);

    setPaginaCargada(false);

    final response = await weatherProvider.obtenerClima(context, 'Yerba Buena');

    setWeatherData = response;

    setPaginaCargada(true);

    setState(ViewState.Idle);
  }
}

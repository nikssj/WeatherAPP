// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:weather_app/src/pages/home/home_viewmodel.dart';
import 'package:weather_app/src/pages/home/services/WeatherStats_service.dart';
import 'package:weather_app/src/widgets/SizedText.dart';
import 'Css/StatsCss.dart';

class ExtraStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    final _tamanoTexto = _size.height * 0.027;

    final _homeVm = Provider.of<HomeViewModel>(context, listen: true);

    final _tamanoIcon = _size.height * 0.025;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              FaIcon(
                FontAwesomeIcons.solidEye,
                color: Colors.grey[400],
                size: _tamanoIcon,
              ),
              SizedBox(
                width: _size.width * 0.012,
              ),
              SizedText(
                height: _tamanoTexto,
                child: Text(
                  'Visibility: ' +
                      weatherStatsService
                          .convertMetersToKm(
                              _homeVm.weatherData.visibility.toDouble())
                          .toString() +
                      ' k/m',
                  style: StatsCss(color: Colors.white).textProperties,
                  textAlign: TextAlign.center,
                ),
              ),
            ]),
            SizedBox(height: _size.height * 0.02),
            Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.cloud,
                  color: Colors.grey[400],
                  size: _tamanoIcon,
                ),
                SizedBox(
                  width: _size.width * 0.012,
                ),
                SizedText(
                  height: _tamanoTexto,
                  child: Text(
                    'Clouds: ' +
                        _homeVm.weatherData.clouds.all.toString() +
                        '%',
                    style: StatsCss(color: Colors.white).textProperties,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              FaIcon(
                FontAwesomeIcons.wind,
                color: Colors.grey[400],
                size: _tamanoIcon,
              ),
              SizedBox(
                width: _size.width * 0.012,
              ),
              SizedText(
                height: _tamanoTexto,
                child: Text(
                  'Wind: ' + _homeVm.weatherData.wind.speed.toString() + ' k/m',
                  style: StatsCss(color: Colors.white).textProperties,
                  textAlign: TextAlign.center,
                ),
              ),
            ]),
            SizedBox(height: _size.height * 0.02),
            Row(children: [
              FaIcon(
                FontAwesomeIcons.weight,
                color: Colors.grey[400],
                size: _tamanoIcon,
              ),
              SizedBox(
                width: _size.width * 0.012,
              ),
              SizedText(
                height: _tamanoTexto,
                child: Text(
                  'Pressure: ' + _homeVm.weatherData.main.pressure.toString(),
                  style: StatsCss(color: Colors.white).textProperties,
                  textAlign: TextAlign.center,
                ),
              )
            ]),
          ],
        ),
      ],
    );
  }
}

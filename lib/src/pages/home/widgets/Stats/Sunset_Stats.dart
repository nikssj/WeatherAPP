import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/src/pages/home/services/WeatherStats_service.dart';
import 'package:weather_app/src/widgets/SizedText.dart';

import '../../home_viewmodel.dart';

class SunsetStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    final _tamanoTexto = _size.height * 0.027;

    final _homeVm = Provider.of<HomeViewModel>(context, listen: true);

    final _tamanoIcon = _size.height * 0.025;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(children: [
          FaIcon(
            FontAwesomeIcons.solidSun,
            color: Colors.grey[400],
            size: _tamanoIcon,
          ),
          SizedBox(
            width: _size.width * 0.012,
          ),
          SizedText(
            height: _tamanoTexto,
            child: Text(
              'Sunrise: ' +
                  (weatherStatsService.getFinalDateTime(
                      _homeVm.weatherData.sys.sunrise,
                      _homeVm.weatherData.timezone)),
              style: GoogleFonts.montserrat(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ]),
        SizedBox(height: _size.height * 0.02),
        Row(
          children: [
            FaIcon(
              FontAwesomeIcons.cloudSun,
              color: Colors.grey[400],
              size: _tamanoIcon,
            ),
            SizedBox(
              width: _size.width * 0.012,
            ),
            SizedText(
              height: _tamanoTexto,
              child: Text(
                'Sunset: ' +
                    (weatherStatsService.getFinalDateTime(
                        _homeVm.weatherData.sys.sunset,
                        _homeVm.weatherData.timezone)),
                style: GoogleFonts.montserrat(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

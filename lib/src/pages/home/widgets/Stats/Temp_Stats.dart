import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/src/pages/home/home_viewmodel.dart';
import 'package:weather_app/src/widgets/SizedText.dart';

class TemperatureStats extends StatelessWidget {
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
                FontAwesomeIcons.thermometerEmpty,
                color: Colors.grey[400],
                size: _tamanoIcon,
              ),
              SizedBox(
                width: _size.width * 0.012,
              ),
              SizedText(
                height: _tamanoTexto,
                child: Text(
                  'Min: ' + _homeVm.weatherData.main.tempMin.toString() + '°',
                  style: GoogleFonts.montserrat(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ]),
            SizedBox(height: _size.height * 0.02),
            Row(children: [
              FaIcon(
                FontAwesomeIcons.thermometerFull,
                color: Colors.grey[400],
                size: _tamanoIcon,
              ),
              SizedBox(
                width: _size.width * 0.012,
              ),
              SizedText(
                height: _tamanoTexto,
                child: Text(
                  'Max: ' + _homeVm.weatherData.main.tempMax.toString() + '°',
                  style: GoogleFonts.montserrat(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ]),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              FaIcon(
                FontAwesomeIcons.water,
                color: Colors.grey[400],
                size: _tamanoIcon,
              ),
              SizedBox(
                width: _size.width * 0.012,
              ),
              SizedText(
                height: _tamanoTexto,
                child: Text(
                  'Humidity: ' + _homeVm.weatherData.main.temp.toString() + '%',
                  style: GoogleFonts.montserrat(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ]),
            SizedBox(height: _size.height * 0.02),
            Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.smog,
                  color: Colors.grey[400],
                  size: _tamanoIcon,
                ),
                SizedBox(
                  width: _size.width * 0.012,
                ),
                SizedText(
                  height: _tamanoTexto,
                  child: Text(
                    'Feels like: ' +
                        _homeVm.weatherData.main.feelsLike.toString() +
                        '°',
                    style: GoogleFonts.montserrat(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

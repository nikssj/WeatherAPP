// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:weather_app/src/pages/home/home_viewmodel.dart';
import 'package:weather_app/src/widgets/SizedText.dart';

class WeatherMainInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    final _homeVm = Provider.of<HomeViewModel>(context, listen: false);

    return Column(
      children: [
        //Location Name
        Text(
          _homeVm.weatherData.name + ', ' + _homeVm.weatherData.sys.country,
          style: GoogleFonts.montserrat(color: Colors.white, fontSize: 30),
          textAlign: TextAlign.center,
        ),

        //Location Temp
        Padding(
          padding: EdgeInsets.only(left: _size.width * 0.05),
          child: SizedText(
            height: _size.height * 0.1,
            child: Text(
              _homeVm.weatherData.main.temp.toString() + '°',
              style: GoogleFonts.montserrat(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),

        //Location Weather
        SizedText(
          height: _size.height * 0.045,
          child: Text(
            '~ ' + _homeVm.weatherData.weather[0].description + ' ~',
            style: GoogleFonts.montserrat(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

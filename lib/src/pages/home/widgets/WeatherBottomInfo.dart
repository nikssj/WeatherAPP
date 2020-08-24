// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:weather_app/src/pages/home/home_viewmodel.dart';
import 'package:weather_app/src/pages/home/widgets/Stats/Extra_stats.dart';
import 'package:weather_app/src/pages/home/widgets/Stats/Sunset_Stats.dart';
import 'package:weather_app/src/pages/home/widgets/Stats/Temp_Stats.dart';
import 'package:weather_app/src/widgets/SizedText.dart';

class WeatherInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    Widget widgetSeteado = FadeInUp(child: TemperatureStats());

    final _homeVm = Provider.of<HomeViewModel>(context, listen: true);

    return SizedBox(
      height: _size.height * 0.22,
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: _size.width * 0.05),
                child: SizedText(
                    height: _size.height * 0.03,
                    child: Text(
                      'Monday',
                      style: GoogleFonts.montserrat(color: Colors.white),
                      textAlign: TextAlign.center,
                    )),
              ),
              Padding(
                  padding: EdgeInsets.only(right: _size.width * 0.05),
                  child: _buildIcons(context))
            ],
          ),
          Divider(
            color: Colors.grey[300],
            endIndent: _size.width * 0.045,
            indent: _size.width * 0.045,
          ),
          Spacer(),
          _homeVm.widgetInfo == null ? widgetSeteado : _homeVm.widgetInfo,
          Spacer()
        ],
      ),
    );
  }

  Widget _buildIcons(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    final _homeVm = Provider.of<HomeViewModel>(context, listen: true);

    final _selectedColor = Colors.white70;

    final _notSelectedColor = Colors.grey[700];

    return Row(
      children: [
        IconButton(
            icon: FaIcon(
              FontAwesomeIcons.temperatureHigh,
              color: _homeVm.selectedStat == 'TempStat'
                  ? _selectedColor
                  : _notSelectedColor,
            ),
            onPressed: () {
              _homeVm.setSelectedStat = 'TempStat';
              _homeVm.setWidgetInfo = TemperatureStats();
            }),
        SizedBox(width: _size.width * 0.015),
        IconButton(
            icon: FaIcon(
              FontAwesomeIcons.sun,
              color: _homeVm.selectedStat == 'SunsetStats'
                  ? _selectedColor
                  : _notSelectedColor,
            ),
            onPressed: () {
              _homeVm.setSelectedStat = 'SunsetStats';
              _homeVm.setWidgetInfo = SunsetStats();
            }),
        SizedBox(
          width: _size.width * 0.015,
        ),
        IconButton(
          onPressed: () {
            _homeVm.setSelectedStat = 'CloudStats';
            _homeVm.setWidgetInfo = ExtraStats();
          },
          icon: FaIcon(
            FontAwesomeIcons.cloudSunRain,
            color: _homeVm.selectedStat == 'CloudStats'
                ? _selectedColor
                : _notSelectedColor,
          ),
        ),
      ],
    );
  }
}

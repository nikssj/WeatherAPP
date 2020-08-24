// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:animate_do/animate_do.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:weather_app/src/pages/home/home_viewmodel.dart';
import 'package:weather_app/src/pages/home/widgets/WeatherBottomInfo.dart';
import 'package:weather_app/src/pages/home/widgets/WeatherImage.dart';
import 'package:weather_app/src/pages/home/widgets/WeatherMainInfo.dart';
import 'package:weather_app/src/widgets/CustomWidgets/Custom_SearchBar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeViewModel>(context, listen: false).cargarPagina(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    final _homeVm = Provider.of<HomeViewModel>(context, listen: true);

    return WeatherImage(
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomInset: false,
            resizeToAvoidBottomPadding: false,
            body: Container(
              width: double.infinity,
              child: _homeVm.paginaCargada
                  ? Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CustomSearchBar(),
                        SizedBox(height: _size.height * 0.05),
                        FadeIn(
                          child: _buildWeatherMainInfo(),
                          duration: Duration(milliseconds: 500),
                        ),
                        Spacer(),
                        _buildWeatherInfo(context)
                      ],
                    )
                  : Center(child: CircularProgressIndicator()),
            )),
      ),
    );
  }

  WeatherMainInfo _buildWeatherMainInfo() {
    return WeatherMainInfo();
  }

  Widget _buildWeatherInfo(BuildContext context) {
    return WeatherInfo();
  }
}

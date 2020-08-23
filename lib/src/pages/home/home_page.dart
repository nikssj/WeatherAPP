import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/src/pages/home/home_viewmodel.dart';
import 'package:weather_app/src/pages/home/widgets/WeatherImage.dart';
import 'package:weather_app/src/pages/home/widgets/WeatherBottomInfo.dart';
import 'package:weather_app/src/pages/home/widgets/WeatherMainInfo.dart';

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
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            width: double.infinity,
            child: _homeVm.paginaCargada
                ? Column(
                    children: [
                      SizedBox(
                        height: _size.height * 0.16,
                      ),
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
    );
  }

  WeatherMainInfo _buildWeatherMainInfo() {
    return WeatherMainInfo();
  }

  Widget _buildWeatherInfo(BuildContext context) {
    return WeatherInfo();
  }
}

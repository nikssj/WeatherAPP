import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';
import 'package:getwidget/components/button/gf_icon_button.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/src/pages/home/home_viewmodel.dart';
import 'package:weather_app/src/pages/home/widgets/WeatherImage.dart';
import 'package:weather_app/src/pages/home/widgets/WeatherBottomInfo.dart';
import 'package:weather_app/src/pages/home/widgets/WeatherMainInfo.dart';
import 'package:weather_app/src/widgets/CustomWidgets/Custom_AppBar.dart';
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

    final _bottom = MediaQuery.of(context).viewInsets.bottom;

    return WeatherImage(
      child: SafeArea(
        child: Scaffold(
            // appBar: _buildAppBar(),
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

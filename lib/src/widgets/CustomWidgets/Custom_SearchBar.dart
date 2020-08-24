import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/src/pages/home/home_viewmodel.dart';

class CustomSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _homeVm = Provider.of<HomeViewModel>(context, listen: true);

    final _size = MediaQuery.of(context).size;
    final TextEditingController editingController = TextEditingController();

    return Container(
      child: TextField(
        // controller: editingController,
        textAlign: TextAlign.center,
        textInputAction: TextInputAction.go,
        style: TextStyle(color: Colors.white),
        onChanged: (value) => _homeVm.setLocation = value,
        onSubmitted: (value) => _homeVm.fetchWeather(context),
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            prefixIcon: GestureDetector(
              onTap: () {
                submit(context);
              },
              child: Container(
                  margin: EdgeInsets.only(
                      left: _size.width * 0.05, top: _size.height * 0.015),
                  child: FaIcon(
                    FontAwesomeIcons.search,
                    color: Colors.white,
                  )),
            ),
            contentPadding: EdgeInsets.only(left: _size.width * 0.1),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.indigoAccent, width: 1.2),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.indigoAccent, width: 3),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            hintText: 'Ingrese una locación',
            hintStyle: TextStyle(color: Colors.white)),
      ),
    );
  }

  submit(context) async {
    final _homeVm = Provider.of<HomeViewModel>(context, listen: false);

    FocusScope.of(context).unfocus();

    await _homeVm.fetchWeather(context);
  }
}

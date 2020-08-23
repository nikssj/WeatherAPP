import 'package:flutter/material.dart';

class WeatherImage extends StatelessWidget {
  final Widget child;

  WeatherImage({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/background/atardecer.png'),
            fit: BoxFit.cover),
      ),
      child: child,
    );
  }
}

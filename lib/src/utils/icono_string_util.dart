// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final _icons = {
  'termometro': FaIcon(FontAwesomeIcons.thermometer),
  'sun': FaIcon(FontAwesomeIcons.sun),
  'nombre': FaIcon(FontAwesomeIcons.cloudSunRain),
};

getIcon(String nombreIcono, colorIcono) {
  if (nombreIcono == 'logout') {
    colorIcono = Colors.white;
  }
}

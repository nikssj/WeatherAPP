// Package imports:
import 'package:google_fonts/google_fonts.dart';

var _textProperties;

class StatsCss {
  StatsCss({style, color, fontWeight, size}) {
    _textProperties = GoogleFonts.montserrat(
        color: color,
        fontWeight: fontWeight,
        fontSize: double.tryParse('$size'));
  }

  get textProperties => _textProperties;
}

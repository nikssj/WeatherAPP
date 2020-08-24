// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';
import 'package:overlay_support/overlay_support.dart';

// Project imports:
import 'package:weather_app/helpers/Constants.dart';
import 'package:weather_app/helpers/GlobalKey.dart';
import 'Snackbars_config.dart';

// Project imports:

final snackBars = new Snackbars();

bool _isSnackbarActive = false;

final _estiloTexto = GoogleFonts.sourceSansPro(fontSize: 15);

class Snackbars {
  get estaActivado => _isSnackbarActive;

  set setEstadoSnackBar(value) {
    _isSnackbarActive = value;
  }

  final snackbarError = (mensaje) => showSimpleNotification(
        Builder(builder: (context) {
          myGlobals.setSnackBarContext = context;
          return Text(
            mensaje,
            style: _estiloTexto,
          );
        }),
        leading: Icon(Icons.error, color: Colors.red),
        background: snackbarConfig.background,
        duration: snackbarConfig.duration,
        position: snackbarConfig.position,
        autoDismiss: snackbarConfig.autoDismiss,
        slideDismiss: snackbarConfig.slideDismiss,
      );

  final snackbarLoading = () => showSimpleNotification(
        Builder(builder: (context) {
          myGlobals.setSnackBarContext = context;
          return Text(
            'Searching location..',
            style: _estiloTexto,
          );
        }),
        leading: Icon(Icons.file_download, color: Colors.white60),
        background: snackbarConfig.background,
        duration: Duration(seconds: TIMEOUT_RESPONSE),
        position: snackbarConfig.position,
        autoDismiss: snackbarConfig.autoDismiss,
        slideDismiss: snackbarConfig.slideDismiss,
      );

  final snackbarSuccess = (mensaje) => showSimpleNotification(
        Builder(builder: (context) {
          myGlobals.setSnackBarContext = context;
          return Text(
            mensaje,
            style: _estiloTexto,
          );
        }),
        leading: Icon(Icons.check, color: Colors.green),
        background: snackbarConfig.background,
        duration: snackbarConfig.duration,
        position: snackbarConfig.position,
        autoDismiss: snackbarConfig.autoDismiss,
        slideDismiss: snackbarConfig.slideDismiss,
      );
}

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:overlay_support/overlay_support.dart';

// Project imports:
import 'package:weather_app/helpers/GlobalKey.dart';
import 'Snackbars_widgets.dart';

// Project imports:

final toastWidgetsService = new ToastWidgetsService();

class ToastWidgetsService {
  //LOADING TOAST
  loadingToast(String titulo, BuildContext context) {
    hideCurrentSnackbar();
    snackBars.setEstadoSnackBar = true;
    snackBars.snackbarLoading();
  }

  //TOAST SUCCESS
  mostrarToastSuccess(BuildContext context, String mensaje) {
    hideCurrentSnackbar();
    snackBars.setEstadoSnackBar = true;
    snackBars.snackbarSuccess(mensaje);
  }

  //TOAST ERROR
  mostrarToastError(BuildContext context, String mensaje, bool reconectar) {
    hideCurrentSnackbar();
    snackBars.setEstadoSnackBar = true;
    snackBars.snackbarError(mensaje);
  }

  hideCurrentSnackbar() {
    try {
      if (snackBars.estaActivado) {
        OverlaySupportEntry.of(myGlobals.snackBarContext).dismiss();
        snackBars.setEstadoSnackBar = false;
      }
    } catch (e) {
      print(e);
      print('No hay snackbars a cerrar');
    }
  }
}

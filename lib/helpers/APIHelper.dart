// Dart imports:
import 'dart:async';
import 'dart:convert';
import 'dart:io';

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:http/http.dart' as http;
import 'package:weather_app/src/widgets/Snackbars/Snackbars_functions.dart';

// Project imports:
import 'Constants.dart';
import 'Exception.dart';

class ApiBaseHelper {
  Future<dynamic> get(String url, BuildContext context, [headers]) async {
    var responseJson;

    try {
      toastWidgetsService.loadingToast('Searching location..', context);
      final response = await http
          .get(url, headers: headers)
          .timeout(Duration(seconds: TIMEOUT_RESPONSE));
      responseJson = _returnResponse(response, context);
    } on SocketException {
      toastWidgetsService.mostrarToastError(
          context, NO_INTERNET_CONNECTION_MESSAGE, true);
      throw FetchDataException(NO_INTERNET_CONNECTION_MESSAGE);
    } on TimeoutException catch (_) {
      toastWidgetsService.mostrarToastError(context, TIMEOUT_MESSAGE, true);
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response, BuildContext context) async {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());

        toastWidgetsService.mostrarToastSuccess(context, 'Location found!');

        return responseJson;

        break;

      case 400:
        var body = json.decode(response.body.toString());

        return toastWidgetsService.mostrarToastError(
            context, body['msg'], false);

        break;

      case 401: //Acceso no autorizado

        break;

      case 404:
        toastWidgetsService.mostrarToastError(
            context, 'Location not found. Please try again!', false);

        break;

      case 500:
        return toastWidgetsService.mostrarToastError(
            context,
            'Ups! Ha ocurrido un error. Por favor comunicarse con el administrador',
            false);

        break;

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}

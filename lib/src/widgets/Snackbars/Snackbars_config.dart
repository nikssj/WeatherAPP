// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:overlay_support/overlay_support.dart';

final snackbarConfig = new SnackbarConfig();

class SnackbarConfig {
  var background = Colors.grey[850];
  var duration = Duration(seconds: 3);
  var position = NotificationPosition.bottom;
  var autoDismiss = true;
  var slideDismiss = true;
}

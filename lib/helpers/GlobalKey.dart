// Flutter imports:
import 'package:flutter/material.dart';

MyGlobals myGlobals = new MyGlobals();

class MyGlobals {
  GlobalKey _scaffoldKey;
  GlobalKey<ScaffoldState> _globalScaffoldStateKey;

  MyGlobals() {
    _scaffoldKey = new GlobalKey();
    _globalScaffoldStateKey = new GlobalKey<ScaffoldState>();
  }
  GlobalKey get scaffoldKey => _scaffoldKey;

  GlobalKey<ScaffoldState> get globalScaffoldStateKey =>
      _globalScaffoldStateKey;

  var _snackBarContext;
  get snackBarContext => _snackBarContext;

  set setSnackBarContext(context) {
    _snackBarContext = context;
  }
}

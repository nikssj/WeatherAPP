// Flutter imports:
import 'package:flutter/material.dart';

enum ViewState { Idle, Busy }

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  //Pagina Cargada
  bool _paginaCargada = false;

  get paginaCargada => _paginaCargada;

  void setPaginaCargada(bool value) {
    _paginaCargada = value;
  }
}

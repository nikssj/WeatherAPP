// import 'package:andersgym/helpers/GlobalCss.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String titulo;
  final Widget leading;
  final automaticallyImplyLeading;

  CustomAppBar({this.titulo, this.automaticallyImplyLeading, this.leading})
      : preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 0,
        leading: widget.leading,
        centerTitle: true,
        title: Text(
          widget.titulo ?? '',
        ));
  }
}

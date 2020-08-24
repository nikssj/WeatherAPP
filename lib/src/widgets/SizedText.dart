// Flutter imports:
import 'package:flutter/material.dart';

class SizedText extends StatelessWidget {
  final Widget child;
  final height;

  SizedText({this.child, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height, child: FittedBox(child: child));
  }
}

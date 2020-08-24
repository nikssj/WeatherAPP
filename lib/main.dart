// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:weather_app/src/pages/home/home_page.dart';
import 'src/pages/home/home_viewmodel.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting();
  Intl.defaultLocale = 'es-AR';
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeViewModel>(
          create: (_) => HomeViewModel(),
        ),
      ],
      child: OverlaySupport(
        child: MaterialApp(
          home: HomePage(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}

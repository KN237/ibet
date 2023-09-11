import 'package:Ibet/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/helpers/frontHelpers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then(
    (_) => runApp(MyApp()),
  );
}

class MyApp extends StatelessWidget {
  Map<int, Color> color = {
    50: FrontHelpers().gris,
    100: FrontHelpers().gris,
    200: FrontHelpers().gris,
    300: FrontHelpers().gris,
    400: FrontHelpers().gris,
    500: FrontHelpers().gris,
    600: FrontHelpers().gris,
    700: FrontHelpers().gris,
    800: FrontHelpers().gris,
    900: FrontHelpers().gris,
  };
  @override
  Widget build(BuildContext context) {

     MaterialColor colorCustom = MaterialColor(0xFF737373, color);

    return MaterialApp(
      title: 'Ibet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: colorCustom,
      ),
      home: Home(),
    );
  }
}

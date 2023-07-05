import 'package:Ibet/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/helpers/frontHelpers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); 
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp,DeviceOrientation.portraitDown])
      .then((_) => runApp(MyApp()),
  );
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ibet Pronostics',
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).copyWith(
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: FrontHelpers().blanc)),
      home: Home(),
    );
  }
}

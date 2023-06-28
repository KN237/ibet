import 'package:flutter/material.dart';

class FrontHelpers {
  final h1 = const TextStyle(
      fontSize: 20, fontWeight: FontWeight.w900, color: Color(0xff000000));

  late var h2 = h1.copyWith(fontSize: 18);

  late var h3 = h1.copyWith(fontSize: 16);

  late var h4 = h1.copyWith(fontSize: 14);

  late var bodyText = h1.copyWith(fontSize: 12);

  late var noir = const Color(0xff000000);

  late var blanc = const Color(0xfffafafa);

  late var vert = Colors.green;

  late var gris = const Color(0xff737373);

  late var grisGradient = const SweepGradient(
          colors: [Color(0xff2e2e2e), Color(0xff747474)],
          stops: [0, 1],
          center: Alignment.topLeft,
        );
        

  late var orange = const Color(0xffff931e);

  late var orangeGradient = const LinearGradient(
    colors: [Color(0xff747474), Color(0xab747474)],
    stops: [0, 1],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  late var rouge = const Color(0xffda1421);

  late var rougeGradient = const LinearGradient(
    colors: [Color(0xffda1421), Color(0xabda1421)],
    stops: [0, 1],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  late var bleu = const Color(0xFF40C4FF);

  late var bleuGradient = const LinearGradient(
    colors: [Color(0xff40C4FF), Color(0xab40C4FF)],
    stops: [0, 1],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

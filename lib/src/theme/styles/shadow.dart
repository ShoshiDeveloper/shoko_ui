import 'package:flutter/widgets.dart';

enum SShadow {
  small,
  medium,
  large,
}

extension SShadowsExtension on SShadow {
  List<BoxShadow> get listBoxShadow => switch (name) {
      "medium" => const [
          BoxShadow(
            blurRadius: 6,
            color: Color.fromRGBO(15, 23, 42, 0.1),
            offset: Offset(0,4),
            spreadRadius: -1
          ),
          BoxShadow(
            blurRadius: 4,
            color: Color.fromRGBO(15, 23, 42, 0.05),
            offset: Offset(0,2),
            spreadRadius: -2
          )
        ],
      "large" =>const [
          BoxShadow(
            blurRadius: 6,
            color: Color.fromRGBO(15, 23, 42, 0.05),
            offset: Offset(0,4),
            spreadRadius: 0
          ),
          BoxShadow(
            blurRadius: 15,
            color: Color.fromRGBO(15, 23, 42, 0.07),
            offset: Offset(0,10),
            spreadRadius: -3
          )
        ],
      "small" => const [
          BoxShadow(
            blurRadius: 3,
            color: Color.fromRGBO(15, 23, 42, 0.08),
            offset: Offset(0,1),
            spreadRadius: 0
          ),
          BoxShadow(
            blurRadius: 2,
            color: Color.fromRGBO(15, 23, 42, 0.1),
            offset: Offset(0,1),
            spreadRadius: -1
          )
        ],
        _ => []
  };
}
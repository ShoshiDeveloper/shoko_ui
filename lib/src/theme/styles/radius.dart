import 'package:flutter/widgets.dart';

enum SRadii {
  ///It is 8
  small,
  ///It is 12
  medium,
  ///It is 16
  mediumPlus,
  ///It is 20
  large,
  ///It is 24
  largePlus
}

extension SRadiiExtension on SRadii {
  BorderRadius get() {
    switch (name) {
      case "small":
        return BorderRadius.circular(8);
      case "medium":
        return BorderRadius.circular(12);
      case "mediumPlus":
        return BorderRadius.circular(16);
      case "large":
        return BorderRadius.circular(20);
      case "largePlus":
        return BorderRadius.circular(24);
      default:
        return BorderRadius.circular(12);
    }
  }
}
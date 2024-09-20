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
  BorderRadius get borderRadius => switch (name) {
      "small" => BorderRadius.circular(8),
      "medium" => BorderRadius.circular(12),
      "mediumPlus" => BorderRadius.circular(16),
      "large" => BorderRadius.circular(20),
      "largePlus" => BorderRadius.circular(24),
      _ => BorderRadius.circular(12),
  };
}
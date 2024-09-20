import 'package:flutter/widgets.dart';
import 'package:shoko_ui/src/theme/styles/radius.dart';

class SRadioTheme {
  final Color activeColor;
  final Color inactiveColor;
  final Color markColor;
  final SRadii radius;

  const SRadioTheme({
    this.activeColor = const Color.fromRGBO(126, 127, 251, 1),
    this.inactiveColor = const Color.fromRGBO(255, 255, 255, 1),
    this.markColor = const Color.fromRGBO(255, 255, 255, 1),
    this.radius = SRadii.small
  });
}
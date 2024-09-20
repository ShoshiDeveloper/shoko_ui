import 'package:flutter/widgets.dart';

class SSwitchTheme {
  final Color thumbColor;
  final Color inactiveThumbColor;
  final Color backgroundColor;
  final Color inactiveBackgroundColor;
  final Color outlineColor;
  final Color inactiveOutlineColor;
  
  final bool enableOutline;
  final double insidePadding;

  final List<BoxShadow>? thumbShadow;

  const SSwitchTheme({
    this.thumbColor = const Color.fromRGBO(255, 255, 255, 1),
    this.backgroundColor = const Color.fromRGBO(126, 127, 251, 1),
    this.outlineColor = const Color.fromRGBO(126, 127, 251, 1),
    this.inactiveThumbColor = const Color.fromRGBO(255, 255, 255, 1),
    this.inactiveBackgroundColor = const Color.fromRGBO(225, 227, 230, 1),
    this.inactiveOutlineColor = const Color.fromRGBO(225, 227, 230, 1),
    this.enableOutline = false,
    this.insidePadding = 2,
    this.thumbShadow
  });
}

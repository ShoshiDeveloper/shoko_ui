import 'package:flutter/material.dart';

class SBadgeTheme {
  final Color? color;
  final Color? alertColor;
  final Color? inactiveColor;
  
  final Color? textColor;
  final Color? textAlertColor;
  final Color? textInactiveColor;

  const SBadgeTheme({
    this.color, this.alertColor, this.inactiveColor,
    this.textColor, this.textAlertColor, this.textInactiveColor
  });
}
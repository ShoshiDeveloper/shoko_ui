import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SBackgroundTheme {
  final Color primary;
  final Color secondary;
  final Color tertiary;

  final Color brand;
  final Color brandLight;
  final Color success;
  final Color successLight;
  final Color alert;
  final Color alertLight;

  const SBackgroundTheme({
    required this.primary,
    required this.secondary,
    required this.tertiary,

    required this.brand,
    required this.brandLight,
    required this.success,
    required this.successLight,
    required this.alert,
    required this.alertLight,
  });

  @protected
  const SBackgroundTheme.basic({
    this.primary = Colors.white,
    this.secondary = Colors.grey,
    this.tertiary = Colors.black87 ,

    this.brand = Colors.red,
    this.brandLight = Colors.red,
    this.success = Colors.green,
    this.successLight = Colors.green,
    this.alert = Colors.red,
    this.alertLight = Colors.red,
  });
}

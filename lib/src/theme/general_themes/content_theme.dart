import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SContentTheme {
  final Color primary;
  final Color invertPrimary;
  final Color secondary;
  final Color tertiary;

  final Color brand;
  final Color success;
  final Color alert;



  const SContentTheme({
    required this.primary,
    required this.invertPrimary,
    required this.secondary,
    required this.tertiary,

    required this.brand,
    required this.success,
    required this.alert,
  });

  
  @protected
  const SContentTheme.basic({
    this.primary = Colors.black,
    this.invertPrimary = Colors.white,
    this.secondary = Colors.grey,
    this.tertiary = Colors.black26 ,

    this.brand = Colors.red,
    this.success = Colors.green,
    this.alert = Colors.red,
  });
}

import 'package:flutter/widgets.dart';
import 'package:shoko_ui/src/theme/styles/radius.dart';
import 'package:shoko_ui/src/theme/styles/shadow.dart';


class SButtonTheme {
  final Color color;
  final SRadii? radius;
  final SShadow? shadow;

  const SButtonTheme({
    required this.color,
    this.radius = SRadii.mediumPlus,
    this.shadow
  });
  
  @protected
  const SButtonTheme.basic({
    this.color = const Color.fromRGBO(126, 127, 251, 1),
    this.radius = SRadii.mediumPlus,
    this.shadow
  });
}
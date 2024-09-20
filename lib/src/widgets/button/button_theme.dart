import 'package:flutter/widgets.dart';
import 'package:shoko_ui/src/theme/styles/radius.dart';
import 'package:shoko_ui/src/theme/styles/shadow.dart';

enum SButtonState {
  primary, focus, disabled
}

class SButtonTheme {
  final Color color;
  final SRadii radius;
  final SShadow? shadow;

  Color colorByState(SButtonState state) => switch (state) {
    SButtonState.primary => color,
    SButtonState.focus => color.withAlpha(0),
    SButtonState.disabled => color.withOpacity(0.2)
  };

  const SButtonTheme({
    this.color = const Color.fromRGBO(126, 127, 251, 1),
    this.radius = SRadii.mediumPlus,
    this.shadow
  });
}
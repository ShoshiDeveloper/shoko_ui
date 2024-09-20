import 'package:flutter/material.dart';
import 'package:shoko_ui/src/theme/styles/radius.dart';
import 'package:shoko_ui/src/theme/extensions/context_theme_extension.dart';

enum ShokoRadioChildPosition {left, right}

class ShokoRadio extends StatelessWidget {
  final bool value;
  final Function(bool newValue)? onChange;

  final Widget? child;

  final double size;
  final Color? inactiveColor;
  final Color? activeColor;
  final Color? markColor;
  final SRadii? radius;

  final ShokoRadioChildPosition childPosition;
  final MainAxisAlignment mainAxisAlignment;

  const ShokoRadio({super.key,
    required this.value, this.onChange,
    this.child,
    this.size = 32, this.inactiveColor, this.markColor, this.activeColor, this.radius = SRadii.medium,
    this.childPosition = ShokoRadioChildPosition.right, this.mainAxisAlignment = MainAxisAlignment.start
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (childPosition == ShokoRadioChildPosition.left) ... [
          if(child != null) child!,
          const SizedBox(width: 8),
        ],
        GestureDetector(
          onTap: () => onChange?.call(!value),
          child: Container(
            height: size,
            width: size,
            decoration: BoxDecoration(
              color: value ? (activeColor ?? context.theme.radioTheme.activeColor) : null,
              borderRadius: (radius?.get() ?? context.theme.buttonTheme.radius.get()),
              border: !value ? Border.all(
                color: inactiveColor ?? context.theme.radioTheme.inactiveColor,
                width: 2
              ) : null
            ),
            child: value ? Icon(Icons.check_rounded, size: size - 4, color: markColor ?? context.theme.radioTheme.markColor) : null,
          )
        ),
        if (childPosition == ShokoRadioChildPosition.right) ... [
          const SizedBox(width: 8),
          if(child != null) child!
        ]
      ],
    );
  }
}
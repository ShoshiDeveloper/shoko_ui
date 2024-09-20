import 'package:flutter/material.dart';
import 'package:shoko_ui/shoko_ui.dart';

enum SBadgeState {active, alert, inactive}

class SBadge extends StatelessWidget {
  const SBadge({super.key,
    required this.text, this.state = SBadgeState.active,
    this.color, this.alertColor, this.inactiveColor,
    this.textColor
  });

  final String text;
  final SBadgeState state;

  final Color? color;
  final Color? alertColor;
  final Color? inactiveColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: SRadii.mediumPlus.borderRadius,
        color: switch (state) {
          SBadgeState.active => color ?? context.theme.badgeTheme.color ?? context.theme.backgroundTheme.primary,
          SBadgeState.alert => alertColor ?? context.theme.badgeTheme.alertColor ?? context.theme.backgroundTheme.alertLight,
          SBadgeState.inactive => inactiveColor ?? context.theme.badgeTheme.inactiveColor ?? context.theme.backgroundTheme.tertiary,
        },
      ),
      child: Text(text, style: context.theme.contentStyles.body2(weight: FontWeight.w500, color: textColor ?? switch (state) {
          SBadgeState.active => color ?? context.theme.badgeTheme.textColor ?? context.theme.contentTheme.primary,
          SBadgeState.alert => alertColor ?? context.theme.badgeTheme.textAlertColor ?? context.theme.contentTheme.alert,
          SBadgeState.inactive => inactiveColor ?? context.theme.badgeTheme.textInactiveColor ?? context.theme.contentTheme.secondary,        
      })),
    );
  }
}
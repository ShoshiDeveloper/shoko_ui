import 'package:flutter/widgets.dart';
import 'package:shoko_ui/src/theme/extensions/context_theme_extension.dart';
import 'package:shoko_ui/src/theme/general_themes/background_theme.dart';
import 'package:shoko_ui/src/theme/general_themes/content_theme.dart';
import 'package:shoko_ui/src/theme/styles/content_styles.dart';
import 'package:shoko_ui/src/widgets/badge/badge_theme.dart';
import 'package:shoko_ui/src/widgets/button/button_theme.dart';
import 'package:shoko_ui/src/widgets/radio/shoko_theme_radio.dart';
import 'package:shoko_ui/src/widgets/switch/switch_theme.dart';
import 'package:shoko_ui/src/widgets/textfields/textfield_theme.dart';

///Widget for set ui theme
///Preferably, the entire application should be wrapped so that the theme is accessible from anywhere
class SThemeWidget extends StatelessWidget {
  final STheme shokoUITheme;
  final Widget child;
  const SThemeWidget({super.key, required this.shokoUITheme, required this.child});

  void treeRebuild() {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }

    (this as Element).markNeedsBuild();
    (this as Element).visitChildren(rebuild);
  }

  @override
  Widget build(BuildContext context) {
    context.initTheme(shokoUITheme, needRebuild: treeRebuild);
    return child;
  }
}

///A class that stores global theme settings
class STheme {
  //Styles of widgets
  final SBadgeTheme badgeTheme;
  final SButtonTheme buttonTheme;
  final SRadioTheme radioTheme;
  final STextFieldTheme textFieldTheme;
  final SSwitchTheme switchTheme;

  final SBackgroundColors backgroundTheme;
  final SContentColors contentTheme;

  final SContentStyles contentStyles;

  // final ShokoDialogTheme dialogTheme;
  // final ShokoMBSTheme mbsTheme;

  const STheme(
      {this.badgeTheme = const SBadgeTheme(),
      this.buttonTheme = const SButtonTheme.basic(),
      this.radioTheme = const SRadioTheme(),
      this.textFieldTheme = const STextFieldTheme(),
      this.switchTheme = const SSwitchTheme(),
      this.backgroundTheme = const SBackgroundColors.basic(),
      this.contentTheme = const SContentColors.basic(),
      this.contentStyles = const SContentStyles()

      // this.dialogTheme = const ShokoDialogTheme(),
      // this.mbsTheme = const ShokoMBSTheme()
      });
}

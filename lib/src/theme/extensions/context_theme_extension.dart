import 'package:flutter/widgets.dart';
import 'package:shoko_ui/src/theme/widget/theme_widget.dart';


extension SThemeExtension on BuildContext {
  @protected
  static STheme _currentTheme = const STheme();
  @protected
  static bool _isThemeInitialized = false;
  static Function()? needRebuild;

  STheme get theme => _currentTheme;

  @protected
  void initTheme(STheme theme, {required Function() needRebuild}) {
    if(!_isThemeInitialized) {
      _currentTheme = theme;
      needRebuild = needRebuild;

      _isThemeInitialized = true;
    }
  }

  void changeTheme(STheme theme) {
    _currentTheme = theme;

    needRebuild?.call();
    
  }
}
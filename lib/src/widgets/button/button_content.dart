import 'package:flutter/material.dart';
import 'package:shoko_ui/shoko_ui.dart';
import 'package:shoko_ui/src/core/enums/button_content_types.dart';
import 'package:shoko_ui/src/widgets/content/content_widget.dart';

class SButtonContent extends StatelessWidget implements ContentWidget {
  const SButtonContent.text({super.key, required this.text, this.color})
      : type = ButtonContentTypes.text,
        icon = null;
  const SButtonContent.icon({super.key, required this.icon})
      : type = ButtonContentTypes.icon,
        text = null,
        color = null;

  final ButtonContentTypes type;

  final String? text;
  final Widget? icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return switch (type) {
      ButtonContentTypes.text => Text(text ?? (throw Exception('Content type is text, but text is null')),
          style: context.theme.contentStyles.body1(weight: FontWeight.w500, color: color ?? context.theme.contentTheme.invertPrimary)),
      ButtonContentTypes.icon => icon ?? (throw Exception('Content type is icon, but icon is null')),
    };
  }
}

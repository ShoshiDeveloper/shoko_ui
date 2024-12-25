import 'package:flutter/material.dart';
import 'package:shoko_ui/shoko_ui.dart';
import 'package:shoko_ui/src/widgets/content/content_widget.dart';

sealed class SButtonContent extends ContentWidget {
  factory SButtonContent.text(String text, {TextStyle? style, Color? color}) => SButtonTextContent(text: '', style: style, color: color);
  factory SButtonContent.icon(Widget icon) => SButtonIconContent(icon: icon);
}

@protected
class SButtonTextContent extends StatelessWidget implements SButtonContent {
  const SButtonTextContent({super.key, required this.text, this.style, this.color});

  final String text;
  final TextStyle? style;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: style ?? context.theme.contentStyles.body1(weight: FontWeight.w500, color: color ?? context.theme.contentTheme.invertPrimary));
  }
}

@protected
class SButtonIconContent extends StatelessWidget implements SButtonContent {
  const SButtonIconContent({super.key, required this.icon});

  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return icon;
  }
}

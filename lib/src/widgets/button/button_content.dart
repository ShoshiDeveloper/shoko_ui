import 'package:flutter/material.dart';
import 'package:shoko_ui/shoko_ui.dart';
import 'package:shoko_ui/src/widgets/content/content_widget.dart';

class SButtonTextContent extends StatelessWidget implements ContentWidget {
  const SButtonTextContent({super.key, required this.text, this.color});

  final String text;
  final Color? color;
  
  @override
  Widget build(BuildContext context) {
    return Text(text, style: context.theme.contentStyles.body1(weight: FontWeight.w500, color: color ?? context.theme.contentTheme.invertPrimary));
  }
}

class SButtonIconContent extends StatelessWidget implements ContentWidget {
  const SButtonIconContent({super.key, required this.icon});
  
  ///Recommended size is 21 px
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return icon;
  }
}

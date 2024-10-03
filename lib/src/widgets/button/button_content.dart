import 'package:flutter/material.dart';
import 'package:shoko_ui/shoko_ui.dart';

class SButtonTextContent extends StatelessWidget {
  const SButtonTextContent({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: context.theme.contentStyles.body1());
  }
}

class SButtonIconContent extends StatelessWidget {
  const SButtonIconContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

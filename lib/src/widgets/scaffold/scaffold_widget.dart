import 'package:flutter/material.dart';
import 'package:shoko_ui/shoko_ui.dart';

class SScaffold extends StatelessWidget {
  const SScaffold({super.key, required this.body, this.appBar, this.backgroundColor}) : _scrollable = false;
  const SScaffold.scrollable({super.key, required this.body, this.appBar, this.backgroundColor}) : _scrollable = true;

  final Widget body;
  final AppBar? appBar;

  final Color? backgroundColor;

  final bool _scrollable;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? context.theme.colors.background.primary,
      appBar: appBar,
      body: _scrollable ? SingleChildScrollView(child: body) : body,
    );
  }
}

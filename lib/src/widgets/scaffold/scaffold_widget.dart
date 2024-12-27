import 'package:flutter/material.dart';
import 'package:shoko_ui/shoko_ui.dart';

class SScaffold extends StatelessWidget {
  const SScaffold({super.key, required this.body, this.appBar, this.backgroundColor}) : _scrollable = false;
  const SScaffold.scrollable({super.key, required this.body, this.appBar, this.backgroundColor}) : _scrollable = true;

  final Widget body;
  final AppBar? appBar;

  final bool _scrollable;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? context.theme.backgroundTheme.primary,
      appBar: appBar,
      body: _scrollable ? SingleChildScrollView(child: body) : body,
    );
  }
}

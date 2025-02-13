import 'package:flutter/material.dart';
import 'package:shoko_ui/src/theme/theme.dart';

class SAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SAppBar({super.key, this.title, this.onPop, this.actions, this.backgroundColor});

  final String? title;

  final Color? backgroundColor;

  final VoidCallback? onPop;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: backgroundColor ?? context.theme.colors.background.primary,
      centerTitle: true,
      leading: InkWell(
        overlayColor: const WidgetStatePropertyAll(Colors.transparent),
        onTap: onPop ?? () => Navigator.pop(context),
        child: Icon(Icons.chevron_left_rounded, color: context.theme.colors.content.primary),
      ),
      title:
          title != null ? Text(title!, style: context.theme.contentStyles.body1(weight: FontWeight.w600, color: context.theme.colors.content.primary)) : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(45);
}

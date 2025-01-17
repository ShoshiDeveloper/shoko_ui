import 'package:flutter/material.dart';
import 'package:shoko_ui/shoko_ui.dart';

enum ButtonChildPosition {
  start(MainAxisAlignment.start),
  center(MainAxisAlignment.center),
  end(MainAxisAlignment.end);

  const ButtonChildPosition(this.alignment);
  final MainAxisAlignment alignment;
}

class SButton extends StatefulWidget {
  final Function()? onTap;
  final Function()? onDoubleTap;
  final Function()? onLongPress;

  final Color? color;

  final bool isOutline;
  final bool expanded;

  final SButtonContent child;

  final SRadii? radius;
  final SShadow? shadow;
  final ButtonChildPosition childPosition;

  const SButton(
      {super.key,
      this.onTap,
      this.onDoubleTap,
      this.onLongPress,
      this.color,
      this.isOutline = false,
      required this.child,
      this.radius,
      this.shadow,
      this.childPosition = ButtonChildPosition.center})
      : expanded = false;

  const SButton.expanded(
      {super.key,
      this.onTap,
      this.onDoubleTap,
      this.onLongPress,
      this.color,
      this.isOutline = false,
      required this.child,
      this.radius,
      this.shadow,
      this.childPosition = ButtonChildPosition.center})
      : expanded = true;

  @override
  State<SButton> createState() => _SButtonState();
}

class _SButtonState extends State<SButton> {
  bool isFocused = false;
  late bool isEnabled = widget.onTap != null || widget.onDoubleTap != null || widget.onLongPress != null;

  @override
  void didUpdateWidget(covariant SButton oldWidget) {
    isEnabled = widget.onTap != null || widget.onDoubleTap != null || widget.onLongPress != null;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.buttonTheme;

    return GestureDetector(
      onTap: widget.onTap,
      onDoubleTap: widget.onDoubleTap,
      onLongPressStart: (_) => setState(() => isFocused = (true && isEnabled)),
      onLongPressEnd: (_) => setState(() => isFocused = false),
      onLongPress: widget.onLongPress,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        decoration: _animatedDecoration(theme),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
          decoration: _contentDecoration(theme),
          child: Container(
            child: widget.expanded
                ? Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: widget.childPosition.alignment,
                    children: [
                      widget.child,
                    ],
                  )
                : widget.child,
          ),
        ),
      ),
    );
  }

  BoxDecoration _animatedDecoration(SButtonTheme theme) {
    final color = widget.color ?? theme.color;

    return BoxDecoration(
        borderRadius: (widget.radius?.borderRadius ?? theme.radius?.borderRadius),
        color: !widget.isOutline ? (isEnabled ? color : color.withOpacity(0.25)) : null,
        border: Border.all(strokeAlign: BorderSide.strokeAlignOutside, color: isFocused ? color.withOpacity(0.25) : Colors.transparent, width: 5));
  }

  BoxDecoration _contentDecoration(SButtonTheme theme) => BoxDecoration(
        borderRadius: (widget.radius?.borderRadius ?? theme.radius?.borderRadius),
        boxShadow: (widget.shadow?.listBoxShadow ?? theme.shadow?.listBoxShadow),
        border: widget.isOutline ? Border.all(strokeAlign: BorderSide.strokeAlignOutside, width: 1, color: widget.color ?? theme.color) : null,
      );
}

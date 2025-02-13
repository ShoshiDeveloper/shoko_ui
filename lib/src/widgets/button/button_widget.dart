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

  bool get isEnabled => widget.onTap != null || widget.onDoubleTap != null || widget.onLongPress != null;

  SButtonTheme get theme => context.theme.buttonTheme;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onDoubleTap: widget.onDoubleTap,
      onLongPress: widget.onLongPress,
      onLongPressStart: (_) => setState(() => isFocused = (true && isEnabled)),
      onLongPressEnd: (_) => setState(() => isFocused = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        decoration: _animatedDecoration(),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
          decoration: _contentDecoration(),
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

  BoxDecoration _animatedDecoration() {
    final color = widget.color ?? theme.color;

    return BoxDecoration(
        borderRadius: (widget.radius?.borderRadius ?? theme.radius?.borderRadius),
        color: !widget.isOutline ? (isEnabled ? color : color.withOpacity(0.25)) : null,
        border: Border.all(strokeAlign: BorderSide.strokeAlignOutside, color: isFocused ? color.withOpacity(0.25) : Colors.transparent, width: 5));
  }

  BoxDecoration _contentDecoration() => BoxDecoration(
        borderRadius: (widget.radius?.borderRadius ?? theme.radius?.borderRadius),
        boxShadow: (widget.shadow?.listBoxShadow ?? theme.shadow?.listBoxShadow),
        border: widget.isOutline ? Border.all(strokeAlign: BorderSide.strokeAlignOutside, width: 1, color: widget.color ?? theme.color) : null,
      );
}

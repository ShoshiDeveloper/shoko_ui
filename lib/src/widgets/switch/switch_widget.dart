import 'package:flutter/material.dart';
import 'package:shoko_ui/src/theme/extensions/context_theme_extension.dart';
import 'package:shoko_ui/src/widgets/switch/switch_theme.dart';

class SSwitch extends StatefulWidget {
  final Function(bool newValue)? onChange;
  
  final bool value;
  final double width;

  final Color? thumbColor;
  final Color? inactiveThumbColor;
  final Color? backgroundColor;
  final Color? inactiveBackgroundColor;
  final Color? outlineColor;
  final Color? inactiveOutlineColor;
  

  final List<BoxShadow>? thumbShadow;

  final bool? enableOutline;
  final double? insidePadding;

  const SSwitch({super.key,
    required this.value, this.onChange, this.width = 64,
    this.thumbColor, this.backgroundColor, this.outlineColor, this.inactiveThumbColor, this.inactiveBackgroundColor, this.inactiveOutlineColor,
    this.enableOutline, this.insidePadding,
    this.thumbShadow
  });

  @override
  State<SSwitch> createState() => _SSwitchState();
}

class _SSwitchState extends State<SSwitch> {
  late bool value = widget.value;

  Color get thumbColor => value ? ((widget.thumbColor ?? theme.thumbColor)) : ((widget.inactiveThumbColor ?? theme.inactiveThumbColor));
  Color get backgroundColor => value ? ((widget.backgroundColor ?? theme.backgroundColor)) : ((widget.inactiveBackgroundColor ?? theme.inactiveBackgroundColor));
  Color get outlineColor => value ? ((widget.outlineColor ?? theme.outlineColor)) : ((widget.inactiveOutlineColor ?? theme.inactiveOutlineColor));

  late SSwitchTheme theme = context.theme.switchTheme;

  final double divider = 1.6;
  double get difference => widget.width - (widget.width / divider);

  @override
  void didUpdateWidget(covariant SSwitch oldWidget) {
    setState(() {
      value = widget.value;
      theme = context.theme.switchTheme;
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () => widget.onChange?.call(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInSine,
        width: widget.width,
        height: widget.width / divider,
        padding: EdgeInsets.all(widget.insidePadding ?? theme.insidePadding),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(widget.width),
          border: (widget.enableOutline ?? theme.enableOutline) ? Border.all(
            width: 2,
            color: outlineColor
          ) : null
        ),
        child: AnimatedContainer(
          margin: EdgeInsets.only(
            left: value ? difference : 0,
            right: value ? 0 : difference
          ),
          decoration: BoxDecoration(
            color: thumbColor,
            boxShadow: widget.thumbShadow ?? context.theme.switchTheme.thumbShadow,
            borderRadius: BorderRadius.circular(widget.width)
          ),
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInSine,
          )
      )
    );
  }
}
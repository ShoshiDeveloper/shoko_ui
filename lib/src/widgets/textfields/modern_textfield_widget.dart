import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoko_ui/shoko_ui.dart';

class ShokoModernTextField extends StatefulWidget {
  
  ///Be auto-dispose when widget disposed
  final TextEditingController controller;
  final TextStyle? style;

  final Function(String value)? onChange;
  final bool Function(String value)? validator;

  final bool isEnabled;
  final bool obscureText;
  final bool? isOutline;

  final bool isError;
  final String? errorText;
  final TextStyle? errorTextStyle;

  final String? label;
  final TextStyle? labelTextStyle;

  final Color? enableColor;
  final Color? disableColor;
  final Color? focusColor;
  final Color? errorColor;

  final TextInputType? keyboardType;

  final int? minSymbols;
  final int? maxSymbols;
  final int? maxLines;

  final Widget? suffix;

  final List<TextInputFormatter>? inputFormatters;
  
  const ShokoModernTextField({super.key,
    required this.controller, this.style, this.isOutline,
    this.onChange, this.validator,
    this.isEnabled = true,
    this.isError = false, this.errorText, this.errorTextStyle,
    this.label, this.labelTextStyle,
    this.enableColor, this.disableColor, this.focusColor, this.errorColor,
    this.keyboardType,
    this.maxSymbols, this.minSymbols, this.obscureText = false,
    this.suffix,
    this.inputFormatters,
    this.maxLines
  });

  @override
  State<ShokoModernTextField> createState() => _ShokoModernTextFieldState();
}

class _ShokoModernTextFieldState extends State<ShokoModernTextField> {

  final FocusNode focusNode = FocusNode();
  bool isError = false;
  String value = '';

  @override
  void initState() {
    isError = widget.isError;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ShokoModernTextField oldWidget) {
    setState(() {
      isError = widget.isError;
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    // widget.controller.dispose();
    // focusNode.dispose();
    super.dispose();
  }

  submit(String value) {
    widget.onChange?.call(value);
    
    bool validatorResult = true;
    if (widget.validator != null) {
      validatorResult = widget.validator!(value);
    }

    setState(() {
      isError = !validatorResult;
    });
  }

  Color getWidgetColor() {
    final theme = context.theme.textFieldTheme;
    
    if (!widget.isEnabled) {//if code widget is disabled
      return widget.disableColor ?? theme.disableColor;
    }
    //if code widget enabled and not focused
    if (focusNode.hasFocus) {
      return widget.focusColor ?? theme.focusColor;
    }

    if (widget.isError) {
      return widget.errorColor ?? theme.errorColor;
    }

    return widget.enableColor ?? theme.enableColor;
  }


  @override
  Widget build(BuildContext context) {
    final theme = context.theme.textFieldTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Focus(
          onFocusChange: (value) {
            !value ? submit(this.value) : setState(() {});
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
            decoration: BoxDecoration(
              color: widget.isOutline ?? theme.isOutline ? null : getWidgetColor(),
              borderRadius: SRadii.mediumPlus.get(),
              border: widget.isOutline ?? theme.isOutline ? Border.all(
                width: 1,
                color: getWidgetColor()
              ) : null
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onSubmitted: submit,
                    onTapOutside: (event) => focusNode.unfocus(),
                    onChanged: (value) => this.value = value,
                    controller: widget.controller,
                    focusNode: focusNode,
                    cursorColor: theme.cursorColor,
                    readOnly: !widget.isEnabled,
                    autocorrect: true,
                    enableSuggestions: true,
                    obscureText: widget.obscureText,
                    inputFormatters: widget.inputFormatters,
                    keyboardType: widget.keyboardType,
                    maxLength: widget.maxSymbols,
                    maxLines: widget.maxLines ?? 1,
                    decoration: InputDecoration(
                      enabled: widget.isEnabled,
                      counterText: '',
                      contentPadding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
                      label: (widget.label != null) ? Text(widget.label!) : null,
                      labelStyle: (widget.labelTextStyle ?? theme.labelTextStyle ?? TextStyle(color: focusNode.hasFocus ? widget.focusColor : (widget.isEnabled ? isError ? widget.errorColor ?? theme.errorColor: (widget.enableColor ?? theme.enableColor) : widget.disableColor ?? theme.disableColor))),
                      border: InputBorder.none
                    ),
                    style: ((widget.style ?? theme.style) ?? const TextStyle(color: Colors.black, fontSize: 16)).copyWith(color: !widget.isEnabled ? (widget.disableColor ?? theme.disableColor) : null),
                  ),
                ),
                if(widget.suffix != null) ... [
                  widget.suffix!,
                  const Gap(20)
                ],
              ],
            )
          )
        ),
        if (isError && widget.errorText != null) (Text(widget.errorText!, style: widget.errorTextStyle ?? theme.errorTextStyle ?? TextStyle(color: widget.errorColor ?? theme.errorColor),))
      ]
    );
  }
}
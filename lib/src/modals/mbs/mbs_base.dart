import 'package:flutter/material.dart';
import 'package:shoko_ui/shoko_ui.dart';

class MBSBase extends StatelessWidget {
  final String? label;
  final Widget? content;
  final Widget? bottom;

  final double? height;
  final bool labelOnCenter;
  final bool expandContent;

  ///Don't forget to turn it on scrolling in showModalBottomSheet / showMBS
  final bool kIsFullHeight;

  final MainAxisAlignment? mainAxisAlignment;

  final EdgeInsets? margin;
  final EdgeInsets? padding;

  final Function()? userAccept;
  final Function()? onCancel;

  const MBSBase({
    super.key,
    this.label,
    this.content,
    this.height,
    this.onCancel,
    this.labelOnCenter = true,
    this.kIsFullHeight = false,
    this.expandContent = false,
    this.bottom,
    this.mainAxisAlignment,
    this.padding,
    this.margin,
  }) : userAccept = null;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: height,
        width: MediaQuery.of(context).size.width,
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
        margin: margin ?? EdgeInsets.only(left: 0, right: 0, bottom: MediaQuery.of(context).viewInsets.bottom, top: 0),
        decoration: BoxDecoration(color: context.theme.backgroundTheme.primary, borderRadius: const BorderRadius.all(Radius.circular(16))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: kIsFullHeight ? MainAxisSize.max : MainAxisSize.min,
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 5,
                width: 50,
                margin: const EdgeInsets.symmetric(vertical: 5.5),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
            if (label != null) ...[_buildLabelAtPosition(context), const Gap(16)],
            _buildExpandedContent(),
            if (bottom != null) ...[
              const Gap(16),
              bottom!,
            ],
            const Gap(16),
          ],
        ),
      ),
    );
  }

  Widget _buildLabelAtPosition(BuildContext context) {
    return labelOnCenter
        ? Center(child: Text(label!, style: context.theme.contentStyles.title1(weight: FontWeight.w500)))
        : Text(label!, style: context.theme.contentStyles.title1(weight: FontWeight.w500));
  }

  Widget _buildExpandedContent() {
    return expandContent ? Expanded(child: content!) : content!;
  }
}

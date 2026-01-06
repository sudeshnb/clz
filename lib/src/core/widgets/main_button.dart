import 'package:clz/src/core/animations/animation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? text;
  final Widget? child;
  final IconData? icon;
  final Color backgroundColor;
  final Color textColor;
  final Color? iconColor;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final List<BoxShadow>? shadow;
  final double? iconGap;
  final TextStyle? textStyle;
  final Color disabledColor;
  final Color disabledTextColor;
  final Border? border;

  const CustomButton({
    super.key,
    this.onPressed,
    this.text,
    this.child,
    this.icon,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
    this.iconColor,
    this.borderRadius = 8.0,
    this.padding = const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    this.shadow,
    this.iconGap = 8.0,
    this.textStyle,
    this.disabledColor = Colors.grey,
    this.disabledTextColor = Colors.white70,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    final bool isEnabled = onPressed != null;
    final effectiveBgColor = isEnabled ? backgroundColor : disabledColor;
    final effectiveTextColor = isEnabled ? textColor : disabledTextColor;
    final effectiveIconColor = iconColor ?? textColor;

    return MouseRegion(
      cursor: isEnabled ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: ShrinkAnimation(
        onPressed: onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: effectiveBgColor,
            borderRadius: BorderRadius.circular(borderRadius),
            border: border,
            boxShadow: shadow ?? _defaultShadow(),
          ),
          child: Material(
            color: Colors.transparent,
            child: Padding(
              padding: padding,
              child: _buildContent(
                effectiveTextColor,
                isEnabled ? effectiveIconColor : disabledTextColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(Color textColor, Color iconColor) {
    final textWidget = text != null
        ? Text(
            text!.tr(),
            textAlign: TextAlign.center,
            style: (textStyle ?? TextStyle()).copyWith(
              color: textColor,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          )
        : SizedBox();

    return child ??
        (icon != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, color: iconColor, size: 20),
                  SizedBox(width: iconGap),
                  textWidget,
                ],
              )
            : textWidget);
  }

  static List<BoxShadow> _defaultShadow() => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.1),
      offset: const Offset(0, 2),
      blurRadius: 4,
      spreadRadius: 0,
    ),
  ];
}

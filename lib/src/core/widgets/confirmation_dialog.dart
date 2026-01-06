import 'package:clz/src/core/constants/constants.dart';
import 'package:clz/src/core/extensions/extensions.dart';
import 'package:clz/src/core/services/navigator_service.dart';
import 'package:clz/src/core/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'main_button.dart';

class AppConfirmationDialog {
  static Future<bool?> show({
    IconData icon = Icons.warning_rounded,
    String title = 'Confirmation Required',
    String content = 'Are you sure you want to perform this action?',
    String confirmText = 'Confirm',
    String cancelText = 'Cancel',
    String? tapText,
    Color? iconColor = Colors.blueAccent,
    Color? dialogColor,
    Color? titleColor,
    Color? contentColor,
    Color? confirmColor = Colors.blue,
    Color? cancelColor,
    BorderRadiusGeometry borderRadius = const BorderRadius.all(
      Radius.circular(20),
    ),
    List<BoxShadow>? shadow,
    double iconSize = 48,
    EdgeInsetsGeometry padding = const EdgeInsets.all(20),
  }) async {
    final context = NavigatorService.key.currentState?.overlay?.context;
    if (context == null) {
      debugPrint('Navigator key not initialized!');
      return null;
    }

    return await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) => _CustomConfirmationDialog(
        icon: icon,
        title: title,
        content: content,
        confirmText: confirmText,
        cancelText: cancelText,
        iconColor: iconColor,
        dialogColor: dialogColor,
        titleColor: titleColor,
        contentColor: contentColor,
        confirmColor: confirmColor,
        cancelColor: cancelColor,
        borderRadius: borderRadius,
        shadow: shadow,
        iconSize: iconSize,
        padding: padding,
        tapText: tapText,
      ),
    );
  }
}

class _CustomConfirmationDialog extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;
  final String confirmText;
  final String cancelText;
  final String? tapText;

  final Color? iconColor;
  final Color? dialogColor;
  final Color? titleColor;
  final Color? contentColor;
  final Color? confirmColor;
  final Color? cancelColor;
  final BorderRadiusGeometry borderRadius;
  final List<BoxShadow>? shadow;
  final double iconSize;
  final EdgeInsetsGeometry padding;

  const _CustomConfirmationDialog({
    required this.icon,
    required this.title,
    required this.content,
    required this.confirmText,
    required this.cancelText,
    this.tapText,
    this.iconColor,
    this.dialogColor,
    this.titleColor,
    this.contentColor,
    this.confirmColor,
    this.cancelColor,
    required this.borderRadius,
    this.shadow,
    required this.iconSize,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: AppColor.transparent,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: dialogColor ?? context.theme.cardColor,
          borderRadius: borderRadius,
          boxShadow: shadow ?? _CustomConfirmationDialog._defaultShadow(),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: iconSize, color: iconColor),
            20.verticalSpace,
            Text(
              title.tr(),
              style: context.textTheme.bodyLarge?.copyWith(
                color: titleColor ?? context.theme.text,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            15.verticalSpace,
            Text(
              content.tr(),
              style: context.textTheme.bodyMedium!.copyWith(
                color: contentColor ?? context.theme.text,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            if (tapText != null) ...[
              10.verticalSpace,
              Text(
                tapText!.tr(),
                style: context.textTheme.bodyMedium!.copyWith(
                  color: contentColor ?? context.theme.text,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildActionButton(
                  text: cancelText,
                  color: cancelColor ?? AppColor.danger,
                  onPressed: () => NavigatorService.goBack(value: false),
                ),
                10.horizontalSpace,
                _buildActionButton(
                  text: confirmText,
                  color: confirmColor ?? context.theme.icon,
                  onPressed: () => NavigatorService.goBack(value: true),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required String text,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Expanded(
      child: CustomButton(
        onPressed: onPressed,
        text: text,
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
      ),
    );
  }

  static List<BoxShadow> _defaultShadow() => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.2),
      blurRadius: 12,
      spreadRadius: 2,
      offset: const Offset(0, 4),
    ),
  ];
}

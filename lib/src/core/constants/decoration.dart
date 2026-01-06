import 'package:clz/src/core/constants/constants.dart';
import 'package:clz/src/core/extensions/build_context_extension.dart';
import 'package:clz/src/core/theme/theme.dart';
import 'package:clz/src/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDecoration {
  final BuildContext context;
  AppDecoration(this.context);

  BoxDecoration get iconCircularButton => BoxDecoration(
    color: context.theme.scaffoldBackgroundColor,
    borderRadius: BorderRadius.circular(100.r),
    boxShadow: [
      BoxShadow(
        color: Colors.black12.withValues(alpha: 0.3),
        offset: const Offset(0, 3),
        blurRadius: 10.0,
      ),
    ],
  );

  static BoxDecoration top(Color color) => BoxDecoration(
    gradient: LinearGradient(
      colors: [color.withValues(alpha: 0.0), color],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    ),
  );
  static BoxDecoration left(Color color) => BoxDecoration(
    gradient: LinearGradient(
      colors: [color.withValues(alpha: 0.0), color],
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
    ),
  );
  static BoxDecoration right(Color color) => BoxDecoration(
    gradient: LinearGradient(
      colors: [color.withValues(alpha: 0.0), color],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ),
  );

  BoxDecoration get orderCard => BoxDecoration(
    borderRadius: BorderRadius.circular(12.r),
    color: context.theme.card,
    boxShadow: [
      BoxShadow(
        color: Colors.black12.withValues(alpha: 0.1),
        offset: Offset(0, 3),
        blurRadius: 15.0,
      ),
    ],
  );

  BoxDecoration get textBox => BoxDecoration(
    color: context.theme.cardColor,
    borderRadius: BorderRadius.circular(100.r),
  );

  BoxDecoration get errorTextBox => BoxDecoration(
    color: context.theme.cardColor,
    borderRadius: BorderRadius.circular(100.r),
    border: Border.all(color: AppColor.danger),
  );

  BoxDecoration get expansionTileCard => BoxDecoration(
    color: context.theme.card,
    borderRadius: BorderRadius.circular(10.r),
    boxShadow: [
      BoxShadow(
        color: Colors.black12.withValues(alpha: 0.1),
        offset: Offset(0, 2),
        blurRadius: 12.0,
      ),
    ],
  );

  BoxDecoration get highlightTileCard => BoxDecoration(
    color: context.theme.card,
    borderRadius: BorderRadius.circular(10.r),
    border: Border.all(color: context.theme.icon),
    boxShadow: [
      BoxShadow(
        color: Colors.black12.withValues(alpha: 0.1),
        offset: Offset(0, 2),
        blurRadius: 12.0,
      ),
    ],
  );

  BoxDecoration get modalBottomSheet => BoxDecoration(
    color: context.theme.scaffoldBackgroundColor,
    borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
  );

  BoxDecoration get foodCard => BoxDecoration(
    borderRadius: BorderRadius.circular(12.r),
    color: context.theme.card,
    boxShadow: [
      BoxShadow(
        color: Colors.black12.withValues(alpha: 0.2),
        offset: Offset(0, 5),
        blurRadius: 10.0,
      ),
    ],
  );
}

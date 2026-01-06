import 'package:clz/src/core/extensions/extensions.dart';
import 'package:clz/src/core/theme/theme.dart';
import 'package:clz/src/core/widgets/image.view.dart';
import 'package:clz/src/core/widgets/main_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorView extends StatelessWidget {
  final String message;
  const ErrorView({super.key, required this.message, this.onRetry});
  final Function? onRetry;
  @override
  Widget build(BuildContext context) {
    // String imagePath = ExceptionImageHelper.getExceptionImagePath(message);
    String imagePath = message;

    // String errorMessage = ExceptionImageHelper.getExceptionMsg(message);
    String errorMessage = message;

    return Center(
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImageView(imagePath: imagePath, width: 100.w),
            20.verticalSpace,
            Text(
              context.tr(message),
              textAlign: TextAlign.center,
              style: context.textTheme.displaySmall,
            ),
            20.verticalSpace,
            Text(
              context.tr(errorMessage),
              textAlign: TextAlign.center,
              style: context.textTheme.bodyLarge,
            ),
            30.verticalSpace,
            if (onRetry != null) ...[
              Text(
                context.tr('exception.tap_msg.retry'),
                style: context.textTheme.bodyMedium,
              ),
              10.verticalSpace,
              CustomButton(
                text: context.tr('lbl.retry'),
                borderRadius: 50.r,
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 50.w),
                backgroundColor: context.theme.icon,
                textColor: context.theme.textOpposite,
                textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                ),
                onPressed: () => onRetry!(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

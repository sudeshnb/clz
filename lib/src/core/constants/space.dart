import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSpace {
  // static SizedBox get h10 => SizedBox(height: 10.h);
  static SizedBox get h10 => 10.horizontalSpace;

  static SizedBox get v10 => 10.verticalSpace;

  static SizedBox get shrink => const SizedBox.shrink();
}

class AppPadding {
  final BuildContext context;
  AppPadding(this.context);

  ///
  /// Horizontal Padding
  ///
  static EdgeInsets get h20 => EdgeInsets.symmetric(horizontal: 20.w);

  ///
  /// Vertical Padding
  ///
  static EdgeInsets get v5 => EdgeInsets.symmetric(vertical: 5.h);

  ///
  /// Horizontal and Vertical Padding
  ///
  static EdgeInsets get h20v5 =>
      EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h);

  ///
  /// ALL Padding
  ///
  static EdgeInsets get all10 => EdgeInsets.all(10.sp);
  static EdgeInsets get all20 => EdgeInsets.all(20.w);

  ///
  /// Custom Padding
  ///
  double get keyboardBottom => MediaQuery.of(context).viewInsets.bottom;

  //  EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w);
}

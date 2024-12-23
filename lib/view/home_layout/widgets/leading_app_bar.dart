import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/Colors/colors.dart';

Widget leadingAppBar() {
  return Padding(
    padding: EdgeInsets.only(left: 5.h),
    child: Padding(
      padding:  EdgeInsets.symmetric(vertical: 15.h),
      child: Container(
          width: 140.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: mainColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/logo.png'),
          )),
    ),
  );
}

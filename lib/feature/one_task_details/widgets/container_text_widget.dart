import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/shared/Colors/colors.dart';


Widget containerTextWidget(String text, IconData icon) {
  return Container(
    width: 326.w,
    height: 50.h,
    decoration: BoxDecoration(
      color: Colors.purple.shade50,
      borderRadius: BorderRadius.circular(10.r),
      border: Border.all(color: Colors.transparent),
    ),
    child: Center(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
                color: mainColor, fontSize: 16.sp, fontWeight: FontWeight.w700),
          ),
          Spacer(),
          Icon(
            icon,
            size: 18,
            color: mainColor,
          )
        ],
      ),
    )),
  );
}

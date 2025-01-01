import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/shared/Colors/colors.dart';

Widget containerTextWidget(
    {required String text, IconData? icon, required Function() onTap}) {
  return Container(
    height: 50.h,
    decoration: BoxDecoration(
      color: Colors.purple.shade50,
      borderRadius: BorderRadius.circular(10.r),
      border: Border.all(color: Colors.transparent),
    ),
    child: Center(
        child: Padding(
      padding: EdgeInsets.only(left: 15.w, right: 5.w),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
                color: mainColor, fontSize: 16.sp, fontWeight: FontWeight.w700),
          ),
          Spacer(),
          IconButton(
              onPressed: onTap,
              icon: Icon(
                icon,
                size: 18,
                color: mainColor,
              )),
        ],
      ),
    )),
  );
}

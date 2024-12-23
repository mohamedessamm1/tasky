import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/shared/extension/extencion.dart';

import '../Colors/colors.dart';

Widget customButton({required Function() onTap, required String text, icon}) {
  return InkWell(
    onTap: onTap,
    child: SizedBox(
      width: 331.w,
      height: 49.h,
      child: Card(
        color: mainColor,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              5.pw,
              icon == null
                  ? SizedBox()
                  : Image.asset(
                      'assets/images/arrow.png',
                      width: 25.w,
                      height: 25.h,
                    )
            ],
          ),
        ),
      ),
    ),
  );
}

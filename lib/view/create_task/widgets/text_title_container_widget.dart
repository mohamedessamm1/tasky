import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/shared/extension/extencion.dart';

Widget textTitleContainerWidget(String text) {
  return Column(
    children: [
      20.ph,
      Text(
        text,
        style: TextStyle(
            color: Colors.grey, fontSize: 12.sp, fontWeight: FontWeight.w400),
      ),
      5.ph,
    ],
  );
}

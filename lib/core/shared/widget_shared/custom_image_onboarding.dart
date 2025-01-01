import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customImageOnboarding() {
  return Image.asset(
    'assets/images/on_boarding.png',
    width: double.infinity.w,
    height: 450.h,
    fit: BoxFit.cover,
  );
}

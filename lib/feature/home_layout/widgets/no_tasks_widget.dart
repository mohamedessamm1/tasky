import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:tasky/core/shared/extension/extencion.dart';



Widget noTasksWidget() {
  return Column(
    children: [
      20.ph,
      Center(
        child: Lottie.network(
            'https://lottie.host/77e1d9e8-74ed-4de4-be1b-28a202173729/OCORhEwS02.json'),
      ),
      20.ph,
      Text(
        'No Tasks Yet',
        style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: Colors.grey),
      ),
    ],
  );
}
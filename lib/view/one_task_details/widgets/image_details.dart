import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget imageDetails({required String image}) {
  return ClipRRect(
      borderRadius: BorderRadius.circular(20.r), // Image border
      child: SizedBox.fromSize(
        child: Container(
            width: 375.w,
            height: 225.h,
            decoration: BoxDecoration(),
            child: SizedBox(
              child: Image.network(
                image,
                width: 375.w,
                height: 225.h,
                fit: BoxFit.cover,
              ),
            )),
      ));
}

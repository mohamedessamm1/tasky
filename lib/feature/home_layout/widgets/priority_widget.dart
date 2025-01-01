import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/shared/extension/extencion.dart';

Widget priorityWidget({required data}) {
  return   Row(
    children: [
      if (data == 'high')...{
        SizedBox(
          width: 150.w,
          child: Row(
            children: [
              Icon(
                Icons.flag,
                color: Colors.red,
                size: 14.w,
              ),
              4.pw,
              Text(data,
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.red)),
            ],
          ),
        ),

      }
      else if (data == 'medium')...{
        SizedBox(
          width: 150.w,
          child: Row(
            children: [
              Icon(
                Icons.flag,
                color: Colors.blue,
                size: 14.w,
              ),
              4.pw,
              Text(data,
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue)),
            ],
          ),
        ),
      }
      else if (data == 'low')...{
        SizedBox(
          width: 150.w,
          child: Row(
            children: [
              Icon(
                Icons.flag,
                color: Colors.green,
                size: 14.w,
              ),
              4.pw,
              Text(data,
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.green)),
            ],
          ),
        ),
      }
    ],
  );

}
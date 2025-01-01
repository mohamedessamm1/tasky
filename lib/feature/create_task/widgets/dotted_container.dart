import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/shared/extension/extencion.dart';

import '../../../core/shared/Cache/local_cache.dart';
import '../../../core/shared/Colors/colors.dart';
import '../view_model/create_tasks_cubit.dart';


Widget dottedContainer({context}) {
  return CacheHelper.getdata(key: 'image') == null
      ? InkWell(
          onTap: () {
            CreateTasksCubit.get(context).pickImage(context: context);
          },
          child: DottedBorder(
            color: mainColor,
            strokeWidth: 1,
            borderType: BorderType.RRect,
            radius: Radius.circular(10.r),
            child: SizedBox(
                height: 56.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.image,
                      color: mainColor,
                    ),
                    7.pw,
                    Text(
                      'Add image',
                      style: TextStyle(
                          color: mainColor,
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )),
          ),
        )
      : DottedBorder(
          color: Colors.green,
          strokeWidth: 1,
          borderType: BorderType.RRect,
          radius: Radius.circular(10.r),
          child: SizedBox(
              height: 56.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.image,
                    color: Colors.green,
                  ),
                  7.pw,
                  Text(
                    'Image Added Successfully',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              )),
        );
}

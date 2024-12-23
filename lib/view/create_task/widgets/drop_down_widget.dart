import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/shared/extension/extencion.dart';

import '../../../shared/Colors/colors.dart';
import '../../../shared/widget_shared/drop_down_widget.dart';
import '../../../view_model/create_tasks_controller/create_tasks_cubit.dart';

Widget dropDownPriority({required context}) {
  return dropDownWidget(
      context: context,
      items: [
        DropdownMenuItem<String>(
            value: 'medium',
            child: Row(
              children: [
                Icon(
                  Icons.flag,
                  size: 18,
                  color: mainColor,
                ),
                5.pw,
                Text(
                  'medium',
                  style: TextStyle(
                      color: mainColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700),
                ),
              ],
            )),
        DropdownMenuItem<String>(
            value: 'low',
            child: Row(
              children: [
                Icon(
                  Icons.flag,
                  size: 18,
                  color: mainColor,
                ),
                5.pw,
                Text(
                  'low',
                  style: TextStyle(
                      color: mainColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700),
                ),
              ],
            )),
        DropdownMenuItem<String>(
            value: 'high',
            child: Row(
              children: [
                Icon(
                  Icons.flag,
                  size: 18,
                  color: mainColor,
                ),
                5.pw,
                Text(
                  'high',
                  style: TextStyle(
                      color: mainColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700),
                ),
              ],
            )),
      ],
      value: CreateTasksCubit.get(context).dropDownValue,
      onchanged: CreateTasksCubit.get(context));
}

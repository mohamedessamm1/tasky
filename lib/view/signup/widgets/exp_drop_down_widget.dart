import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../view_model/sign_up_controller/sign_up_cubit.dart';

Widget expDropDownWidget({required context}) {
  return Container(
    width: 326.w,
    height: 50.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.r),
      border: Border.all(color: Colors.grey),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: DropdownButton<String>(
        underline: Container(),
        borderRadius: BorderRadius.circular(10.r),
        value: SignUpCubit.get(context).dropDownValue,
        isExpanded: true,
        icon: const Icon(Icons.keyboard_arrow_down_sharp),
        elevation: 16,
        style: TextStyle(
            color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500),
        onChanged: (String? value) {
          SignUpCubit.get(context).dropDownChange(value);
        },
        items: [
          DropdownMenuItem(
            value: 'not available',
            child: Text('Choose experience Level'),
          ),
          DropdownMenuItem(
            value: 'junior',
            child: Text('junior'),
          ),
          DropdownMenuItem(
            value: 'midLevel',
            child: Text('midLevel'),
          ),
          DropdownMenuItem(
            value: 'senior',
            child: Text('senior'),
          ),
        ],
      ),
    ),
  );
}

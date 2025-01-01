import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../Colors/colors.dart';

Widget numberFormField({controller}) {
  return SizedBox(
    width: 326.w,
    height: 70.h,
    child: IntlPhoneField(
      dropdownIconPosition: IconPosition.trailing,
      decoration: InputDecoration(
        hintStyle: TextStyle(
            fontSize: 16.sp, fontWeight: FontWeight.w400, color: Colors.grey),
        hintText: '01021811321',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: mainColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
      ),
      initialCountryCode: 'EG',
      onChanged: (phone) {
        controller.text = phone.completeNumber;
      },
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/view_model/profile_controller/profile_cubit.dart';

Widget containerDataProfile(
    {required title, required data, required isCopied, required context}) {
  return SizedBox(
    width: double.infinity,
    height: 70.h,
    child: Card(
      elevation: 0,
      color: Colors.grey.shade200,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  data,
                  style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            Spacer(),
            isCopied == true
                ? IconButton(
                    icon: Icon(Icons.copy, color: Colors.grey.shade700),
                    onPressed: () {
                      ProfileCubit.get(context)
                          .getProfileData(context: context);
                      Clipboard.setData(ClipboardData(text: data));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Copied to clipboard: $data')),
                      );
                    },
                  )
                : SizedBox(),
          ],
        ),
      ),
    ),
  );
}

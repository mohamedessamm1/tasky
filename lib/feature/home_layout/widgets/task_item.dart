import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/shared/extension/extencion.dart';

import '../../../core/shared/widget_shared/Navigator.dart';
import '../../task_details/view/task_details_screen.dart';
import 'priority_widget.dart';


Widget taskItem({required int index, context, required base}) {
  return InkWell(
    onTap: () {
      Navigation().navigateTo(
          context: context,
          screenName: TaskDetailsScreen(
            image: "https://todo.iraqsapp.com/images/${base[index]['image']}",
            title: base[index]['title'],
            id: base[index]['_id'],
            desc: base[index]['desc'],
            priority: base[index]['priority'],
            status: base[index]['status'],
          ));
    },
    child: SizedBox(
      height: 96.h,
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(20.r), // Image border
              child: SizedBox.fromSize(
                child: Container(
                    width: 64.w,
                    height: 64.h,
                    decoration: BoxDecoration(),
                    child: SizedBox(
                        child: Image.network(
                      "https://todo.iraqsapp.com/images/${base[index]['image']}",
                      fit: BoxFit.cover,
                    ))),
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              5.ph,
              Row(
                children: [
                  10.pw,
                  SizedBox(
                    width: 160.w,
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      base[index]['title'],
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                  ),
                  30.pw,

                  SizedBox(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      color: Colors.red.shade50,
                      child: Padding(
                        padding: EdgeInsets.all(4.0.w),
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          '${base[index]['status']}',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.red),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  10.pw,
                  SizedBox(
                    width: 240.w,
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      base[index]['desc'],
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  10.pw,
                    priorityWidget(data: base[index]['priority']),
                  40.pw,
                  Text(
                    '12/12/2022',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  )
                ],
              )
            ],
          )
        ],
      ),
    ),
  );
}

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/shared/extension/extencion.dart';
import 'package:tasky/feature/one_task_details/view_model/one_task_details_cubit.dart';

import '../../task_details/widgets/container_text_widget.dart';
import '../../task_details/widgets/generate_qr_widget.dart';
import '../../task_details/widgets/image_details.dart';

class OneTaskDetailsScreen extends StatelessWidget {
  final String id;

  const OneTaskDetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          OneTaskDetailsCubit()..getTaskDetails(context: context, id: id),
      child: BlocBuilder<OneTaskDetailsCubit, OneTaskDetailsState>(
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  'Task Details',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              body: ConditionalBuilder(
                condition: OneTaskDetailsCubit.get(context).taskDetails != null,
                builder: (context) => SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(14.0.w),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          20.ph,
                          imageDetails(
                              image: OneTaskDetailsCubit.get(context)
                                  .taskDetails['image']),
                          20.ph,
                          Text(
                            textAlign: TextAlign.start,
                            OneTaskDetailsCubit.get(context)
                                .taskDetails['title'],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w700),
                          ),
                          20.ph,
                          Text(
                            textAlign: TextAlign.start,
                            OneTaskDetailsCubit.get(context)
                                .taskDetails['desc'],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          20.ph,
                          containerTextWidget(
                              text: '12/12/2022',
                              onTap: () {},
                              icon: Icons.calendar_month),
                          20.ph,
                          containerTextWidget(
                              text: OneTaskDetailsCubit.get(context)
                                  .taskDetails['status'],
                              onTap: () {},
                              icon: Icons.flag),
                          20.ph,
                          containerTextWidget(
                              text: OneTaskDetailsCubit.get(context)
                                  .taskDetails['priority'],
                              onTap: () {},
                              icon: Icons.star),
                          20.ph,
                          generateQrWidget(id: id),
                        ],
                      ),
                    ),
                  ),
                ),
                fallback: (context) => Center(
                  child: CircularProgressIndicator(),
                ),
              ));
        },
      ),
    );
  }
}

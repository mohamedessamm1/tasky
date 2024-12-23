import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/shared/Colors/colors.dart';
import 'package:tasky/shared/extension/extencion.dart';
import 'package:tasky/shared/widget_shared/drop_down_widget.dart';
import 'package:tasky/view/task_details/widgets/container_text_widget.dart';
import 'package:tasky/view/task_details/widgets/generate_qr_widget.dart';
import 'package:tasky/view/task_details/widgets/image_details.dart';
import 'package:tasky/view_model/task_Details_controller/task_details_cubit.dart';

class TaskDetailsScreen extends StatelessWidget {
  final String image;
  final String title;
  final String desc;
  final String priority;
  final String status;
  final String id;

  const TaskDetailsScreen(
      {Key? key,
      required this.image,
      required this.title,
      required this.desc,
      required this.priority,
      required this.id,
      required this.status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskDetailsCubit(),
      child: BlocBuilder<TaskDetailsCubit, TaskDetailsState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      TaskDetailsCubit.get(context)
                          .editTask(id: id, context: context);
                    },
                    icon: Icon(
                      Icons.save,
                      color: Colors.green,
                    )),
                PopupMenuButton(
                  shadowColor: mainColor,
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text(
                        'Delete',
                        style: TextStyle(color: Colors.red),
                      ),
                      onTap: () {
                        TaskDetailsCubit.get(context)
                            .deleteTask(id: id, context: context);
                      },
                    )
                  ],
                ),
              ],
              title: Text(
                'Task Details',
                style: TextStyle(color: Colors.black),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(14.0.w),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      20.ph,
                      imageDetails(image: image),
                      20.ph,
                      Text(
                        textAlign: TextAlign.start,
                        "$title",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700),
                      ),
                      20.ph,
                      Text(
                        textAlign: TextAlign.start,
                        desc,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      20.ph,
                      containerTextWidget(
                          text: '12/12/2022',
                          icon: Icons.date_range,
                          onTap: () {}),
                      20.ph,
                      dropDownWidget(
                          context: context,
                          items: [
                            DropdownMenuItem<String>(
                                value: 'status',
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.flag,
                                      size: 18,
                                      color: mainColor,
                                    ),
                                    5.pw,
                                    Text(
                                      'status',
                                      style: TextStyle(
                                          color: mainColor,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                )),
                            DropdownMenuItem<String>(
                                value: 'waiting',
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.flag,
                                      size: 18,
                                      color: mainColor,
                                    ),
                                    5.pw,
                                    Text(
                                      'waiting',
                                      style: TextStyle(
                                          color: mainColor,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                )),
                            DropdownMenuItem<String>(
                                value: 'Inprogress',
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.flag,
                                      size: 18,
                                      color: mainColor,
                                    ),
                                    5.pw,
                                    Text(
                                      'Inprogress',
                                      style: TextStyle(
                                          color: mainColor,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                )),
                            DropdownMenuItem<String>(
                                value: 'finished',
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.flag,
                                      size: 18,
                                      color: mainColor,
                                    ),
                                    5.pw,
                                    Text(
                                      'finished',
                                      style: TextStyle(
                                          color: mainColor,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                )),
                          ],
                          value: TaskDetailsCubit.get(context).dropDownValue,
                          onchanged: TaskDetailsCubit.get(context)),
                      20.ph,
                      containerTextWidget(
                          text: priority, icon: Icons.flag, onTap: () {}),
                      20.ph,
                      generateQrWidget(id: id),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

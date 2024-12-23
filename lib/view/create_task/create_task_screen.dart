import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/shared/Cache/local_cache.dart';
import 'package:tasky/shared/Colors/colors.dart';
import 'package:tasky/shared/extension/extencion.dart';
import 'package:tasky/shared/widget_shared/custom_button_widget.dart';
import 'package:tasky/shared/widget_shared/custom_text_field.dart';
import 'package:tasky/view/create_task/widgets/dotted_container.dart';
import 'package:tasky/view/create_task/widgets/drop_down_widget.dart';
import 'package:tasky/view/create_task/widgets/text_title_container_widget.dart';
import 'package:tasky/view_model/create_tasks_controller/create_tasks_cubit.dart';

class CreateTaskScreen extends StatelessWidget {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateTasksCubit(),
      child: BlocBuilder<CreateTasksCubit, CreateTasksState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Add new task',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    dottedContainer(context: context),
                    textTitleContainerWidget('Task Title'),
                    CustomTextField(
                      prefixIconColor: Colors.transparent,
                      suffixIconColor: Colors.transparent,
                      borderColor: Colors.grey,
                      focusBorderColor: mainColor,
                      enabledBorderColor: Colors.grey,
                      hintText: 'Enter title here...',
                      controller: titleController,
                    ),
                    textTitleContainerWidget('Task Description'),
                    CustomTextField(
                      keyboardType: TextInputType.multiline,
                      prefixIconColor: Colors.transparent,
                      suffixIconColor: Colors.transparent,
                      borderColor: Colors.grey,
                      focusBorderColor: mainColor,
                      enabledBorderColor: Colors.grey,
                      hintText: 'Enter description here...',
                      controller: descController,
                    ),
                    textTitleContainerWidget('Priority'),
                    dropDownPriority(context: context),
                    20.ph,
                    state is CreateTaskLoadingState
                        ? Center(child: CircularProgressIndicator())
                        : customButton(
                            onTap: () {
                              CacheHelper.getdata(key: 'image') == null?
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Center(child: Text('please add image')),
                                ),
                              ):

                              CreateTasksCubit.get(context).createTask(
                                  context: context,
                                  title: titleController.text,
                                  description: descController.text);
                            },
                            text: 'Add Task'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

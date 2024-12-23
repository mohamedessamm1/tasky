import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/shared/extension/extencion.dart';
import 'package:tasky/view/home_layout/widgets/floating_buttons_widgets.dart';
import 'package:tasky/view/home_layout/widgets/leading_app_bar.dart';
import 'package:tasky/view/home_layout/widgets/no_tasks_widget.dart';
import 'package:tasky/view/home_layout/widgets/tab_bar_widget.dart';
import 'package:tasky/view/profile/profile_screen.dart';
import 'package:tasky/view_model/home_layout_controller/home_layout_cubit.dart';

import '../../shared/widget_shared/Navigator.dart';

class HomeLayoutScreen extends StatelessWidget {
  const HomeLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeLayoutCubit()..getAllTasks(context: context),
      child: BlocBuilder<HomeLayoutCubit, HomeLayoutState>(
        builder: (context, state) {
          return Scaffold(
            floatingActionButton: floatingButton(context: context),
            appBar: AppBar(
              leading: leadingAppBar(),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigation().navigateTo(
                          context: context, screenName: ProfileScreen());
                    },
                    icon: Icon(
                      Icons.person_outline_rounded,
                      color: Colors.black,
                    )),
                IconButton(
                    onPressed: () async {
                      await HomeLayoutCubit.get(context).logout(context);
                    },
                    icon: Icon(
                      Icons.logout_rounded,
                      color: Colors.red,
                    )),
              ],
            ),
            body: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(10.w),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'My Tasks',
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    10.ph,
                    HomeLayoutCubit.get(context).allTasks.isEmpty
                        ? noTasksWidget()
                        : tabBarWidget(context)
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

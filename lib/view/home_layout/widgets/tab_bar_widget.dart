import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/view/home_layout/widgets/all_tasks.dart';
import 'package:tasky/view/home_layout/widgets/finished_list.dart';
import 'package:tasky/view/home_layout/widgets/inprogress_list.dart';
import 'package:tasky/view/home_layout/widgets/waiting_list.dart';

import '../../../shared/Colors/colors.dart';

Widget tabBarWidget(context) {
  return Expanded(
    child: DefaultTabController(
      length: 4,
      child: Column(
        children: <Widget>[
          ButtonsTabBar(
            // Customize the appearance and behavior of the tab bar
            backgroundColor: mainColor,
            borderWidth: 2,
            borderColor: Colors.transparent,
            unselectedBackgroundColor: Colors.deepPurple.shade50,
            unselectedBorderColor: Colors.transparent,
            radius: 24.r,
            labelStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
            // Add your tabs here
            tabs: const [
              Tab(text: '    All    '),
              Tab(text: '  Inpogress  '),
              Tab(text: '  Waiting  '),
              Tab(text: '  Finished  '),
            ],
          ),
          Expanded(
            child: TabBarView(children: [
              Center(
                child: AllTasks(),
              ),
              Center(
                child: inprogressList(context: context),
              ),
              Center(
                child: waitingList(context: context),
              ),
              Center(
                child: finishedList(context: context),
              ),
            ]),
          ),
        ],
      ),
    ),
  );
}

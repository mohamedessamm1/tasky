import 'package:flutter/material.dart';
import 'package:tasky/view/home_layout/widgets/task_item.dart';

import '../../../view_model/home_layout_controller/home_layout_cubit.dart';

Widget finishedList({required BuildContext context}) {
  return ListView.builder(
    itemCount: HomeLayoutCubit.get(context).finishedItems.length,
    itemBuilder: (context, index) {
      return taskItem(
          index: index,
          context: context,
          base: HomeLayoutCubit.get(context).finishedItems);
    },
  );
}

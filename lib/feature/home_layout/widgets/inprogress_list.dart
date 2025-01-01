import 'package:flutter/material.dart';
import 'package:tasky/feature/home_layout/widgets/task_item.dart';

import '../view_model/home_layout_cubit.dart';

Widget inprogressList({required BuildContext context}) {
  return ListView.builder(
    itemCount: HomeLayoutCubit.get(context).inProgressItems.length,
    itemBuilder: (context, index) {
      return taskItem(
          index: index,
          context: context,
          base: HomeLayoutCubit.get(context).inProgressItems);
    },
  );
}

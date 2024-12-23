import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/view/home_layout/widgets/task_item.dart';
import 'package:tasky/view_model/home_layout_controller/home_layout_cubit.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeLayoutCubit, HomeLayoutState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: HomeLayoutCubit.get(context).allTasks.length,
          itemBuilder: (context, index) {
            return taskItem(
                index: index,
                context: context,
                base: HomeLayoutCubit.get(context).allTasks);
          },
        );
      },
    );
  }
}

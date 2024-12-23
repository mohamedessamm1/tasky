import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasky/repository/edit_task_repository/edit_task_api.dart';

part 'task_details_state.dart';

class TaskDetailsCubit extends Cubit<TaskDetailsState> {
  TaskDetailsCubit() : super(TaskDetailsInitial());

  static TaskDetailsCubit get(context) => BlocProvider.of(context);

  String? dropDownValue = 'status';

  dropDownChange(String? value) {
    dropDownValue = value;
    emit(DropDownValueState());
  }

  editTask({required id, required context}) {
    emit(EditLoadingTaskState());
    EditTaskApi().editTask(
        dropDownValue: dropDownValue.toString(), context: context, id: id);
  }

  deleteTask({required id, required context}) {
    emit(DeleteLoadingTaskState());
    EditTaskApi().deleteTask(context: context, id: id);
    emit(DeleteTaskSuccessState());
  }
}

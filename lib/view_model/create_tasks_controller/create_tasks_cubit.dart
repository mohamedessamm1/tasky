import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/repository/create_task_repository/create_task_api.dart';

part 'create_tasks_state.dart';

class CreateTasksCubit extends Cubit<CreateTasksState> {
  CreateTasksCubit() : super(CreateTasksInitial());

  static CreateTasksCubit get(context) => BlocProvider.of(context);

  String? dropDownValue = 'medium';

  dropDownChange(String? value) {
    dropDownValue = value;
    emit(DropDownValueState());
  }

  Future<void> pickImage({required context}) async {
    CreateTaskApi().pickImage(context: context).then((value) {
      emit(ProfileimgSuccess());
    }).catchError((e) {
      emit(ProfileimgError());
    });
  }

  createTask(
      {required String title, required String description, required context}) {
    emit(CreateTaskLoadingState());
    CreateTaskApi()
        .createTask(
      context: context,
      description: description.toString(),
      title: title.toString(),
      dropDownValue: dropDownValue.toString(),
    )
        .then((value) {
      emit(CreateTaskSuccessState());
    }).catchError((e) {
      emit(CreateTaskErrorState());
    });
  }
}

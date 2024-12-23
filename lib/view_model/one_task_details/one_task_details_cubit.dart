import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasky/repository/one_task_repository/one_task_api.dart';

part 'one_task_details_state.dart';

class OneTaskDetailsCubit extends Cubit<OneTaskDetailsState> {
  OneTaskDetailsCubit() : super(OneTaskDetailsInitial());

  static OneTaskDetailsCubit get(context) => BlocProvider.of(context);
  var taskDetails;

  getTaskDetails({required context, required id}) {
    emit(GetTaskDetailsLoadingState());
    OneTaskApi().getOneTask(context: context, id: id).then((value) {
      print(value);
      taskDetails = value;

      emit(GetTaskDetailsSuccessState());
    });
  }
}

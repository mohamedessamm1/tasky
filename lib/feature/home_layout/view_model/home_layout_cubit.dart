import 'package:flutter_bloc/flutter_bloc.dart';

import '../home_repository/home_api.dart';
part 'home_layout_state.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutState> {
  HomeLayoutCubit() : super(HomeLayoutInitial());

  static HomeLayoutCubit get(context) => BlocProvider.of(context);

  List allTasks = [];
  List waitingItems = [];
  List inProgressItems = [];
  List finishedItems = [];

  getAllTasks({required context}) async {
    emit(GetAllTasksLoadingState());
    HomeApi().getAllTasks(context: context).then(
      (value) {
        allTasks = value;
        waitingItems =
            allTasks.where((item) => item['status'] == 'waiting').toList();

        inProgressItems =
            allTasks.where((item) => item['status'] == 'Inprogress').toList();

        finishedItems =
            allTasks.where((item) => item['status'] == 'finished').toList();
        emit(GetAllTasksSuccessState());
      },
    );
  }

  logout(context) async {
    HomeApi().logOut(context: context);
    emit(LogoutSuccessState());
  }

  refreshToken(context) async {
    HomeApi().refreshToken(context: context);
    emit(RefreshTokenState());
  }
}

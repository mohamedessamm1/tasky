import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../login_repository/login_api.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;
  IconData passwordOff = Icons.visibility_off;
  IconData passwordOn = Icons.visibility;

  IconData? suffixIcon = Icons.visibility_off;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    isPassword == true ? suffixIcon = passwordOff : suffixIcon = passwordOn;
    emit(ChangePasswordVisibilityState());
  }

  login({required String number, required String password, required context}) {
    emit(LoginLoadingState());
    LoginApi().login(number, password, context).then(
      (value) {
        emit(LoginSuccessState());
      },
    ).catchError((e) {
      emit(LoginErrorState());
    });
  }
}

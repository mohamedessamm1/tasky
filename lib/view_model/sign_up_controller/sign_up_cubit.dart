import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/register_repository/signup_api.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  static SignUpCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;
  IconData passwordOff = Icons.visibility_off;
  IconData passwordOn = Icons.visibility;

  IconData? suffixIcon = Icons.visibility_off;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    isPassword == true ? suffixIcon = passwordOff : suffixIcon = passwordOn;
    emit(ChangePasswordVisibilityState());
  }

  String? dropDownValue = 'not available';

  dropDownChange(String? value) {
    dropDownValue = value;
    emit(DropDownValueState());
  }

  signUp({
    String number = '',
    String password = '',
    context,
    String name = '',
    address,
    yearsOfExperience,
  }) {
    emit(SignUpLoadingState());
    SignupApi()
        .signUp(
            number: number,
            password: password,
            context: context,
            name: name,
            address: address,
            yearsOfExperience: yearsOfExperience,
            exp: dropDownValue.toString())
        .then((value) {
      emit(SignUpSuccessState());
    });
  }
}

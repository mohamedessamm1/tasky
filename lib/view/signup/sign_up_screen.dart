import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/shared/Colors/colors.dart';
import 'package:tasky/shared/extension/extencion.dart';
import 'package:tasky/shared/widget_shared/Navigator.dart';
import 'package:tasky/shared/widget_shared/custom_button_widget.dart';
import 'package:tasky/shared/widget_shared/custom_image_onboarding.dart';
import 'package:tasky/shared/widget_shared/custom_text_field.dart';
import 'package:tasky/shared/widget_shared/number_form_field.dart';
import 'package:tasky/view/signup/widgets/exp_drop_down_widget.dart';
import 'package:tasky/view_model/sign_up_controller/sign_up_cubit.dart';

import '../../shared/widget_shared/switch_login_signin_widget.dart';
import '../login/login_screen.dart';

class SignUpScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController yearsExpController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocBuilder<SignUpCubit, SignUpState>(
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
                child: SingleChildScrollView(
                    child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  20.ph,
                  customImageOnboarding(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontSize: 24.sp, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        12.ph,
                        CustomTextField(
                            controller: nameController,
                            hintText: 'Name',
                            prefixIconColor: Colors.grey,
                            suffixIconColor: Colors.grey,
                            borderColor: Colors.grey,
                            focusBorderColor: mainColor,
                            enabledBorderColor: Colors.grey),
                        12.ph,
                        numberFormField(controller: numberController),
                        12.ph,
                        CustomTextField(
                            controller: yearsExpController,
                            hintText: 'Years of experience...',
                            prefixIconColor: Colors.grey,
                            suffixIconColor: Colors.grey,
                            borderColor: Colors.grey,
                            focusBorderColor: mainColor,
                            enabledBorderColor: Colors.grey),
                        12.ph,
                        expDropDownWidget(context: context),
                        12.ph,
                        CustomTextField(
                            controller: addressController,
                            hintText: 'Address...',
                            prefixIconColor: Colors.grey,
                            suffixIconColor: Colors.grey,
                            borderColor: Colors.grey,
                            focusBorderColor: mainColor,
                            enabledBorderColor: Colors.grey),
                        12.ph,
                        CustomTextField(
                            controller: passwordController,
                            suffixTab: () {
                              SignUpCubit.get(context)
                                  .changePasswordVisibility();
                            },
                            obscureText: SignUpCubit.get(context).isPassword,
                            suffixIcon: SignUpCubit.get(context).suffixIcon,
                            hintText: 'Password...',
                            enabledBorderColor: Colors.grey,
                            focusBorderColor: mainColor,
                            prefixIconColor: Colors.grey,
                            suffixIconColor: Colors.grey,
                            borderColor: Colors.grey),
                        12.ph,
                        state is !SignUpLoadingState ?  customButton(
                            onTap: () {
                              SignUpCubit.get(context).signUp(
                                number: numberController.text,
                                password: passwordController.text,
                                context: context,
                                name: nameController.text,
                                address: addressController.text,
                                yearsOfExperience: yearsExpController.text,
                              );
                            },
                            text: 'Sign Up'):CircularProgressIndicator(),

                        12.ph,
                        switchLoginSignInWidget(
                            currentScreen: 'signup',
                            onTap: () {
                              Navigation().navigateTo(
                                  context: context, screenName: LoginScreen());
                            }),
                        12.ph,
                      ],
                    ),
                  )
                ],
              ),
            ))),
          );
        },
      ),
    );
  }
}

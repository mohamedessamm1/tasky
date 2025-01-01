import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/shared/extension/extencion.dart';
import 'package:tasky/feature/login/view_model/login_cubit.dart';
import '../../../core/shared/Colors/colors.dart';
import '../../../core/shared/widget_shared/Navigator.dart';
import '../../../core/shared/widget_shared/custom_button_widget.dart';
import '../../../core/shared/widget_shared/custom_image_onboarding.dart';
import '../../../core/shared/widget_shared/custom_text_field.dart';
import '../../../core/shared/widget_shared/number_form_field.dart';
import '../../../core/shared/widget_shared/switch_login_signin_widget.dart';
import '../../signup/view/sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController numberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocBuilder<LoginCubit, LoginState>(
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
                                Text('Login',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w700,
                                    )),
                              ],
                            ),
                            15.ph,
                            numberFormField(
                              controller: numberController,
                            ),
                            15.ph,
                            CustomTextField(
                                controller: passwordController,
                                suffixTab: () {
                                  LoginCubit.get(context)
                                      .changePasswordVisibility();
                                },
                                obscureText: LoginCubit.get(context).isPassword,
                                suffixIcon: LoginCubit.get(context).suffixIcon,
                                hintText: 'Password...',
                                enabledBorderColor: Colors.grey,
                                focusBorderColor: mainColor,
                                prefixIconColor: Colors.grey,
                                suffixIconColor: Colors.grey,
                                borderColor: Colors.grey),
                            15.ph,
                            state is! LoginLoadingState
                                ? customButton(
                                    onTap: () {
                                      LoginCubit.get(context).login(
                                        context: context,
                                        number: numberController.text,
                                        password: passwordController.text,
                                      );
                                    },
                                    text: 'Sign In')
                                : CircularProgressIndicator(
                                    color: mainColor,
                                  ),
                            15.ph,
                            switchLoginSignInWidget(
                              currentScreen: 'login',
                              onTap: () {
                                Navigation().navigateTo(
                                    context: context,
                                    screenName: SignUpScreen());
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

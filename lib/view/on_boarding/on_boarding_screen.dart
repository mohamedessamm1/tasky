import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/shared/extension/extencion.dart';
import 'package:tasky/shared/widget_shared/Navigator.dart';
import 'package:tasky/shared/widget_shared/custom_button_widget.dart';
import 'package:tasky/shared/widget_shared/custom_image_onboarding.dart';
import 'package:tasky/view/login/login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                30.ph,
                customImageOnboarding(),
                Text(
                  'Task Management &\nTo-Do List',
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700),
                ),
                15.ph,
                Text(
                  'This productive tool is designed to help \nyou better manage your task \nproject-wise conveniently!',
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                ),
                20.ph,
                customButton(
                  onTap: () {
                    Navigation().navigateAndRemove(
                        context: context, screenName: LoginScreen());
                  },
                  text: 'Let’s Start',
                  icon: true,
                )
              ],
            ),
          ),
        ));
  }
}

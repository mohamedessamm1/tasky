import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/shared/Cache/local_cache.dart';
import '../../core/shared/Colors/colors.dart';
import '../../core/shared/widget_shared/Navigator.dart';
import '../home_layout/view/home_layout_screen.dart';
import '../on_boarding/on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  late AnimationController animationControllern;
  late Animation<Offset> slidingAnimationn;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2800));

    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 10), end: Offset.zero)
            .animate(animationController);

    animationController.forward();

    animationControllern = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2800));

    slidingAnimationn =
        Tween<Offset>(begin: const Offset(0, -10), end: Offset.zero)
            .animate(animationController);

    animationControllern.forward();

    Future.delayed(const Duration(seconds: 7), () async {
      CacheHelper.getdata(key: 'refresh_token') != null
          ? Navigation()
              .navigateAndRemove(context: context, screenName: HomeLayoutScreen())
          : Navigation()
              .navigateAndRemove(context: context, screenName: OnBoardingScreen());
    });
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
    animationControllern.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              width: 150.w,
              'assets/images/logo.png',
            ),
          ],
        ),
      ),
    );
  }
}

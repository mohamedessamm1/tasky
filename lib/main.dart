import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/shared/Cache/local_cache.dart';
import 'core/shared/Dio/app_dio.dart';
import 'core/shared/bloc_observer/bloc_observer.dart';
import 'feature/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
  AppDioHelper.init();
  CacheHelper.initcache();
  Bloc.observer = AppBlocObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: 'dm'),
          home: const SplashScreen(),
        );
      },
    );
  }
}

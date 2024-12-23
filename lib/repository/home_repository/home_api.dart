import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tasky/repository/home_repository/home_repository.dart';

import '../../shared/Cache/local_cache.dart';
import '../../shared/Dio/App_Dio.dart';
import '../../shared/endpoints/endpoints.dart';
import '../../shared/widget_shared/Navigator.dart';
import '../../view/login/login_screen.dart';

class HomeApi extends HomeRepository {
  var data;
  var response;

  @override
  Future getAllTasks({context}) async {
    await refreshToken(context: context);
    response = await AppDioHelper.getData(
            url: getAllTasksEndpoint,
            token:
                'Bearer ${CacheHelper.getdata(key: 'access_token').toString()}')
        .then((value) {
      data = value.data;

      print(value.data);
    }).catchError((e) {
      DioError error = e as DioError;
      print(error.response!.statusCode);
      if (error.response!.statusCode == 401) {
        refreshToken(context: context);
      }
    });
    return data;
  }

  @override
  Future<void> refreshToken({context}) async {
    await AppDioHelper.getData(
            url:
                '$refreshTokenEndpoint${CacheHelper.getdata(key: 'refresh_token')}')
        .then(
      (value) {
        CacheHelper.savedata(
            key: 'access_token', value: value.data['access_token']);
        print(value.data);
      },
    );
  }

  @override
  Future<void> logOut({context}) async {
    CacheHelper.removedata(key: 'access_token');
    CacheHelper.removedata(key: 'refresh_token');
    Navigation().navigateAndRemove(context: context, screenName: LoginScreen());
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.green,
        content: Center(child: Text('log out successfully')),
      ),
    );
  }
}

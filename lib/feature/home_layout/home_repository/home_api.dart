import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../core/shared/Cache/local_cache.dart';
import '../../../core/shared/Dio/app_dio.dart';
import '../../../core/shared/endpoints/endpoints.dart';
import '../../../core/shared/widget_shared/Navigator.dart';
import '../../login/view/login_screen.dart';
import 'home_repository.dart';

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

    }).catchError((e) {
      DioException error = e as DioException;
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
      },
    );
  }

  @override
  Future<void> logOut({context}) async {
    await refreshToken(context: context);
    await AppDioHelper.postData(
        url: logOutEndpoint,
        token: 'Bearer ${CacheHelper.getdata(key: 'access_token').toString()}',
        data: {
          'token': CacheHelper.getdata(key: 'refresh_token'),
        }).then((value) {
          CacheHelper.removedata(key: 'access_token');
          CacheHelper.removedata(key: 'refresh_token');
          Navigation().navigateAndRemove(context: context, screenName: LoginScreen());
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Center(child: Text('log out successfully')),
            ),
          );
    });

  }
}

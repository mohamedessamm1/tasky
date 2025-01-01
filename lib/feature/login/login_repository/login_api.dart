import 'package:flutter/material.dart';
import '../../../core/shared/Cache/local_cache.dart';
import '../../../core/shared/Dio/app_dio.dart';
import '../../../core/shared/endpoints/endpoints.dart';
import '../../../core/shared/widget_shared/Navigator.dart';
import '../../home_layout/view/home_layout_screen.dart';
import 'login_repository.dart';

class LoginApi extends LoginRepository {
  @override
  Future<void> login(String number, String password, context) async {
    var data;
    await AppDioHelper.postData(
        url: loginEndpoint, data: {'phone': number, 'password': password}).then(
      (value) {
        CacheHelper.savedata(
            key: 'access_token', value: value.data['access_token']);
        CacheHelper.savedata(
            key: 'refresh_token', value: value.data['refresh_token']);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text('login successfully'),
          ),
        );
        Navigation().navigateAndRemove(
            context: context, screenName: HomeLayoutScreen());
      },
    ).catchError((e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('your password or number is wrong'),
        ),
      );
    });
    return data;
  }
}

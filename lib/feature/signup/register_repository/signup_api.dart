import 'package:flutter/material.dart';
import 'package:tasky/feature/signup/register_repository/signup_repository.dart';

import '../../../core/shared/Cache/local_cache.dart';
import '../../../core/shared/Dio/app_dio.dart';
import '../../../core/shared/widget_shared/Navigator.dart';
import '../../home_layout/view/home_layout_screen.dart';


class SignupApi extends SignupRepository {
  var response;
  @override
  Future<void> signUp(
      {required number,
      required password,
      context,
      required name,
      required address,
      required yearsOfExperience,
      required exp}) async {
    var data;
    response =await AppDioHelper.postData(url: '/auth/register', data: {
      'phone': number,
      'password': password,
      'displayName': name,
      'address': address,
      'experienceYears': yearsOfExperience,
      'level': exp
    }).then((value) {
      data = value.data;
      CacheHelper.savedata(
          key: 'access_token', value: value.data['access_token']);
      CacheHelper.savedata(
          key: 'refresh_token', value: value.data['refresh_token']);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text('sign up successfully'),
        ),
      );

      Navigation()
          .navigateAndRemove(context: context, screenName: HomeLayoutScreen());
    }).catchError((e) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text('correct your data and try again'),
          ),);
    });

    return data;
  }
}

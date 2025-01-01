import 'package:flutter/material.dart';
import 'package:tasky/core/shared/Dio/app_dio.dart';

import '../../../core/shared/Cache/local_cache.dart';
import '../../../core/shared/endpoints/endpoints.dart';
import '../../../core/shared/widget_shared/Navigator.dart';
import '../../home_layout/view/home_layout_screen.dart';
import 'edit_task_repository.dart';


class EditTaskApi extends EditTaskRepository {
  @override
  Future<void> editTask(
      {required String dropDownValue, required context, required id}) async {
    await refreshToken(context: context);
    await AppDioHelper.putData(
        url: "$createUpdateDetailsTaskEndpoint/$id",
        data: {"status": dropDownValue.toString()},
        token: "Bearer ${CacheHelper.getdata(key: 'access_token').toString()}");
    Navigation()
        .navigateAndRemove(context: context, screenName: HomeLayoutScreen());
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
  Future<void> deleteTask({required context, required id}) async {
    await AppDioHelper.deleteData(
            url: "$createUpdateDetailsTaskEndpoint/$id",
            token:
                "Bearer ${CacheHelper.getdata(key: 'access_token').toString()}")
        .then((value) {
      Navigation()
          .navigateAndRemove(context: context, screenName: HomeLayoutScreen());
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.green,
        content: Text('task deleted successfully'),
      ));
    });
  }
}

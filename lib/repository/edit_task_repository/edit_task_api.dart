import 'package:flutter/material.dart';
import 'package:tasky/repository/edit_task_repository/edit_task_repository.dart';
import 'package:tasky/shared/widget_shared/Navigator.dart';

import '../../shared/Cache/local_cache.dart';
import '../../shared/Dio/App_Dio.dart';
import '../../shared/endpoints/endpoints.dart';
import '../../view/home_layout/home_layout_screen.dart';

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
        print(value.data);
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

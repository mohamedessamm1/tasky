import 'package:tasky/repository/one_task_repository/one_task_repository.dart';

import '../../shared/Cache/local_cache.dart';
import '../../shared/Dio/App_Dio.dart';
import '../../shared/endpoints/endpoints.dart';

class OneTaskApi extends OneTaskRepository {
  var data;

  @override
  Future getOneTask({context, id}) async {
    refreshToken(context: context);
    await AppDioHelper.getData(
            url: '$createUpdateDetailsTaskEndpoint/$id',
            token:
                'Bearer ${CacheHelper.getdata(key: 'access_token').toString()}')
        .then((value) {
      data = value.data;
      print(value.data);
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
}

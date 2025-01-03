
import 'package:tasky/feature/profile/profile_repository/profile_repository.dart';

import '../../../core/shared/Cache/local_cache.dart';
import '../../../core/shared/Dio/app_dio.dart';
import '../../../core/shared/endpoints/endpoints.dart';

class ProfileApi extends ProfileRepository {
  var profileData;

  @override
  Future getProfile({context}) async {
    await refreshToken(context: context);
    await AppDioHelper.getData(
            url: profileEndpoint,
            token:
                "Bearer ${CacheHelper.getdata(key: 'access_token').toString()}")
        .then((value) {
      profileData = value.data;
    }).catchError((e) {
    });
    return profileData;
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
}

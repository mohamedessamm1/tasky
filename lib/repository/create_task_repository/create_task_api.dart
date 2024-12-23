import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tasky/repository/create_task_repository/ctreate_task_repository.dart';
import 'package:tasky/repository/home_repository/home_api.dart';

import '../../shared/Cache/local_cache.dart';
import '../../shared/Dio/App_Dio.dart';
import '../../shared/endpoints/endpoints.dart';
import '../../shared/widget_shared/Navigator.dart';
import '../../view/home_layout/home_layout_screen.dart';

class CreateTaskApi extends CreateTaskRepository {
  File? firstImageFile;
  String? imageUrl;

  @override
  Future<void> createTask({title, description, dropDownValue, context}) async {
    await refreshToken(context: context);
    await AppDioHelper.postData(
            url: createUpdateDetailsTaskEndpoint,
            data: {
              'image': CacheHelper.getdata(key: 'image').toString(),
              'title': title,
              'desc': description,
              'priority': dropDownValue,
            },
            token:
                "Bearer ${CacheHelper.getdata(key: 'access_token').toString()}")
        .then((value) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.green,
        content: Text('task created successfully'),
      ));
      Navigation()
          .navigateAndRemove(context: context, screenName: HomeLayoutScreen());

      HomeApi().getAllTasks(context: context);
      CacheHelper.removedata(key: 'image').print(value.data);
    }).catchError((e) {
      print(e.toString());
    });
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
        print(CacheHelper.getdata(key: 'access_token'));
      },
    );
  }

  @override
  Future<void> pickImage({context}) async {
    final picker = ImagePicker();
    final XFile? Image = await picker.pickImage(source: ImageSource.gallery);
    firstImageFile = await File(Image!.path);
    await uploadImage(context: context);
  }

  @override
  Future<void> uploadImage({context}) async {
    final request =
        http.MultipartRequest('POST', Uri.parse(uploadImageEndpoint));
    request.headers.addAll({
      "Authorization":
          "Bearer ${CacheHelper.getdata(key: 'access_token').toString()}",
      // Optional h
    });
    var multipartFile = await http.MultipartFile.fromPath(
      'image', // Field name in the server
      firstImageFile!.path,
      contentType: MediaType('image', 'jpeg'), // Use `htt
    );
    request.files.add(multipartFile);
    final response = await request.send();
    final responseBody = await response.stream.bytesToString();

    if (response.statusCode == 201) {
      Map<String, dynamic> jsonData = jsonDecode(responseBody);
      imageUrl = jsonData['image'];
      CacheHelper.savedata(key: 'image', value: imageUrl);
      print(imageUrl);

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.green,
        content: Text('image uploaded successfully'),
      ));
    }
    if (response.statusCode == 401) {
      CreateTaskApi().refreshToken(context: context);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text('so something went wrong please try again'),
      ));
    }
    if (response.statusCode == 400) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text('so something went wrong please login again'),
      ));
    }
    if (response.statusCode == 500) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text('so something went wrong please login again'),
      ));
    }
  }
}

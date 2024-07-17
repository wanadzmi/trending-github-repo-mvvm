import 'dart:io';
import 'package:dio/dio.dart';
import 'package:etiqa_github_repo/app/assets/constants.dart';
import 'package:etiqa_github_repo/app/models/network/my_response.dart';
import 'package:etiqa_github_repo/app/utils/util.dart';

class BaseServices {
  BaseServices() {
    _init();
  }

  static BaseServices? _instance;

  Dio? _dio;

  Dio? get dio {
    if (_instance == null || _instance?._dio == null) {
      _init();
    }
    return _instance?._dio;
  }

  void _init() {
    _instance = this;

    _dio = Dio(
      BaseOptions(
        headers: <String, String>{
          'Content-Type': ContentType.json.value,
        },
      ),
    );

    _dio?.interceptors.add(
      QueuedInterceptorsWrapper(),
    );
  }

  Future<MyResponse<dynamic, dynamic>> callAPI(
    HttpRequestType requestType,
    String path, {
    Map<String, dynamic>? postBody,
    Options? options,
    bool requiresAuth = true,
  }) async {
    try {
      dio?.options.contentType = Headers.jsonContentType;
      Response<dynamic>? response;

      switch (requestType) {
        case HttpRequestType.get:
          response = await dio?.get<dynamic>(path, options: options);
          break;
        case HttpRequestType.post:
          response =
              await dio?.post<dynamic>(path, data: postBody, options: options);
          break;
        case HttpRequestType.put:
          response =
              await dio?.put<dynamic>(path, data: postBody, options: options);
          break;
        case HttpRequestType.delete:
          response = await dio?.delete<dynamic>(path,
              data: postBody, options: options);
          break;
      }

      if (response?.statusCode == HttpStatus.ok ||
          response?.statusCode == HttpStatus.created) {
        return MyResponse.complete(response?.data);
      }
    } catch (e) {
      if (e is DioException &&
          e.response?.data != null &&
          e.response?.data != '') {
        return MyResponse.error(JsonParsing(e.response?.data).toJson());
      }
      return MyResponse.error(e);
    }
    final error = MyResponse<dynamic, dynamic>.error(
      DioException(
        requestOptions: RequestOptions(path: path),
      ),
    );

    return error;
  }
}

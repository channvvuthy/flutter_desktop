// ignore_for_file: unused_catch_clause, empty_catches, prefer_const_constructors, avoid_print

import 'package:dio/dio.dart';
import 'package:flutter_desktop/config/config.dart';

import 'dio_exception.dart';
// import 'package:flutter_desktop/helper/local_storage.dart';

class DioService {
  late final Dio _dio;

  initializeInterceptor() async {
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (DioError e, handler) {
      return handler.next(e);
    }));
  }

  void init() {
    _dio = Dio(BaseOptions(baseUrl: baseUrl, headers: {
      "accept": "application/json",
      "Content-Type": "multipart/form-data",
      "Authorization": basicAuth
    }));
    initializeInterceptor();
  }

  Future get(String endpoint) async {
    try {
      return await _dio.get(endpoint);
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      print(e);
      throw e.toString();
    }
  }

  // Future<Response> post(String endpoint, Map body) async {
  //   return 1;
  // }

  // Future<Response> delete(String endpoint, String id) async {
  //   return 1;
  // }

  // Future<Response> put(String endpoint, Map body) async {
  //   return 1;
  // }
}

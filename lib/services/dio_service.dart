// ignore_for_file: unused_catch_clause, empty_catches, prefer_const_constructors, avoid_print, unused_field, unnecessary_null_comparison

import 'package:dio/dio.dart';
import 'package:flutter_desktop/config/config.dart';

import 'dio_exception.dart';
// import 'package:flutter_desktop/helper/local_storage.dart';

class DioService {
  late final Dio _dio;
  late String _xtoken;

  var headers = {"accept": "application/json", "Authorization": basicAuth};

  initializeInterceptor() async {
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      if (_xtoken != null) {
        options.headers.addAll({"xtoken": _xtoken});
      }

      return handler.next(options);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (DioError e, handler) {
      return handler.next(e);
    }));
  }

  setToken(String token) {
    _xtoken = token;
  }

  void init() {
    _dio = Dio(BaseOptions(baseUrl: baseUrl, headers: headers));
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

  Future<Response> post(String endpoint, Map body) async {
    try {
      return await _dio.post(endpoint, data: body);
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      print(e);
      throw e.toString();
    }
  }

  // Future<Response> delete(String endpoint, String id) async {
  //   return 1;
  // }

  // Future<Response> put(String endpoint, Map body) async {
  //   return 1;
  // }
}

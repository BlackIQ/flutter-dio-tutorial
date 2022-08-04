import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_http_course/app/services/state.dart';
import 'package:provider/provider.dart';

class DioClient {
  final Dio _dio = Dio();

  final _baseUrl = 'http://192.168.1.5:8000/api';

  Future<Response> login(String username, String password) async {
    Map data = {
      "username": username,
      "password": password,
    };

    Response response;

    try {
      response = await _dio.post('$_baseUrl/user/login', data: data);

      return response;
    } on DioError catch (e) {
      response = e.response!;

      return response;
    }
  }

  void register(String username, String password) async {
    Map data = {
      "username": username,
      "password": password,
    };

    Response response;

    try {
      response = await _dio.post('$_baseUrl/user/register', data: data);

      print(response);
    } on DioError catch (e) {
      response = e.response!;

      print(response);
    }
  }
}
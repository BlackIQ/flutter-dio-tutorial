import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio();

  final _baseUrl = 'http://192.168.1.5:8000/api';

  Future<int> login(Map data) async {
    Response response;

    try {
      response = await _dio.post('$_baseUrl/user/login', data: data);

      return 200;
    } on DioError catch (e) {
      response = e.response!;

      return 401;
    }
  }

  Future<int> register(Map data) async {
    Response response;

    try {
      response = await _dio.post('$_baseUrl/user/register', data: data);

      return 200;
    } on DioError catch (e) {
      response = e.response!;

      return 401;
    }
  }
}
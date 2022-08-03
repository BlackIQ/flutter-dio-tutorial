import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio();

  final _baseUrl = 'http://192.168.1.5:8000/api';

  void login(Map data) async {
    Response response;

    try {
      response = await _dio.post('$_baseUrl/user/login', data: data);

      print(response.data);
    } on DioError catch (e) {
      response = e.response!;

      print(response.data['message']);
    }
  }

  void register(Map data) async {
    Response response;

    try {
      response = await _dio.post('$_baseUrl/user/register', data: data);

      print(response.data);
    } on DioError catch (e) {
      response = e.response!;

      print(response.data['message']);
    }
  }
}
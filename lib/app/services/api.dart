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

  Future<Response> register(String username, String password) async {
    Map data = {
      "username": username,
      "password": password,
    };

    Response response;

    try {
      response = await _dio.post('$_baseUrl/user/register', data: data);

      return response;
    } on DioError catch (e) {
      response = e.response!;

      return response;
    }
  }

  Future<Response> getUsers() async {
    Response response;

    try {
      response = await _dio.get('$_baseUrl/user/get/users');

      return response;
    } on DioError catch (e) {
      response = e.response!;

      return response;
    }
  }

  Future<Response> getUser(String id) async {
    Response response;

    try {
      response = await _dio.get('$_baseUrl/user/get/user/$id');

      return response;
    } on DioError catch (e) {
      response = e.response!;

      return response;
    }
  }
}
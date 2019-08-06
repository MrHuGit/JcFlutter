import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

/// author   Mr.Hu(Jc) flutter_learn
/// create   2019-07-09 11:20
/// describe
/// update

class Network {
  factory Network() => _getInstance();
  Dio dio;

  Network._internal() {
    // 或者通过传递一个 `BaseOptions`来创建dio实例
    BaseOptions options = new BaseOptions(
      baseUrl: "https://www.xx.com/api",
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    dio = new Dio(options);
  }

  static Network get instance => _getInstance();
  static Network _instance;

  static Network _getInstance() {
    if (_instance == null) {
      _instance = Network._internal();
    }
    return _instance;
  }
}

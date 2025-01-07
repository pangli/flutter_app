import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// 必须是顶层函数
Map<String, dynamic> _parseAndDecode(String response) {
  return jsonDecode(response) as Map<String, dynamic>;
}

Future<Map<String, dynamic>> parseJson(String text) {
  return compute(_parseAndDecode, text);
}

/// 添加常用Config
class ConfigInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options
      ..connectTimeout = const Duration(seconds: 60)
      ..sendTimeout = const Duration(seconds: 60)
      ..receiveTimeout = const Duration(seconds: 60);
    super.onRequest(options, handler);
  }
}

/// 子类需要重写
abstract class BaseResponseData {
  int code = 0;
  String message = '';
  dynamic data;

  bool get success;

  Headers? headers;

  // BaseResponseData({required this.code, required this.message, this.result});

  @override
  String toString() {
    return 'BaseRespData{code: $code, message: $message, data: $data}';
  }
}

/// 接口的code没有返回为true的异常
class NotSuccessException implements Exception {
  String message = '';

  NotSuccessException.fromRespData(BaseResponseData respData) {
    message = respData.message;
  }

  @override
  String toString() {
    return 'NotExpectedException{respData: $message}';
  }
}

/// 用于未登录等权限不够,需要跳转授权页面
class UnAuthorizedException implements Exception {
  const UnAuthorizedException();

  @override
  String toString() => 'UnAuthorizedException';
}

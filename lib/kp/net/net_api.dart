import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../base/net/base_net.dart';
import '../../base/util/platform_utils.dart';

final Dio dio = DioSingleton.getInstance();

class DioSingleton {
  static Dio? _instance;
  static final Object _lock = Object();

  static Dio getInstance() {
    if (_instance == null) {
      synchronized(_lock, () {
        _instance ??= Dio();
        // _instance?.transformer = DefaultTransformer()..jsonDecodeCallback = parseJson;
        _instance?.options.baseUrl =
            'https://raw.githubusercontent.com/pangli/NetworkJsonData/refs/heads/main/';
        _instance?.interceptors
          ?..add(ConfigInterceptor())
          ..add(HeaderInterceptor())
          ..add(ApiInterceptor())
          ..add(PrettyDioLogger(
              requestHeader: kDebugMode,
              requestBody: kDebugMode,
              responseHeader: kDebugMode));
      });
    }
    return _instance!;
  }

  static void synchronized(Object lock, Function action) {
    action();
  }

  void doSomething() {
    if (kDebugMode) {
      debugPrint("Factory-based DioSingleton");
    }
  }
}

class HeaderInterceptor extends InterceptorsWrapper {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    var versionCode = await PlatformUtils.getBuildNum();
    options
      ..headers['User-Identity'] = "SYS/Android;$versionCode"
      ..headers['platform'] = Platform.operatingSystem;
    super.onRequest(options, handler);
  }
}

class ApiInterceptor extends InterceptorsWrapper {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    ResponseData respData =
        ResponseData.fromJson(response.headers, jsonDecode(response.data));
    // ResponseData.fromJson(response.headers, response.data);
    if (respData.success) {
      response.data = respData.data;
      return handler.next(response);
    } else {
      if (respData.code == 1001 || respData.code == 1000) {
        throw const UnAuthorizedException(); // 需要登录
      } else {
        throw NotSuccessException.fromRespData(respData);
      }
    }
  }
}

class ResponseData extends BaseResponseData {
  @override
  bool get success => 0 == code;

  ResponseData.fromJson(
    Headers? headers,
    Map<String, dynamic> json,
  ) {
    this.headers = headers;
    code = json['code'];
    message = json['message'];
    data = json['data'];
  }
}

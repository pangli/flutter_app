import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../base/net/base_net.dart';
import '../../base/util/platform_utils.dart';

const isDebug = true;
final KpHttp kpHttp = KpHttp();

class KpHttp extends BaseHttp {
  @override
  void init() {
    options.baseUrl = 'https://server.khalaspay-ksa.com/';
    interceptors
      ..add(HeaderInterceptor())
      ..add(ApiInterceptor())
      ..add(PrettyDioLogger(
          requestHeader: isDebug,
          requestBody: isDebug,
          responseHeader: isDebug));
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
        ResponseData.fromJson(response.headers, response.data);
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
    data = json['result'];
  }
}

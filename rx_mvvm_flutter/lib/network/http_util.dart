import 'package:common_utils/common_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:plugin_cslog/plugin_cslog.dart';
import 'package:plugin_cslog/plugin_cslog.dart';

class HttpUtil {
  // 工厂模式
  static HttpUtil get instance => _getInstance();
  static HttpUtil _httpUtil;
  var _dio;

  static HttpUtil _getInstance() {
    if (_httpUtil == null) {
      _httpUtil = HttpUtil();
    }
    return _httpUtil;
  }

  HttpUtil() {
    BaseOptions options = BaseOptions(
      connectTimeout: 5000,
      receiveTimeout: 5000,
    );
    _dio = new Dio(options);
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      debugPrint("========================请求数据===================");
      debugPrint("url=${options.uri.toString()}");
      debugPrint("params=${options.data}");
      _dio.lock();
      //  await SharedPreferencesUtils.getToken().then((token) {
      //     options.headers[Strings.TOKEN] = token;
      //     print("X-Litemall-Token=${options.headers[Strings.TOKEN]}");
      //   });
      await PluginCslog.platformVersion.then((value) {
        debugPrint("platformVersion=${value}");
      });
      PluginCslog.d("platformVersion = message");
      _dio.unlock();
      return options;
    }, onResponse: (Response response) {
      debugPrint("========================请求数据===================");
      debugPrint("code=${response.statusCode}");
      debugPrint("response=${response.data}");
    }, onError: (DioError error) {
      debugPrint("========================请求错误===================");
      debugPrint("message =${error.message}");
    }));
  }

  Future get(String url,
      {Map<String, dynamic> parameters,
      Options options,
      CancelToken cancelToken}) async {
    Response response;
    try {
      if (parameters != null && options != null) {
        response = await _dio.get(url,
            queryParameters: parameters,
            options: options,
            cancelToken: cancelToken);
      } else if (parameters != null && options == null) {
        response = await _dio.get(url,
            queryParameters: parameters, cancelToken: cancelToken);
      } else if (parameters == null && options != null) {
        response =
            await _dio.get(url, options: options, cancelToken: cancelToken);
      } else {
        response = await _dio.get(url, cancelToken: cancelToken);
      }
    } on DioError catch (e) {
      debugPrint('postHttp exception: $e');
      formatError(e);
    }
    return response.data;
  }

  Future post(String url,
      {Map<String, dynamic> parameters,
      Options options,
      CancelToken cancelToken}) async {
    Response response;
    try {
      if (parameters != null && options != null) {
        response = await _dio.post(url,
            data: parameters, options: options, cancelToken: cancelToken);
      } else if (parameters != null && options == null) {
        response =
            await _dio.post(url, data: parameters, cancelToken: cancelToken);
      } else if (parameters == null && options != null) {
        response =
            await _dio.post(url, options: options, cancelToken: cancelToken);
      } else {
        response = await _dio.post(url, cancelToken: cancelToken);
      }
    } on DioError catch (e) {
      debugPrint('postHttp exception: $e');
      formatError(e);
    }
    return response.data;
  }

  //post Form请求
  postForm(url,
      {FormData data, Options options, CancelToken cancelToken}) async {
    Response response;
    try {
      response = await _dio.post(url,
          options: options, cancelToken: cancelToken, data: data);
    } on DioError catch (e) {
      debugPrint('postHttp exception: $e');
      formatError(e);
    }
    return response;
  }

  //下载文件
  downLoadFile(urlPath, savePath) async {
    Response response;
    try {
      response = await _dio.download(urlPath, savePath,
          onReceiveProgress: (int count, int total) {
        debugPrint('$count $total');
      });
    } on DioError catch (e) {
      debugPrint('downLoadFile exception: $e');
      formatError(e);
    }
    return response;
  }

  //取消请求
  cancleRequests(CancelToken token) {
    token.cancel("cancelled");
  }

  void formatError(DioError e) {
    if (e.type == DioErrorType.CONNECT_TIMEOUT) {
      debugPrint("连接超时");
    } else if (e.type == DioErrorType.SEND_TIMEOUT) {
      debugPrint("请求超时");
    } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
      debugPrint("响应超时");
    } else if (e.type == DioErrorType.RESPONSE) {
      debugPrint("出现异常");
    } else if (e.type == DioErrorType.CANCEL) {
      debugPrint("请求取消");
    } else {
      debugPrint("未知错误");
    }
  }
}

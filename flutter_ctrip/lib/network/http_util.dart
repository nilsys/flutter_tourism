import 'dart:convert';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'http_callbacks.dart';
import 'http_error.dart';
import 'http_request_method.dart';
import 'http_request.dart';

// 参考：https://www.jianshu.com/p/a6d52872e976
class HttpUtil {
  static final HttpUtil _instance = HttpUtil._init();
  static Dio _dio;
  static BaseOptions _options = getDefOptions();

  ///同一个CancelToken可以用于多个请求，当一个CancelToken取消时，所有使用该CancelToken的请求都会被取消，一个页面对应一个CancelToken。
  Map<String, CancelToken> _cancelTokens = Map<String, CancelToken>();

  factory HttpUtil() {
    return _instance;
  }

  HttpUtil._init() {
    _dio = new Dio();
  }

  // 添加拦截器
  addInterceptors(List<Interceptor> interceptors) {
    if (interceptors != null) {
      _dio.interceptors.addAll(interceptors);
    }
  }

  /// 取消网络请求
  void cancel(String tag) {
    if (_cancelTokens.containsKey(tag)) {
      if (!_cancelTokens[tag].isCancelled) {
        _cancelTokens[tag].cancel();
      }
      _cancelTokens.remove(tag);
    }
  }

  static BaseOptions getDefOptions() {
    BaseOptions options = BaseOptions();
    options.connectTimeout = 10 * 1000;
    options.receiveTimeout = 20 * 1000;
    options.contentType = 'application/x-www-form-urlencoded';
    return options;
  }

  setOptions(BaseOptions options) {
    _options = options;
    _dio.options = _options;
  }

  // get/post request
  Future<Map<String, dynamic>> sendRequest(Request request,
      {HttpSuccessCallback successCallback,
      HttpFailureCallback errorCallback}) {
    BaseOptions options = getDefOptions();
    options.connectTimeout = request.connectTimeout;
    options.receiveTimeout = request.receiveTimeout;
    if (request.header != null) {
      options.headers = request.header;
    }
    if (request.isPostJson) {
      options.contentType = 'application/json;charset=UTF-8';
    }
    setOptions(options);
    return _request(request,
        successCallback: successCallback, errorCallback: errorCallback);
  }

  // form request
  Future<Map<String, dynamic>> sendform(
      Request request,
      HttpSuccessCallback successCallback,
      HttpFailureCallback errorCallback) async {
    try {
      //检查网络是否连接
      ConnectivityResult connectivityResult =
          await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        print("请求网络异常，请稍后重试！");
        if (errorCallback != null) {
          errorCallback(HttpError(HttpError.NETWORK_ERROR, "网络异常，请稍后重试！"));
        }
        return null;
      }

      BaseOptions options = getDefOptions();
      options.connectTimeout = request.connectTimeout;
      options.receiveTimeout = request.receiveTimeout;
      if (request.header != null) {
        options.headers = request.header;
      }
      if (request.isPostJson) {
        options.contentType = 'application/json;charset=UTF-8';
      }
      _dio.options = options;

      if (!(request.params is FormData)) {
        print("params is FormData");
        return null;
      }
      CancelToken cancelToken;
      String tag = request.tag;
      if (tag != null) {
        cancelToken =
            _cancelTokens[tag] == null ? CancelToken() : _cancelTokens[tag];
        _cancelTokens[tag] = cancelToken;
      }
      FormData formData = request.params;
      Response response;
      switch (request.requestMethod) {
        case HttpRequestMethod.GET:
          if (formData.fields.isNotEmpty && formData.fields != null) {
            response = await _dio.get(request.url,
                queryParameters: Map.fromEntries(formData.fields));
          } else {
            response = await _dio.get(request.url, cancelToken: cancelToken);
          }
          break;
        case HttpRequestMethod.POST:
          if (formData.fields.isNotEmpty && formData.fields != null) {
            response = await _dio.post(request.url,
                data: request.params,
                queryParameters: request.params,
                cancelToken: cancelToken);
          } else {
            response = await _dio.post(request.url, cancelToken: cancelToken);
          }
          break;
      }
      print("请求链接：" +
          request.url +
          " 请求参数：" +
          json.encode(formData.fields == null ? {} : formData.fields));
      if (response.data is Map) {
        if (successCallback != null) {
          successCallback(response.data);
        }
        print("请求链接：" + request.url + " 响应结果：" + response.data.toString());
        return response.data;
      } else {
        if (successCallback != null) {
          successCallback(json.decode(response.data.toString()));
        }
        print("请求链接：" + request.url + " 响应结果：" + response.data.toString());
        return json.decode(response.data.toString());
      }
    } on DioError catch (e) {
      print("请求链接：" + request.url + " 错误：" + e.message);
      if (errorCallback != null && e.type != DioErrorType.CANCEL) {
        errorCallback(HttpError.dioError(e));
      }
      return null;
    } catch (e, s) {
      print("未知异常出错：$e\n$s");
      if (errorCallback != null) {
        errorCallback(HttpError(HttpError.UNKNOWN, "网络异常，请稍后重试！"));
      }
      return null;
    }
  }

  // file download request
  Future<Map<String, dynamic>> sendDownload(
      Request request,
      HttpSuccessCallback successCallback,
      HttpFailureCallback errorCallback,
      HttpProgressCallback progressCallback) async {
    try {
      //检查网络是否连接
      ConnectivityResult connectivityResult =
          await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        print("请求网络异常，请稍后重试！");
        if (errorCallback != null) {
          errorCallback(HttpError(HttpError.NETWORK_ERROR, "网络异常，请稍后重试！"));
        }
        return null;
      }

      BaseOptions options = getDefOptions();
      options.connectTimeout = request.connectTimeout;
      ////0代表不设置超时
      options.receiveTimeout = 0;
      _dio.options = options;

      CancelToken cancelToken;
      String tag = request.tag;
      if (tag != null) {
        cancelToken =
            _cancelTokens[tag] == null ? CancelToken() : _cancelTokens[tag];
        _cancelTokens[tag] = cancelToken;
      }

      var params = request.params ?? {};
      var url = _restfulUrl(request.url, params);

      Response response = await _dio.download(url, request.savePath,
          cancelToken: cancelToken,
          onReceiveProgress: progressCallback,
          queryParameters: params,
          data: params);
      print("请求链接：" +
          request.url +
          " 请求参数：" +
          json.encode(request.params == null ? {} : request.params));
      if (response.data is Map) {
        if (successCallback != null) {
          successCallback(response.data);
        }
        print("请求链接：" + request.url + " 响应结果：" + response.data.toString());
        return response.data;
      } else {
        if (successCallback != null) {
          successCallback(json.decode(response.data.toString()));
        }
        print("请求链接：" + request.url + " 响应结果：" + response.data.toString());
        return json.decode(response.data.toString());
      }
    } on DioError catch (e) {
      print("请求链接：" + request.url + " 错误：" + e.message);
      if (errorCallback != null && e.type != DioErrorType.CANCEL) {
        errorCallback(HttpError.dioError(e));
      }
    } catch (e, s) {
      print("未知异常出错：$e\n$s");
      if (errorCallback != null) {
        errorCallback(HttpError(HttpError.UNKNOWN, "网络异常，请稍后重试！"));
      }
      return null;
    }
  }

  Future<Map<String, dynamic>> _request(Request request,
      {HttpSuccessCallback successCallback,
      HttpFailureCallback errorCallback}) async {
    try {
      //检查网络是否连接
      ConnectivityResult connectivityResult =
          await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        print("请求网络异常，请稍后重试！");
        if (errorCallback != null) {
          errorCallback(HttpError(HttpError.NETWORK_ERROR, "网络异常，请稍后重试！"));
        }
        return null;
      }
      CancelToken cancelToken;
      String tag = request.tag;
      if (tag != null) {
        cancelToken =
            _cancelTokens[tag] == null ? CancelToken() : _cancelTokens[tag];
        _cancelTokens[tag] = cancelToken;
      }
      Response response;
      switch (request.requestMethod) {
        case HttpRequestMethod.GET:
          response = await _dio.get(request.url,
              queryParameters: request.params == null ? {} : request.params,
              cancelToken: cancelToken);
          break;
        case HttpRequestMethod.POST:
          if (request.params == null) {
            response = await _dio.post(request.url, cancelToken: cancelToken);
          } else {
            response = await _dio.post(request.url,
                data: request.params,
                queryParameters: request.params,
                cancelToken: cancelToken);
          }
          break;
      }
      print("请求链接：" +
          request.url +
          " 请求参数：" +
          json.encode(request.params == null ? {} : request.params));
      if (response.data is Map) {
        if (successCallback != null) {
          successCallback(response.data);
        }
        print("请求链接：" + request.url + " 响应结果：" + response.data.toString());
        return response.data;
      } else {
        if (successCallback != null) {
          successCallback(json.decode(response.data.toString()));
        }
        print("请求链接：" + request.url + " 响应结果：" + response.data.toString());
        return json.decode(response.data.toString());
      }
    } on DioError catch (e) {
      print("请求链接：" + request.url + " 错误：" + e.message);
      if (errorCallback != null && e.type != DioErrorType.CANCEL) {
        errorCallback(HttpError.dioError(e));
      }
      return null;
    } catch (e, s) {
      print("未知异常出错：$e\n$s");
      if (errorCallback != null) {
        errorCallback(HttpError(HttpError.UNKNOWN, "网络异常，请稍后重试！"));
      }
      return null;
    }
  }

  ///restful处理
  String _restfulUrl(String url, Map<String, dynamic> params) {
    // restful 请求处理
    // /gysw/search/hist/:user_id        user_id=27
    // 最终生成 url 为     /gysw/search/hist/27
    params.forEach((key, value) {
      if (url.indexOf(key) != -1) {
        url = url.replaceAll(':$key', value.toString());
      }
    });
    return url;
  }
}

import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'request_method.dart';
import 'request.dart';

class DioUtil {
  static final DioUtil _instance = DioUtil._init();
  static Dio _dio;
  static BaseOptions _options = getDefOptions();

  factory DioUtil() {
    return _instance;
  }

  DioUtil._init() {
    _dio = new Dio();
  }

  static BaseOptions getDefOptions() {
    BaseOptions options = BaseOptions();
    /*
    options.connectTimeout = 10 * 1000;
    options.receiveTimeout = 20 * 1000;
    options.contentType =
        ContentType.parse('application/x-www-form-urlencoded').value;

    Map<String, dynamic> headers = Map<String, dynamic>();
    headers['Accept'] = 'application/json';

    String platform;
    if (Platform.isAndroid) {
      platform = "Android";
    } else if (Platform.isIOS) {
      platform = "IOS";
    }
    headers['OS'] = platform;
    options.headers = headers;
    */

    return options;
  }

  setOptions(BaseOptions options) {
    _options = options;
    _dio.options = _options;
  }

  Future<Map<String, dynamic>> sendRequest(
      Request request, Function callback, Function errorCallBack) {
    BaseOptions options = getDefOptions();
    options.connectTimeout = request.connectTimeout;
    options.receiveTimeout = request.receiveTimeout;
    if (request.header != null) {
      options.headers = request.header;
    }
    if (request.isPostJson) {
      Map headers = options.headers;
      if (headers == null) {
        headers = Map();
      }
      headers["Content-Type"] = "application/json;charset=UTF-8";
    }
    setOptions(options);
    return _request(request, callBack: callback, errorCallBack: errorCallBack);
  }

  /**
   * 表单数据提交
   */
  /*
  FormData formData = FormData.fromMap({
    "name": "wendux",
    "age": 25,
    "file": await MultipartFile.fromFile("./text.txt",filename: "upload.txt"),
    "files": [
      await MultipartFile.fromFile("./text1.txt", filename: "text1.txt"),
      await MultipartFile.fromFile("./text2.txt", filename: "text2.txt"),
    ]
 });
   */
  Future<Map<String, dynamic>> form(
      Request request, Function callBack, Function errorCallBack) async {
    try {
      var dio = new Dio();
      BaseOptions options = getDefOptions();
      options.connectTimeout = request.connectTimeout;
      options.receiveTimeout = request.receiveTimeout;
      if (request.header != null) {
        options.headers = request.header;
      }
      if (request.isPostJson) {
        Map headers = options.headers;
        if (headers == null) {
          headers = Map();
        }
        headers["Content-Type"] = "application/json;charset=UTF-8";
      }
      dio.options = options;

      if (!(request.params is FormData)) {
        print("params is FormData");
        return null;
      }
      FormData formData = request.params;
      Response response;
      switch (request.requestMethod) {
        case Method.GET:
          response = await _dio.get(request.url,
              queryParameters: Map.fromEntries(formData.fields));
          break;
        case Method.POST:
          if (formData.fields.isNotEmpty) {
            response = await _dio.post(request.url, data: request.params);
          } else {
            response = await _dio.post(request.url);
          }
          break;
      }
      print("请求链接：" + request.url + "请求参数：" + json.encode(formData.fields));
      if (response.data is Map) {
        if (callBack != null) {
          callBack(response.data);
        }
        print("请求链接：" + request.url + "响应结果：" + response.data.toString());
        return response.data;
      } else {
        if (callBack != null) {
          callBack(json.decode(response.data.toString()));
        }
        print("请求链接：" + request.url + "响应结果：" + response.data.toString());
        return json.decode(response.data.toString());
      }
    } on DioError catch (e) {
      print("请求链接：" + request.url + "错误：" + e.message);
      // 请求错误处理
      /*
      Response errorResponse;
      if (e.response != null) {
        errorResponse = e.response;
      } else {
        errorResponse = new Response(statusCode: 201, statusMessage: e.message);
      }
      */
      _handleHttpError(errorCallBack, e);
      return null;
    }
  }

  Future<Map<String, dynamic>> _request(Request request,
      {Function callBack, Function errorCallBack}) async {
    try {
      Response response;
      String method = '';
      switch (request.requestMethod) {
        case Method.GET:
          method = MethodType.get;
          response = await _dio.request(request.url,
              queryParameters: request.params,
              options: Options(method: method));
          break;
        case Method.POST:
          method = MethodType.post;
          response = await _dio.request(request.url,
              data: request.params, options: Options(method: method));
          break;
      }
      print("请求链接：" +
          request.url +
          "请求参数：" +
          ((request.params is Map)
              ? json.encode(request.params)
              : request.params));
      if (response.data is Map) {
        if (callBack != null) {
          callBack(response.data);
        }
        print("请求链接：" + request.url + "响应结果：" + response.data.toString());
        return response.data;
      } else {
        if (callBack != null) {
          callBack(json.decode(response.data.toString()));
        }
        print("请求链接：" + request.url + "响应结果：" + response.data.toString());
        return json.decode(response.data.toString());
      }
    } on DioError catch (e) {
      print("请求链接：" + request.url + "错误：" + e.message);
      _handleHttpError(errorCallBack, e);
      return null;
    }
  }

  /// 处理Http错误码
  void _handleHttpError(Function errorCallback, DioError e) {
    if (e != null) {
      print(" ------------- Error Msg ------------" + e.toString());
      if (errorCallback != null) {
        errorCallback(e);
      }
      if (e.type == DioErrorType.CONNECT_TIMEOUT) {
        // It occurs when url is opened timeout.
        //ToastUtils.shortShort("连接超时");
      } else if (e.type == DioErrorType.SEND_TIMEOUT) {
        // It occurs when url is sent timeout.
        //ToastUtils.shortShort("请求超时");
      } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
        //It occurs when receiving timeout
        //ToastUtils.shortShort("响应超时");
      } else if (e.type == DioErrorType.RESPONSE) {
        // When the server response, but with a incorrect status, such as 404, 503...
        //ToastUtils.shortShort('无法访问服务器,请稍后再试');
      } else if (e.type == DioErrorType.CANCEL) {
        // When the request is cancelled, dio will throw a error with this type.
        //ToastUtils.shortShort("请求取消");
      } else {
        //DEFAULT Default error type, Some other Error. In this case, you can read the DioError.error if it is not null.
        //ToastUtils.shortShort("未知错误");
      }
    }
    print("<net> errorMsg :" + e.message);
  }
}

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
    String method = '';
    switch (request.requestMethod) {
      case Method.GET:
        method = MethodType.get;
        break;
      case Method.POST:
        method = MethodType.post;
        break;
    }
    BaseOptions options = getDefOptions();
    options.connectTimeout = request.connectTimeout;
    options.receiveTimeout = request.receiveTimeout;
    if (request.header != null) {
      options.headers = request.header;
    }
    setOptions(options);
    return _request(request.url,
        method: method,
        params: request.params,
        callBack: callback,
        errorCallBack: errorCallBack);
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
      dio.options = options;
      Response response = await dio.post(request.url, data: request.formData);
      if (response.data is Map) {
        if (callBack != null) {
          callBack(response.data);
        }
        return response.data;
      } else {
        if (callBack != null) {
          callBack(json.decode(response.data.toString()));
        }
        return json.decode(response.data.toString());
      }
    } on DioError catch (e) {
      _handleHttpError(errorCallBack, e);
      return null;
    }
  }

  Future<Map<String, dynamic>> _request(String path,
      {String method,
      Map<String, dynamic> params,
      Function callBack,
      Function errorCallBack}) async {
    try {
      Response response = await _dio.request(path,
          data: params,
          queryParameters: params,
          options: Options(method: method));
      if (response.data is Map) {
        if (callBack != null) {
          callBack(response.data);
        }
        return response.data;
      } else {
        if (callBack != null) {
          callBack(json.decode(response.data.toString()));
        }
        return json.decode(response.data.toString());
      }
    } on DioError catch (e) {
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

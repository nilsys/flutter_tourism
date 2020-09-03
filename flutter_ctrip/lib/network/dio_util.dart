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

  Future<Map<String, dynamic>> sendRequest(Request tRequest) {
    String method = '';
    switch (tRequest.requestMethod) {
      case Method.GET:
        method = MethodType.get;
        break;
      case Method.POST:
        method = MethodType.post;
        break;
    }
    BaseOptions options = getDefOptions();
    options.connectTimeout = tRequest.connectTimeout;
    options.receiveTimeout = tRequest.receiveTimeout;
    if (tRequest.header != null) {
      options.headers = tRequest.header;
    }
    setOptions(options);
    return request(tRequest.url, method: method, params: tRequest.params);
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
  Future<Map<String, dynamic>> form(Request tRequest) async {
    var dio = new Dio();
    Response response = await dio.post(tRequest.url, data: tRequest.formData);

    if (response.statusCode == HttpStatus.ok ||
        response.statusCode == HttpStatus.created) {
      try {
        if (response.data is Map) {
          return response.data;
        } else {
          return json.decode(response.data.toString());
        }
      } catch (e) {
        return null;
      }
    } else {
      _handleHttpError(response.statusCode);
      return null;
    }
  }

  Future<Map<String, dynamic>> request(String path,
      {String method, Map<String, dynamic> params}) async {
    Response response = await _dio.request(path,
        data: params,
        queryParameters: params,
        options: Options(method: method));

    if (response.statusCode == HttpStatus.ok ||
        response.statusCode == HttpStatus.created) {
      try {
        if (response.data is Map) {
          return response.data;
        } else {
          return json.decode(response.data.toString());
        }
      } catch (e) {
        return null;
      }
    } else {
      _handleHttpError(response.statusCode);
      return null;
    }
  }

  /// 处理Http错误码
  void _handleHttpError(int errorCode) {}
}

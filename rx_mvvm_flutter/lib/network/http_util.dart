import 'package:dio/dio.dart';

var dio;

class HttpUtil {
  // 工厂模式
  static HttpUtil get instance => _getInstance();

  static HttpUtil _httpUtil;

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
    dio = new Dio(options);
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      print("========================请求数据===================");
      print("url=${options.uri.toString()}");
      print("params=${options.data}");
      dio.lock();
      //  await SharedPreferencesUtils.getToken().then((token) {
      //     options.headers[Strings.TOKEN] = token;
      //     print("X-Litemall-Token=${options.headers[Strings.TOKEN]}");
      //   });
      dio.unlock();
      return options;
    }, onResponse: (Response response) {
      print("========================请求数据===================");
      print("code=${response.statusCode}");
      print("response=${response.data}");
    }, onError: (DioError error) {
      print("========================请求错误===================");
      print("message =${error.message}");
    }));
  }

  Future get(String url,
      {Map<String, dynamic> parameters,
      Options options,
      CancelToken cancelToken}) async {
    Response response;
    if (parameters != null && options != null) {
      response = await dio.get(url,
          queryParameters: parameters,
          options: options,
          cancelToken: cancelToken);
    } else if (parameters != null && options == null) {
      response = await dio.get(url,
          queryParameters: parameters, cancelToken: cancelToken);
    } else if (parameters == null && options != null) {
      response = await dio.get(url, options: options, cancelToken: cancelToken);
    } else {
      response = await dio.get(url, cancelToken: cancelToken);
    }
    return response.data;
  }

  Future post(String url,
      {Map<String, dynamic> parameters,
      Options options,
      CancelToken cancelToken}) async {
    Response response;
    if (parameters != null && options != null) {
      response = await dio.post(url,
          data: parameters, options: options, cancelToken: cancelToken);
    } else if (parameters != null && options == null) {
      response =
          await dio.post(url, data: parameters, cancelToken: cancelToken);
    } else if (parameters == null && options != null) {
      response =
          await dio.post(url, options: options, cancelToken: cancelToken);
    } else {
      response = await dio.post(url, cancelToken: cancelToken);
    }
    return response.data;
  }

  //post Form请求
  postForm(url, {data, options, cancelToken}) async {
    Response response;
    try {
      response = await dio.post(url,
          options: options, cancelToken: cancelToken, data: data);
      print('postHttp response: $response');
    } on DioError catch (e) {
      print('postHttp exception: $e');
      formatError(e);
    }
    return response;
  }

  //下载文件
  downLoadFile(urlPath, savePath) async {
    Response response;
    try {
      response = await dio.download(urlPath, savePath,
          onReceiveProgress: (int count, int total) {
        print('$count $total');
      });
      print('downLoadFile response: $response');
    } on DioError catch (e) {
      print('downLoadFile exception: $e');
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
      print("连接超时");
    } else if (e.type == DioErrorType.SEND_TIMEOUT) {
      print("请求超时");
    } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
      print("响应超时");
    } else if (e.type == DioErrorType.RESPONSE) {
      print("出现异常");
    } else if (e.type == DioErrorType.CANCEL) {
      print("请求取消");
    } else {
      print("未知错误");
    }
  }
}

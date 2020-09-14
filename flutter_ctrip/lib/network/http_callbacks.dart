import 'http_error.dart';

///http请求成功回调
typedef HttpSuccessCallback = void Function(Map<String, dynamic> data);

///失败回调
typedef HttpFailureCallback = void Function(HttpError data);

///失败回调
typedef HttpProgressCallback = void Function(int count, int total);
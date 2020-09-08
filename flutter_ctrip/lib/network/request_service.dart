/**
 * File : request_service
 * tips : 网络请求实现类
 * @author : karl.wei
 * @date : 2020-04-06 18:06
 **/

import 'dart:async';
import 'dart:convert';

import 'package:flutter_ctrip/network/request_method.dart';

import 'api.dart';
import 'service_interface.dart';
import 'dio_util.dart';
import 'request.dart';

class RequestManagement implements NetWorkApi {
  static RequestManagement _internal;

//  工厂模式暴露一个对象
  factory RequestManagement() => _getInternal();

  static RequestManagement _getInternal() {
    if (_internal == null) {
      _internal = new RequestManagement.internal();
    }
    return _internal;
  }

  RequestManagement.internal();

  @override
  Future<Null> toLogin(
      params, Function callBack, Function errorCallback) async {
    Map<String, dynamic> headers = Map<String, dynamic>();
    headers['Accept'] = 'application/json';
    // TODO: implement toLogin
    Request request = new Request();
    request.url = Api.baseApi + Api.login;
    request.params = params;
    request.header = headers;
    // json.encode(params);
    request.requestMethod = Method.POST;
    DioUtil()
        .sendRequest(request, callback: callBack, errorCallBack: errorCallback);
  }

  @override
  Future<Null> travelParams(
      Map<String, dynamic> params, Function callBack, Function errorCallback) {
    // TODO: implement travelParams
    Request request = new Request();
    request.url = "http://www.devio.org/io/flutter_app/json/travel_page.json";
    //request.params = params;
    request.requestMethod = Method.GET;
    DioUtil()
        .sendRequest(request, callback: callBack, errorCallBack: errorCallback);
  }
}

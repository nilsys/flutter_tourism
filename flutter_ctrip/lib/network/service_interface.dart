/**
 * File : service_interface
 * tips : 抽象接口，管理所有请求
 * @author : karl.wei
 * @date : 2020-04-06 18:04
 **/

import 'dart:async';
import 'package:dio/dio.dart';
import 'http_callbacks.dart';

abstract class NetWorkApi {
  //  登录
  Future<Null> toLogin(params, HttpSuccessCallback callBack, HttpFailureCallback errorCallback);

  // 旅拍页面导航菜单
  Future<Null> travelParams(
      Map<String, dynamic> params, HttpSuccessCallback callBack, HttpFailureCallback errorCallback);
}

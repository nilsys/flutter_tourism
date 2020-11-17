import 'package:rx_mvvm_flutter/constant/string.dart';
import 'package:rx_mvvm_flutter/entity/user_entity.dart';
import 'package:rx_mvvm_flutter/network/network_header.dart';

typedef OnSuccess<T>(T data);
typedef OnFail(String message);

class UserService {
  Future register(Map<String, dynamic> parameters, OnSuccess onSuccess,
      OnFail onFail) async {
    try {
      var response =
          await HttpUtil.instance.post(API.REGISTER, parameters: parameters);
      if (response['errno'] == 0) {
        onSuccess("");
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }

  Future login(Map<String, dynamic> parameters, OnSuccess onSuccess,
      OnFail onFail) async {
    try {
      var response =
          await HttpUtil.instance.post(API.LOGIN, parameters: parameters);
      if (response['errno'] == 0) {
        UserEntity userEntity = UserEntity.fromJson(response['data']);
        onSuccess(userEntity);
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }

  Future loginOut(OnSuccess onSuccess, OnFail onFail) async {
    try {
      var response = await HttpUtil.instance.post(API.LOGIN_OUT);
      if (response['errno'] == 0) {
        onSuccess(Strings.SUCCESS);
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }
}

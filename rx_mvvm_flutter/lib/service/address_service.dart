import 'package:rx_mvvm_flutter/constant/string.dart';
import 'package:rx_mvvm_flutter/entity/address_entity.dart';
import 'package:rx_mvvm_flutter/network/network_header.dart';

typedef OnSuccessList<T>(List<T> banners);

typedef OnSuccess<T>(T banners);

typedef OnFail(String message);

class AddressService {
  Future getAddressList(OnSuccess onSuccessList, {OnFail onFail}) async {
    try {
      var response = await HttpUtil.instance.get(
        API.ADDRESS_LIST,
      );
      if (response['errno'] == 0) {
        AddressEntity addressEntity = AddressEntity.fromJson(response['data']);
        onSuccessList(addressEntity.list);
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }

  Future addAddress(Map<String, dynamic> parameters, OnSuccess onSuccess,
      OnFail onFail) async {
    try {
      var response = await HttpUtil.instance
          .post(API.ADDRESS_SAVE, parameters: parameters);
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

  Future deleteAddress(Map<String, dynamic> parameters, OnSuccess onSuccess,
      OnFail onFail) async {
    try {
      var response = await HttpUtil.instance
          .post(API.ADDRESS_DELETE, parameters: parameters);
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

  Future addressDetail(Map<String, dynamic> parameters, OnSuccess onSuccess,
      {OnFail onFail}) async {
    try {
      var response = await HttpUtil.instance
          .get(API.ADDRESS_DETAIL, parameters: parameters);
      if (response['errno'] == 0) {
        ListData addressDetail = ListData.fromJson(response["data"]);
        onSuccess(addressDetail);
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }
}

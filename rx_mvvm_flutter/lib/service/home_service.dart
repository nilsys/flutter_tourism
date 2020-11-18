import 'package:rx_mvvm_flutter/constant/string.dart';
import 'package:rx_mvvm_flutter/entity/home_entity.dart';
import 'package:rx_mvvm_flutter/network/network_header.dart';

typedef OnSuccessList<T>(List<T> banners);

typedef OnFail(String message);

typedef OnSuccess<T>(T successData);

class HomeService {
  Future queryHomeData(OnSuccess onSuccess, OnFail onFail) async {
    try {
      var response = await HttpUtil.instance.get(API.HOME_URL);
      if (response['errno'] == 0) {
        HomeData homeData = HomeData.fromJson(response['data']);
        onSuccess(homeData);
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }
}

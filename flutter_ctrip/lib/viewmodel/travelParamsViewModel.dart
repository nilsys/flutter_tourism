import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ctrip/model/travel_params_model.dart';
import 'package:flutter_ctrip/network/request_service.dart';

class TravelParamsViewModel extends ChangeNotifier {
  //List<Tabs> tabs;
  List<String> tabs;

  loadParamsHandel(BuildContext context, Function callback) {
    RequestManagement.internal().travelParams({}, (result) {
      if (result != null) {
        TravelParamsModel model = TravelParamsModel.fromJson(result);
        //tabs = model.tabs.map((e) => e).toList();
        tabs = ["测试一"];
        notifyListeners();
        if (callback != null) {
          callback();
        }
      }
    }, (DioError erorr) {
      tabs = ["测试一"];
      notifyListeners();
      if (callback != null) {
        callback();
      }
    });
  }
}

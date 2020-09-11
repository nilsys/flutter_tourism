import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ctrip/model/travel_params_model.dart';
import 'package:flutter_ctrip/network/request_service.dart';

class TravelParamsViewModel extends ChangeNotifier {

  List<Tabs> tabs = [];

  loadParamsHandel(BuildContext context, Function callback) {
    RequestManagement.internal().travelParams({}, (result) {
      if (result != null) {
        TravelParamsModel model = TravelParamsModel.fromJson(result);
        tabs = model.tabs.map((e) => e).toList();
        notifyListeners();
        if (callback != null) {
          callback(true);
        }
      }
    }, (DioError erorr) {
      if (callback != null) {
        callback(false);
      }
    });
  }
}

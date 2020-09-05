import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ctrip/model/travel_params_model.dart';
import 'package:flutter_ctrip/network/request_service.dart';

class TravelParamsViewModel extends ChangeNotifier {
  loadParamsHandel(BuildContext context) {
    RequestManagement.internal().travelParams({}, (result) {
      if (result != null) {
        TravelParamsModel model = TravelParamsModel.fromJson(result);
      }
    }, (DioError erorr) {});
  }
}

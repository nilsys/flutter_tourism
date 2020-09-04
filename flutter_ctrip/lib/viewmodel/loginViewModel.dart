import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ctrip/network/request_service.dart';

class LoginViewModel extends ChangeNotifier {
  TextEditingController userNameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  bool loading = false;
  loginHandel(BuildContext context) {
    loading = true;
    notifyListeners();
    var params = Map<String, String>();
    params['mobile'] = userNameController.text;
    params['password'] = passwordController.text;

    RequestManagement.internal().toLogin(params, (result) {

    }, (DioError erorr) {

    });
  }
}

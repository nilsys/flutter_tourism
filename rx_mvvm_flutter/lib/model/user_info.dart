import 'package:flutter/material.dart';
import 'package:rx_mvvm_flutter/entity/user_entity.dart';

class UserInfoModel with ChangeNotifier {
  UserEntity userEntity;

  updateInfo(UserEntity userEntity) {
    this.userEntity = userEntity;
    notifyListeners();
  }
}
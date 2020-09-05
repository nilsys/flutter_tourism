import 'package:flutter_ctrip/viewmodel/travelParamsViewModel.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/single_child_widget.dart';
import 'package:flutter_ctrip/provider/app_store.dart';
import 'package:flutter_ctrip/viewmodel/loginViewModel.dart';

class ProviderManager {
  static ChangeNotifierProvider<T> _buildProvider<T extends ChangeNotifier>(
      T value) {
    return ChangeNotifierProvider<T>(
      create: (_) => value,
    );
  }

  static List<SingleChildWidget> get providers => _providers;

  static final _providers = [
    _buildProvider<AppStore>(AppStore()),
    _buildProvider<LoginViewModel>(LoginViewModel()),
    _buildProvider<TravelParamsViewModel>(TravelParamsViewModel()),
  ];
}

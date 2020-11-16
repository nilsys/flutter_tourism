

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rx_mvvm_flutter/provide/currentIndex.dart';
import 'package:provider/single_child_widget.dart';

class ProviderManager {
  static ChangeNotifierProvider<T> _buildProvider<T extends ChangeNotifier>(
      T value) {
    return ChangeNotifierProvider<T>(
      create: (_) => value,
    );
  }

  static List<SingleChildWidget> get providers => _providers;

  static final _providers = [
    _buildProvider<CurrentIndexProvide>(CurrentIndexProvide()),
    //_buildProvider<LoginViewModel>(LoginViewModel()),
    //_buildProvider<TravelParamsViewModel>(TravelParamsViewModel()),
  ];
}

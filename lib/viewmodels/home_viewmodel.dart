import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  void doSomething() async {
    setLoading(true);
    await Future.delayed(const Duration(seconds: 2));
    setLoading(false);
  }
}

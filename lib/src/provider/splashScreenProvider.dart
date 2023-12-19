// ignore_for_file: file_names

import 'package:flutter/material.dart';

class SplashScreenProvider with ChangeNotifier {
  bool _isLoading = true; // Set initial state to loading

  bool get isLoading => _isLoading;

  // Method to change the loading state (e.g., when initialization is complete)
  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}

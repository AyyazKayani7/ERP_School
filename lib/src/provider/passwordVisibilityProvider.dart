// ignore_for_file: file_names

import 'package:flutter/material.dart';

class PasswordVisibilityProvider with ChangeNotifier {
  bool _obsecure = true; // Set initial state to loading

  bool get obsecure => _obsecure;

  // Method to change the loading state (e.g., when initialization is complete)
  void setObsecure(bool value) {
    _obsecure = value;
    notifyListeners();
  }
}

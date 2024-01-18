// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ChangePasswordVisibilityProvider with ChangeNotifier {
  bool _obsecureOld = true; // Set initial state to loading
  bool _obsecureNew = true; // Set initial state to loading
  bool _obsecureRe = true; // Set initial state to loading

  bool get obsecureOld => _obsecureOld;
  bool get obsecureNew => _obsecureNew;
  bool get obsecureRe => _obsecureRe;

  // Method to change the loading state (e.g., when initialization is complete)
  void setObsecureNew(bool value) {
    _obsecureNew = value;
    notifyListeners();
  }

  void setObsecureRe(bool value) {
    _obsecureRe = value;
    notifyListeners();
  }

  void setObsecureOld(bool value) {
    _obsecureOld = value;
    notifyListeners();
  }
}

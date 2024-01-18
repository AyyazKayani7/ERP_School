import 'package:flutter/material.dart';

class EventProvider with ChangeNotifier {
  bool _isEventLoaded = false;
  bool get isEventLoaded => _isEventLoaded;

  void setIsEventLoaded(bool value) {
    _isEventLoaded = value;
    notifyListeners();
  }
}

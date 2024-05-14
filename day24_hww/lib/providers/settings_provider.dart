import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  double fontSize = 19;

  increFontSize() {
    fontSize++;
    notifyListeners();
  }

  decreFontSize() {
    fontSize--;
    notifyListeners();
  }

  SettingsProvider() {}
}

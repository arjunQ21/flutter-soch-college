import 'package:day12_hw/classes/preview_settings.dart';
import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  PreviewSettings currentSettings = PreviewSettings();
  //ctor
  SettingsProvider() {
    init();
  }

  Future<void> init() async {
    PreviewSettings? readSettings = await PreviewSettings.readFromDevice();
    if (readSettings != null) {
      currentSettings = readSettings;
      notifyListeners();
    }
  }

  void update(PreviewSettings toChangeTo) {
    currentSettings = toChangeTo;
    notifyListeners();
    currentSettings.saveToDevice();
  }
}

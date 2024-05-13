import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreviewSettings {
  double boxHeight;
  double boxWidth;
  double fontSize;
  double borderRadius;
  double borderWidth;
  Color textColor;
  Color boxColor;
  String textToShow;

  PreviewSettings({
    this.textToShow = "Hi Flutter",
    this.borderWidth = 1,
    this.boxHeight = 100,
    this.boxWidth = 100,
    this.fontSize = 20,
    this.borderRadius = 20,
    this.textColor = Colors.black,
    this.boxColor = Colors.white,
  });

  Future<void> saveToDevice() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setDouble("boxHeight", boxHeight);
    await prefs.setDouble("boxWidth", boxWidth);
    await prefs.setDouble("fontSize", fontSize);
    await prefs.setDouble("borderRadius", borderRadius);
    await prefs.setDouble("borderWidth", borderWidth);
    await prefs.setInt("textColor", textColor.value);
    await prefs.setInt("boxColor", boxColor.value);
    await prefs.setString("textToShow", textToShow);
    print("Saved to device");
  }

  static Future<PreviewSettings?> readFromDevice() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getInt("textColor") != null) {
      print("Reading settings from device");
      return PreviewSettings(
        boxHeight: prefs.getDouble("boxHeight")!,
        boxWidth: prefs.getDouble("boxWidth")!,
        fontSize: prefs.getDouble("fontSize")!,
        borderRadius: prefs.getDouble("borderRadius")!,
        borderWidth: prefs.getDouble("borderWidth")!,
        textColor: Color(prefs.getInt("textColor")!),
        boxColor: Color(prefs.getInt("boxColor")!),
        textToShow: prefs.getString("textToShow")!,
      );
    } else {
      return null;
    }
  }
}

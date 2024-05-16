// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:day24/resources/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier {
  SettingsProvider() {
    checkDataStored();
  }

  Future checkDataStored() async {
    var prefs = await SharedPreferences.getInstance();
    double? fSize = prefs.getDouble("fSize");
    String? fFamily = prefs.getString("fFamily");
    int? pColor = prefs.getInt("pColor");
    int? sColor = prefs.getInt("sColor");
    if (fSize != null) {
      fontSize = fSize;
      dropdownValue = fFamily.toString();
      selectedColor = Color(pColor!);
      selectedColorSec = Color(sColor!);
      notifyListeners();
    } else {
      notifyListeners();
      return null;
    }
  }

  double fontSize = 19;

  Color? selectedColor = pColor;

  Color? selectedColorSec = Colors.black;

  String? dropdownValue = "Roboto";

  List<Color> pColors = [
    Colors.deepPurple,
    Colors.deepOrange,
    Colors.teal,
    Colors.green,
  ];

  List<String> fontFamily = [
    "Roboto",
    "OpenSans",
    "Montserrat",
    "Tahoma",
    "TimesRoman"
  ];

  List<Color> sColors = [
    Colors.black,
    Colors.red,
    Colors.blue,
    Colors.yellow,
  ];

  void fontUpdate(String value) {
    dropdownValue = value;
    notifyListeners();
  }

  void switchFontFamily(String font) {
    dropdownValue = font;
    notifyListeners();
  }

  void switchRadioPrim(Color value) {
    selectedColor = value;
    notifyListeners();
  }

  void switchRadioSec(Color value) {
    selectedColorSec = value;
    notifyListeners();
  }

  increFontSize() {
    fontSize++;
    notifyListeners();
  }

  decreFontSize() {
    fontSize--;
    notifyListeners();
  }
}

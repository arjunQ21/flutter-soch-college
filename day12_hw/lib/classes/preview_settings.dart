import 'package:flutter/material.dart';

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
}

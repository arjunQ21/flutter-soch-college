import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int count = 10;

  void addCount() {
    count++;
    notifyListeners();
  }

  CounterProvider() {
    print("Provider called once.");
  }
}

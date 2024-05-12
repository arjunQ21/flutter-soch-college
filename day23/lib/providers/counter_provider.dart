import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int count = 10;

  void addCount() {
    count++;
    notifyListeners();
  }

  void multiplyByTen() {
    count *= 10;
    notifyListeners();
  }

  void divideByTen() {
    count = count ~/ 10;
    notifyListeners();
  }

  void minus() {
    count--;
    notifyListeners();
  }

  CounterProvider() {
    print("Provider called once.");
  }
}

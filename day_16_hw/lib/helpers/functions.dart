import 'dart:convert';

import 'package:day_16_hw/pages/fruits.dart';
import 'package:shared_preferences/shared_preferences.dart';

int giveMeNewId() {
  int highestId = 0;
  for (Map<String, dynamic> entry in fruits) {
    if (entry['id'] > highestId) highestId = entry['id'];
  }
  return highestId + 1;
}

Map<String, dynamic>? giveMeFruitById(int id) {
  for (Map<String, dynamic> entry in fruits) {
    if (entry['id'] == id) return entry;
  }
  return null;
}

List<Map<String, dynamic>> removeById(int id) {
  List<Map<String, dynamic>> newFruits = [];
  for (Map<String, dynamic> entry in fruits) {
    if (entry['id'] == id) continue;
    newFruits.add(entry);
  }
  return newFruits;
}

void saveFruitsToLocalStorage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String jsonEncodedFruits = jsonEncode(fruits);
  await prefs.setString("fruits", jsonEncodedFruits);
}

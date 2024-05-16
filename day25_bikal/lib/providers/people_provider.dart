import 'dart:convert';

import 'package:day24/resources/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PeopleProvider with ChangeNotifier {
  List<Map<String, dynamic>> peopleList = [];

  int? selectedPersonId;

  PeopleProvider() {
    //fetch people list from api
    fetchData();
  }

//select listTile on clicked
  void setSelectedId(int? id) {
    selectedPersonId = id;

    notifyListeners();
  }

//view data of clicked person
  Map<String, dynamic> viewDetails() {
    return peopleList[selectedPersonId! - 1];
  }

  Future<void> fetchData() async {
    var response = await http.get(Uri.parse(peopleApi));
    if (response.statusCode == 200) {
      var decodedResponse = jsonDecode(response.body);
      peopleList = (decodedResponse as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList();
      notifyListeners();
    } else {
      throw Exception("Error to load data");
    }
  }
}

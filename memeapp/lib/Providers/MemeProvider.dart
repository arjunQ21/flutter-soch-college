import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:memeapp/Resources/Resources.dart';

class MemeProvider with ChangeNotifier {
  MemeProvider() {
    getMemes();
  }

  static String? header;

  static void setHeader(String newHeader) {
    header = newHeader;
    print("New header set to $header.");
  }

  List<Map<String, dynamic>> memes = [];

  void getMemes() async {
    try {
      if (header == null) {
        throw Exception("Header not set yet.");
      }
      print("HEADER BeFORE:$header");
      var response = await http.get(Uri.parse('$myIP/memes'),
          headers: {'Authorization': 'Bearer $header'});
      print("HEADER AFTER: $header");
      print('MY RESPONSE BODY IS: ${response.body}');
      print('Status code: ${response.statusCode}');
      if (response.statusCode == 200) {
        List<dynamic> decodedInfo = (jsonDecode(response.body));
        memes = decodedInfo.map((e) => e as Map<String, dynamic>).toList();
        print("THE MEMES ARE $memes");
        notifyListeners();
      }
    } catch (e) {
      print("Error occurs $e");
    }
  }
}

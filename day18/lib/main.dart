import 'dart:io';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

void main() {
  runApp(MaterialApp(
    home: NetworkingDemoPage(),
  ));
}

class NetworkingDemoPage extends StatefulWidget {
  const NetworkingDemoPage({
    super.key,
  });

  @override
  State<NetworkingDemoPage> createState() => _NetworkingDemoPageState();
}

class _NetworkingDemoPageState extends State<NetworkingDemoPage> {
  String responseBody = "";
  void sendRequest() async {
    var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if (response.statusCode == 200) {
      String text = response.body;
      // print(text);
      responseBody = text;
      setState(() {});
    } else {
      print("Errror occurred");
    }
  }

  @override
  void initState() {
    sendRequest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Networking Demo."),
      ),
      body: SingleChildScrollView(
        child: Text(responseBody.isEmpty ? "Empty Response." : responseBody),
      ),
    );
  }
}

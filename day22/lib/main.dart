import 'package:chat_app/pages/chat_home.dart';
import 'package:chat_app/pages/splash_screen.dart';
import 'package:flutter/material.dart';

import 'pages/check_sender.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Poppins"),
      debugShowCheckedModeBanner: false,
      home: CheckSender(),
    );
  }
}

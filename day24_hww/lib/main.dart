import 'package:day24/pages/home_page.dart';
import 'package:day24/providers/people_provider.dart';
import 'package:day24/providers/settings_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PeopleProvider()),
        ChangeNotifierProvider(create: (context) => SettingsProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: "Roboto"),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

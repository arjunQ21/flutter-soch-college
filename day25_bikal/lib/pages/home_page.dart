// ignore_for_file: prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'dart:ffi';

import 'package:day24/pages/Bottom%20Content/home.dart';
import 'package:day24/pages/Bottom%20Content/profile.dart';
import 'package:day24/pages/Bottom%20Content/settings.dart';
import 'package:day24/providers/settings_provider.dart';
import 'package:day24/resources/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  int index = 0;
  void _selectedIndex(int value) {
    setState(() {
      index = value;
    });
  }

  List<Widget> pages = [
    Home(),
    Profile(),
    Settings(),
  ];
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<SettingsProvider>(context, listen: false);
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: prov.selectedColor,
        currentIndex: index,
        onTap: (value) {
          _selectedIndex(value);
        },
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.person),
          ),
          BottomNavigationBarItem(
            label: "Settings",
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}

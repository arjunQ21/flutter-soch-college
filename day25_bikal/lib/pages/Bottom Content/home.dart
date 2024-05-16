// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:day24/providers/people_provider.dart';
import 'package:day24/providers/settings_provider.dart';
import 'package:day24/resources/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isChecked = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<SettingsProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: prov.selectedColor,
        foregroundColor: Colors.white,
        title: Text(
          "Peoples",
          style: TextStyle(
            fontSize: prov.fontSize + 4,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer<PeopleProvider>(
        builder: (context, value, child) {
          return value.peopleList.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                    color: prov.selectedColor,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView.builder(
                      itemCount: value.peopleList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Card(
                            color: Color.fromARGB(255, 248, 246, 246),
                            child: ListTile(
                              contentPadding: EdgeInsets.all(12),
                              leading: Checkbox(
                                activeColor: prov.selectedColor,
                                onChanged: (v) {
                                  value.setSelectedId(v == false
                                      ? null
                                      : value.peopleList[index]['id']);
                                },
                                value: (value.selectedPersonId ?? 0) ==
                                    value.peopleList[index]['id'],
                              ),
                              title: Text(
                                value.peopleList[index]['name'],
                                style: TextStyle(
                                  fontSize: prov.fontSize,
                                  color: prov.selectedColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              subtitle: Text(
                                value.peopleList[index]["address"]["city"],
                                style: TextStyle(color: prov.selectedColorSec),
                              ),
                            ),
                          ),
                        );
                      }),
                );
        },
      ),
    );
  }
}

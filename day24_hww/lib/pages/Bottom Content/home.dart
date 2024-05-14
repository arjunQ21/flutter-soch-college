// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:day24/providers/people_provider.dart';
import 'package:day24/resources/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

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
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: pColor,
            ),
            child: Center(
              child: Text(
                "Peoples",
                style: TextStyle(
                  fontSize: 23,
                  color: sColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: Consumer<PeopleProvider>(
            builder: (context, value, child) {
              return value.peopleList.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: value.peopleList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5),
                          child: Card(
                            child: ListTile(
                              contentPadding: EdgeInsets.all(12),
                              leading: Checkbox(
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
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              subtitle: Text(
                                  value.peopleList[index]["address"]["city"]),
                            ),
                          ),
                        );
                      });
            },
          ),
        ),
      ],
    );
  }
}

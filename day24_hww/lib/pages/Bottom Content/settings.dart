// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:day24/providers/settings_provider.dart';
import 'package:day24/resources/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

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
                "Settings",
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
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Font Size:",
                    style: TextStyle(fontSize: 18),
                  ),
                  Row(
                    children: [
                      IncreDecreContainer(
                        iconName: Icon(Icons.remove),
                      ),
                      Container(
                        height: 50,
                        width: 60,
                        decoration: BoxDecoration(
                          border: Border.symmetric(horizontal: BorderSide()),
                        ),
                        child: Center(
                          child: Consumer<SettingsProvider>(
                              builder: (context, value, child) {
                            print(value.fontSize);
                            return Text(
                              "hdi",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            );
                          }),
                        ),
                      ),
                      IncreDecreContainer(
                        iconName: Icon(Icons.add),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class IncreDecreContainer extends StatelessWidget {
  Icon iconName;
  IncreDecreContainer({super.key, required this.iconName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 60,
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Center(child: iconName),
    );
  }
}

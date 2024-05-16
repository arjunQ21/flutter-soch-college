// ignore_for_file: prefer_const_literals_to_create_immutables, must_be_immutable, sized_box_for_whitespace, use_build_context_synchronously

import 'package:day24/providers/settings_provider.dart';
import 'package:day24/resources/components/incre_decre_container.dart';
import 'package:day24/resources/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Future<void> saveSettings(
      double fSize, String fFamily, Color pColor, Color sColor) async {
    var prefs = await SharedPreferences.getInstance();
    var prov = Provider.of<SettingsProvider>(context, listen: false);
    await prefs.setDouble("fSize", fSize);
    await prefs.setString("fFamily", fFamily);
    await prefs.setInt("pColor", pColor.value);
    await prefs.setInt("sColor", sColor.value);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      padding: EdgeInsets.all(23),
      backgroundColor: prov.selectedColor,
      content: Text(
        "Settings Saved!",
        style: TextStyle(fontSize: 17),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<SettingsProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: prov.selectedColor,
        foregroundColor: Colors.white,
        title: Text(
          "Settings",
          style: TextStyle(
            fontSize: prov.fontSize + 4,
            color: sColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Font Size:",
                      style: TextStyle(
                          fontSize: prov.fontSize - 1,
                          color: prov.selectedColorSec),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            prov.decreFontSize();
                            setState(() {});
                          },
                          child: IncreDecreContainer(
                            iconName:
                                Icon(Icons.remove, color: prov.selectedColor),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.symmetric(
                                horizontal:
                                    BorderSide(color: prov.selectedColor!)),
                          ),
                          child: Center(
                            child: Consumer<SettingsProvider>(
                                builder: (context, value, child) {
                              return Text(
                                value.fontSize.toString(),
                                style: TextStyle(
                                  fontSize: 18,
                                  color: prov.selectedColor,
                                ),
                              );
                            }),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            prov.increFontSize();
                            setState(() {});
                          },
                          child: IncreDecreContainer(
                            iconName: Icon(
                              Icons.add,
                              color: prov.selectedColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(
                  height: 15,
                ),

                //primary color
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Primary Color:",
                      style: TextStyle(
                          fontSize: prov.fontSize - 1,
                          color: prov.selectedColorSec),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Consumer<SettingsProvider>(
                        builder: (context, value, child) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Radio(
                                    activeColor: value.pColors[0],
                                    value: value.pColors[0],
                                    groupValue: value.selectedColor,
                                    onChanged: (v) {
                                      value.switchRadioPrim(v!);
                                      setState(() {});
                                    },
                                  ),
                                  Text("Deep Purple",
                                      style: TextStyle(
                                          fontSize: prov.fontSize - 5,
                                          color: prov.selectedColorSec))
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Radio(
                                    activeColor: value.pColors[1],
                                    value: value.pColors[1],
                                    groupValue: value.selectedColor,
                                    onChanged: (v) {
                                      value.switchRadioPrim(v!);
                                      setState(() {});
                                    },
                                  ),
                                  Text("Deep Orange",
                                      style: TextStyle(
                                          fontSize: prov.fontSize - 5,
                                          color: prov.selectedColorSec))
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Radio(
                                    activeColor: value.pColors[2],
                                    value: value.pColors[2],
                                    groupValue: value.selectedColor,
                                    onChanged: (v) {
                                      value.switchRadioPrim(v!);
                                      setState(() {});
                                    },
                                  ),
                                  Text("Teal",
                                      style: TextStyle(
                                          fontSize: prov.fontSize - 5,
                                          color: prov.selectedColorSec))
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Radio(
                                    activeColor: value.pColors[3],
                                    value: value.pColors[3],
                                    groupValue: value.selectedColor,
                                    onChanged: (v) {
                                      value.switchRadioPrim(v!);
                                      setState(() {});
                                    },
                                  ),
                                  Text("Green",
                                      style: TextStyle(
                                          fontSize: prov.fontSize - 5,
                                          color: prov.selectedColorSec))
                                ],
                              ),
                            ],
                          ),
                        ],
                      );
                    })
                  ],
                ),
                SizedBox(
                  height: 15,
                ),

                //secondary color
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Secondary Color:",
                      style: TextStyle(
                          fontSize: prov.fontSize - 1,
                          color: prov.selectedColorSec),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Consumer<SettingsProvider>(
                        builder: (context, value, child) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Radio(
                                    activeColor: value.sColors[0],
                                    value: value.sColors[0],
                                    groupValue: value.selectedColorSec,
                                    onChanged: (v) {
                                      value.switchRadioSec(v!);
                                      setState(() {});
                                    },
                                  ),
                                  Text("Black",
                                      style: TextStyle(
                                          fontSize: prov.fontSize - 5,
                                          color: prov.selectedColorSec))
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Radio(
                                    activeColor: value.sColors[1],
                                    value: value.sColors[1],
                                    groupValue: value.selectedColorSec,
                                    onChanged: (v) {
                                      value.switchRadioSec(v!);
                                      setState(() {});
                                    },
                                  ),
                                  Text("Red",
                                      style: TextStyle(
                                          fontSize: prov.fontSize - 5,
                                          color: prov.selectedColorSec))
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Radio(
                                    activeColor: value.sColors[2],
                                    value: value.sColors[2],
                                    groupValue: value.selectedColorSec,
                                    onChanged: (v) {
                                      value.switchRadioSec(v!);
                                      setState(() {});
                                    },
                                  ),
                                  Text("Blue",
                                      style: TextStyle(
                                          fontSize: prov.fontSize - 5,
                                          color: prov.selectedColorSec))
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Radio(
                                    activeColor: value.sColors[3],
                                    value: value.sColors[3],
                                    groupValue: value.selectedColorSec,
                                    onChanged: (v) {
                                      value.switchRadioSec(v!);
                                      setState(() {});
                                    },
                                  ),
                                  Text("Yellow",
                                      style: TextStyle(
                                          fontSize: prov.fontSize - 5,
                                          color: prov.selectedColorSec))
                                ],
                              ),
                            ],
                          ),
                        ],
                      );
                    })
                  ],
                ),
                SizedBox(
                  height: 15,
                ),

                //font-family
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Font-family:",
                      style: TextStyle(
                          fontSize: prov.fontSize - 1,
                          color: prov.selectedColorSec),
                    ),
                    Consumer<SettingsProvider>(
                        builder: (context, value, child) {
                      return DropdownButton<String>(
                        value: value.dropdownValue,
                        onChanged: (String? v) {
                          value.switchFontFamily(v!);
                        },
                        //using map
                        items: value.fontFamily
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e,
                                    style: TextStyle(
                                        fontSize: prov.fontSize - 5,
                                        color: prov.selectedColor),
                                  ),
                                ))
                            .toList(),

                        //  [
                        //   DropdownMenuItem(
                        //     value: "Roboto",
                        //     child: Text("Roboto"),
                        //   ),
                        //   DropdownMenuItem(
                        //     value: "OpenSans",
                        //     child: Text("OpenSans"),
                        //   ),
                        //   DropdownMenuItem(
                        //     value: "Montserrat",
                        //     child: Text("Montserrat"),
                        //   ),
                        //   DropdownMenuItem(
                        //     value: "Tahoma",
                        //     child: Text("Tahoma"),
                        //   ),
                        //   DropdownMenuItem(
                        //     value: "TimesRoman",
                        //     child: Text("TimesRoman"),
                        //   ),
                        // ],
                      );
                    }),
                  ],
                ),
              ],
            ),
            InkWell(
              onTap: () {
                saveSettings(
                  prov.fontSize,
                  prov.dropdownValue!,
                  prov.selectedColor!,
                  prov.selectedColorSec!,
                );
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: prov.selectedColor,
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                ),
                child: Center(
                  child: Text(
                    "Save",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

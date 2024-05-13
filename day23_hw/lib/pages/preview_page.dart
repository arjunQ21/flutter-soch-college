import 'package:day12_hw/classes/preview_settings.dart';
import 'package:day12_hw/pages/settings_page.dart';
import 'package:day12_hw/providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PreviewPage extends StatefulWidget {
  const PreviewPage({
    super.key,
  });

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preview Page"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SettingsPage(
                      // onChange: (newSettings) {
                      //   setState(() {
                      //     previewSettings = newSettings;
                      //   });
                      // },
                      // previewConfig: previewSettings,
                      ),
                ),
              );
            },
            icon: Icon(Icons.edit),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image.asset("assets/images/image.jpg"),
          // Image(
          //   image: AssetImage("assets/images/image.jpg"),
          // ),
          Center(
            child: Consumer<SettingsProvider>(
                builder: (context, settingsProvider, child) {
              return Container(
                height: settingsProvider.currentSettings.boxHeight,
                width: settingsProvider.currentSettings.boxWidth,
                decoration: BoxDecoration(
                  border: Border.all(
                      width: settingsProvider.currentSettings.borderWidth),
                  color: settingsProvider.currentSettings.boxColor,
                  borderRadius: BorderRadius.circular(
                      settingsProvider.currentSettings.borderRadius),
                ),
                child: Center(
                  child: Text(
                    settingsProvider.currentSettings.textToShow,
                    style: TextStyle(
                      color: settingsProvider.currentSettings.textColor,
                      fontSize: settingsProvider.currentSettings.fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

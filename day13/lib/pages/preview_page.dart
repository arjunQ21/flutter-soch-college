import 'package:day12_hw/classes/preview_settings.dart';
import 'package:day12_hw/pages/settings_page.dart';
import 'package:flutter/material.dart';

class PreviewPage extends StatefulWidget {
  const PreviewPage({
    super.key,
  });

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  PreviewSettings previewSettings = PreviewSettings();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preview Page"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SettingsPage(
                        onChange: (newSettings) {
                          setState(() {
                            previewSettings = newSettings;
                          });
                        },
                        previewConfig: previewSettings,
                      )));
            },
            icon: Icon(Icons.edit),
          ),
        ],
      ),
      body: Center(
        child: Container(
          height: previewSettings.boxHeight,
          width: previewSettings.boxWidth,
          decoration: BoxDecoration(
            border: Border.all(width: previewSettings.borderWidth),
            color: previewSettings.boxColor,
            borderRadius: BorderRadius.circular(previewSettings.borderRadius),
          ),
          child: Center(
            child: Text(
              previewSettings.textToShow,
              style: TextStyle(
                color: previewSettings.textColor,
                fontSize: previewSettings.fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

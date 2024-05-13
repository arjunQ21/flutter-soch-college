import 'package:day12_hw/classes/preview_settings.dart';
import 'package:day12_hw/components/number_controller.dart';
import 'package:day12_hw/providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/label_text.dart';

List<Color> colors = [
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.black,
  Colors.white,
];

class SettingsPage extends StatefulWidget {
  SettingsPage({
    super.key,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final OutlineInputBorder border = OutlineInputBorder(
      borderSide: BorderSide(
    color: Colors.green,
    width: 2,
  ));

  TextEditingController textController = TextEditingController();

  late PreviewSettings previewState =
      Provider.of<SettingsProvider>(context, listen: false).currentSettings;

  @override
  void initState() {
    textController.text = previewState.textToShow;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings Page"),
        actions: [
          IconButton(
              onPressed: () {
                previewState.textToShow = textController.text;

                Provider.of<SettingsProvider>(context, listen: false)
                    .update(previewState);

                Navigator.of(context).pop();
              },
              icon: Icon(Icons.save)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: ListView(
          children: [
            Text("Text to show:"),
            TextField(
              controller: textController,
              decoration: InputDecoration(
                border: border,
                enabledBorder: border,
                focusedBorder: border,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LabelText("Font Size:"),
                NumberController(
                  onChange: (v) {
                    setState(() {
                      previewState.fontSize = v;
                    });
                  },
                  max: 20,
                  value: previewState.fontSize,
                  min: 10,
                  changeValueBy: 3,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LabelText("Box Border Width:"),
                NumberController(
                  onChange: (v) {
                    setState(() {
                      previewState.borderWidth = v;
                    });
                  },
                  max: 20,
                  value: previewState.borderWidth,
                  min: 0,
                  changeValueBy: 1,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LabelText("Box Border Radius:"),
                NumberController(
                  onChange: (v) {
                    setState(() {
                      previewState.borderRadius = v;
                    });
                  },
                  max: 200,
                  value: previewState.borderRadius,
                  min: 0,
                  changeValueBy: 10,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LabelText("Box Height:"),
                NumberController(
                  onChange: (v) {
                    setState(() {
                      previewState.boxHeight = v;
                    });
                  },
                  max: 400,
                  value: previewState.boxHeight,
                  min: 80,
                  changeValueBy: 30,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LabelText("Box Width:"),
                NumberController(
                  onChange: (v) {
                    setState(() {
                      previewState.boxWidth = v;
                    });
                  },
                  max: 400,
                  value: previewState.boxWidth,
                  min: 80,
                  changeValueBy: 30,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelText("Box Color:"),
                for (int i = 0; i < colors.length; i++)
                  Row(
                    children: [
                      Radio<Color>(
                          value: colors[i],
                          groupValue: previewState.boxColor,
                          onChanged: (v) {
                            setState(() {
                              previewState.boxColor = v!;
                            });
                          }),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: colors[i],
                          border: Border.all(),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelText("Text Color:"),
                for (int i = 0; i < colors.length; i++)
                  Row(
                    children: [
                      Radio<Color>(
                          value: colors[i],
                          groupValue: previewState.textColor,
                          onChanged: (v) {
                            setState(() {
                              previewState.textColor = v!;
                            });
                          }),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: colors[i],
                          border: Border.all(),
                        ),
                      ),
                    ],
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: must_be_immutable

import 'package:day24/providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IncreDecreContainer extends StatelessWidget {
  Icon iconName;
  IncreDecreContainer({super.key, required this.iconName});

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<SettingsProvider>(context, listen: false);
    return Container(
      height: 40,
      width: 50,
      decoration: BoxDecoration(
        border: Border.all(
          color: prov.selectedColor!,
        ),
      ),
      child: Center(child: iconName),
    );
  }
}

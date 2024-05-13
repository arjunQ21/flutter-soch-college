import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "pages/preview_page.dart";
import "providers/settings_provider.dart";

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SettingsProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PreviewPage(),
      ),
    ),
  );
}

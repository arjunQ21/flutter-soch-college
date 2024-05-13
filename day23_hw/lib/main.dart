import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:provider/provider.dart";

import "pages/preview_page.dart";
import "providers/settings_provider.dart";

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SettingsProvider(),
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Montserrat-Regular',
          // textTheme: GoogleFonts.montserratTextTheme(),
        ),
        debugShowCheckedModeBanner: false,
        home: PreviewPage(),
      ),
    ),
  );
}

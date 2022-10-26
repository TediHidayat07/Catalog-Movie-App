import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:catalog_movie_app/pages/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        textTheme: TextTheme(
          titleSmall: GoogleFonts.montserrat(fontSize: 12),
          titleLarge:
              GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
          titleMedium:
              GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.bold),
          labelLarge: GoogleFonts.poppins(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.red[700],
          ),
        ),
      ),
      title: 'Catalog Movie App',
      home: const Splash(),
    );
  }
}

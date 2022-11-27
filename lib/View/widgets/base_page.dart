import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BasePage extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const BasePage({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSizes = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            title,
            style: GoogleFonts.libreBaskerville(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      body: Container(
        width: screenSizes.width,
        height: screenSizes.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff1B2123),
              Color(0xFF202528),
              Color.fromARGB(255, 59, 66, 68),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(children: children),
      ),
    );
  }
}

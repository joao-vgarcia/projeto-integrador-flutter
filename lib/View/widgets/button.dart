import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  final String text;
  final Function action;
  final double width;

  const Button({
    Key? key,
    required this.text,
    required this.action,
    this.width = 190
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      clipBehavior: Clip.hardEdge,
      style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll<Color>(
            Color(0xff24abb9),
          ),
          minimumSize: MaterialStatePropertyAll<Size>(Size(width, 60)),
          maximumSize: MaterialStatePropertyAll<Size>(Size(width + 100, 60)),
          elevation: const MaterialStatePropertyAll(10),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ))),
      child: Text(
        text,
        style: GoogleFonts.libreBaskerville(
          color: const Color(0xff1B2123),
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      onPressed: () => action(),
    );
  }
}

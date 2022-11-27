import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  final String text;
  final Function action;

  const Button({
    Key? key,
    required this.text,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      clipBehavior: Clip.hardEdge,
      style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll<Color>(
            Color(0xff24abb9),
          ),
          minimumSize: const MaterialStatePropertyAll<Size>(Size(250, 60)),
          maximumSize: const MaterialStatePropertyAll<Size>(Size(350, 60)),
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

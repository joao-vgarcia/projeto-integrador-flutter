import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  final String text;
  final Function action;
  final double width;
  final bool enabled;
  final bool outlined;

  const Button({
    Key? key,
    required this.text,
    required this.action,
    this.width = 190,
    this.enabled = true,
    this.outlined = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => OutlinedButton(
        clipBehavior: Clip.hardEdge,
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(
            enabled ? (outlined ? Colors.transparent : const Color(0xff24abb9)) : const Color(0xffcccccc),
          ),
          shadowColor: outlined ? MaterialStatePropertyAll<Color>(Colors.white.withOpacity(0.1)) : null,
          minimumSize: MaterialStatePropertyAll<Size>(Size(width, 60)),
          maximumSize: MaterialStatePropertyAll<Size>(Size(width + 100, 60)),
          elevation: outlined ? const MaterialStatePropertyAll(1) : const MaterialStatePropertyAll(10),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.libreBaskerville(
            color: outlined ? Colors.red : const Color(0xff1B2123),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        onPressed: () => enabled ? action() : null,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BaseInput extends StatelessWidget {
  final Function onChanged;
  final Function onComplete;
  final String hintText;

  const BaseInput({super.key, required this.onChanged, required this.onComplete, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
            onChanged: (value) => onChanged(value),
            onEditingComplete: () => onComplete,
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: GoogleFonts.libreBaskerville(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 18,
                ),
                contentPadding: const EdgeInsets.only(left: 30),
                filled: true,
                fillColor: const Color(0xFF464646),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
            style: GoogleFonts.libreBaskerville(
              color: Colors.white,
              fontSize: 18,
            ),
            autofocus: false,
            autocorrect: true,
            enableSuggestions: true,
            cursorColor: Colors.white,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.done,
            textCapitalization: TextCapitalization.words,
          );
  }
}
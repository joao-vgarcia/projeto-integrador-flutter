import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlannerItem extends StatefulWidget {
  final String title;
  final String author;

  const PlannerItem({
    super.key,
    required this.title,
    required this.author,
  });

  @override
  State<PlannerItem> createState() => _PlannerItemState();
}

class _PlannerItemState extends State<PlannerItem> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 80;
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1c1c1c),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: width,
                child: Text(
                  widget.title,
                  style: GoogleFonts.libreBaskerville(
                    fontSize: 14,
                    color: const Color(0xFFEEEEEE),
                    fontWeight: FontWeight.w700,
                  ),
                  overflow: TextOverflow.visible,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: width,
                child: Text(
                  widget.author != 'null' ? widget.author : '',
                  style: GoogleFonts.libreBaskerville(
                    fontSize: 12,
                    color: const Color(0xFFDDDDDD),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(color: const Color.fromARGB(255, 59, 66, 68), borderRadius: BorderRadius.circular(5)),
                child: Text(
                  'Status: Lendo',
                  style: GoogleFonts.libreBaskerville(
                    fontSize: 12,
                    color: const Color(0xff24abb9),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

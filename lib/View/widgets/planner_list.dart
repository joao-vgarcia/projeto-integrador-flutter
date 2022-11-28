import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlannerItem extends StatefulWidget {
  final String title;
  final String author;
  final Function select;
  final Function remove;

  const PlannerItem({
    super.key,
    required this.title,
    required this.author,
    required this.select,
    required this.remove,
  });

  @override
  State<PlannerItem> createState() => _PlannerItemState();
}

class _PlannerItemState extends State<PlannerItem> {
  bool selected = false;

  toggleSelected() {
    setState(() {
      selected = !selected;
    });

    if (selected) {
      widget.select();
    } else {
      widget.remove();
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 140;
    return GestureDetector(
      onTap: toggleSelected,
      child: Container(
        decoration: BoxDecoration(color: selected ? const Color(0xff24abb9) : const Color(0xFF1c1c1c), borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}

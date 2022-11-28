import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListItem extends StatefulWidget {
  final String title;
  final String author;
  final Function onSelect;
  final String? thumbnail;

  const ListItem({super.key, required this.title, required this.author, required this.onSelect, this.thumbnail});

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  bool selected = false;

  toggleSelected() {
    setState(() {
      selected = !selected;
    });
    widget.onSelect();
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
                widget.thumbnail != null && widget.thumbnail != ''?
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Image.network(widget.thumbnail!),
                  ),
                )
                : const SizedBox.shrink()
              ],
            ),
            Icon(
              !selected ? Icons.add : Icons.close,
              color: !selected ? const Color(0xFFEEEEEE) : const Color(0xFF0c0c0c),
            )
          ],
        ),
      ),
    );
  }
}

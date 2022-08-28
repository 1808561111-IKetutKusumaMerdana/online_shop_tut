import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MemberWidgets extends StatelessWidget {
  const MemberWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Non member",
          style: GoogleFonts.lato(fontSize: 10, fontStyle: FontStyle.italic),
        ),
        Text(
          "Member only",
          style: GoogleFonts.lato(fontSize: 10, fontStyle: FontStyle.italic),
        ),
      ],
    );
  }
}

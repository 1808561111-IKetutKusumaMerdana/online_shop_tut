import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PriceWidgets extends StatelessWidget {
  final String productPrice;

  PriceWidgets({
    required this.productPrice,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Icon(Icons.edit),
          Text(
            "Rp $productPrice",
            style: GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Text(
            "Rp 45.000",
            style: GoogleFonts.lato(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.red.shade400),
          ),
        ],
      ),
    );
  }
}

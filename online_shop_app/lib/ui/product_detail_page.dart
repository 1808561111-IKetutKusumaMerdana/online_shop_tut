import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_shop_app/ui/home_page.dart';
import 'package:online_shop_app/ui/home_try_page.dart';

class ProductDetailPage extends StatelessWidget {
  final User product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Detail"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              product.name,
              style: GoogleFonts.alegreyaSans(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Image.network(product.image_url),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.price,
                    style: GoogleFonts.alegreya(fontSize: 20),
                  ),
                  Icon(Icons.edit),
                ],
              ),
            ),
            Text(
              product.description,
              style: GoogleFonts.alegreya(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}

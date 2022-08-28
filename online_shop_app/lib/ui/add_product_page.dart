import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:online_shop_app/ui/home_page.dart';
import 'package:online_shop_app/ui/home_try_page.dart';

class AddProductPage extends StatelessWidget {
  AddProductPage({Key? key}) : super(key: key);

  final _formkey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _imageUrlController = TextEditingController();

  String url = "http://10.0.2.2:8000/api/products/";

  Future saveProduct() async {
    try {
      var response = await http.post(
        Uri.parse(url),
        body: {
          "name": _nameController.text,
          "description": _descriptionController.text,
          "price": _priceController.text,
          "image_url": _imageUrlController.text
        },
      );
      print(response.body);

      return jsonDecode(response.body);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add Product Page"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Container(
            margin: EdgeInsets.only(top: 12),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.amberAccent,
                      labelText: "Name",
                    ),
                    controller: _nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Kosong lohh ini";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.amberAccent,
                      labelText: "Description",
                    ),
                    controller: _descriptionController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Kosong lohh ini";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.amberAccent,
                      labelText: "Price",
                    ),
                    controller: _priceController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Kosong lohh ini";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.amberAccent,
                      labelText: "Image Url",
                    ),
                    controller: _imageUrlController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Kosong lohh ini";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      saveProduct().then((value) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: ((context) {
                          return HomeTryPage();
                        })));
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Berhasil Menambahkan Produk")));
                      });
                    }
                  },
                  child: Text("Save"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

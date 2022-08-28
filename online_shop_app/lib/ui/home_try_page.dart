import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:online_shop_app/models/delete_product.dart';
import 'package:online_shop_app/models/fonts_product.dart';
import 'package:online_shop_app/models/user_product.dart';
import 'package:online_shop_app/ui/add_product_page.dart';
import 'package:online_shop_app/ui/edit_product_page.dart';
import 'package:online_shop_app/ui/product_detail_page.dart';
import 'package:online_shop_app/widgets/member_widgets.dart';
import 'package:online_shop_app/widgets/price_widgets.dart';

class HomeTryPage extends StatefulWidget {
  const HomeTryPage({Key? key}) : super(key: key);

  @override
  State<HomeTryPage> createState() => _HomeTryPageState();
}

String url = "http://10.0.2.2:8000/api/products";

Future<List<User>> getProducts() async {
  var response = await http.get(Uri.parse(url));

  var json = jsonDecode(response.body);

  var jsonArray = json['data'];

  List<User> userList = [];

  for (var u in jsonArray) {
    User user = User(
      u['id'],
      u['name'],
      u['description'],
      u['price'],
      u['image_url'],
    );
    userList.add(user);
  }

  print(userList.length);

  return userList;
}

class _HomeTryPageState extends State<HomeTryPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.white),
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  "https://ouch-cdn2.icons8.com/d4Io_OT5QSIqdaBYTKejx0PTQC2I59eI1MKt6tu06Fo/rs:fit:256:176/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvMzIx/L2NmZjBlMjYyLWVh/Y2QtNDU3NS04OWNm/LTU3NGRhMDUzZWZi/Ni5zdmc.png",
                  height: 30,
                  width: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "ProductoBuy",
                  style: GoogleFonts.lato(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                        return AddProductPage();
                      })));
                    },
                    icon: Icon(
                      Icons.add,
                      color: Colors.black,
                      size: 25,
                    )),
              )
            ],
          ),
          backgroundColor: Colors.transparent,
          body: FutureBuilder<List<User>>(
              future: getProducts(),
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    // margin: EdgeInsets.all(10),
                    // color: Colors.grey.shade200,
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                        itemCount: snapshot.data!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.7,
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                                color: Colors.amberAccent.shade200,
                                borderRadius: BorderRadius.circular(8)),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: ((context) {
                                  return ProductDetailPage(
                                    product: snapshot.data![index],
                                  );
                                })));
                              },
                              child: Card(
                                // color: Colors.amberAccent.shade700,
                                elevation: 8,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 12, right: 12, left: 12, bottom: 5),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.network(
                                            "https://ouch-cdn2.icons8.com/d4Io_OT5QSIqdaBYTKejx0PTQC2I59eI1MKt6tu06Fo/rs:fit:256:176/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvMzIx/L2NmZjBlMjYyLWVh/Y2QtNDU3NS04OWNm/LTU3NGRhMDUzZWZi/Ni5zdmc.png",
                                            height: 10,
                                            width: 10,
                                          ),
                                          Text(
                                            "ProductToBuy",
                                            style:
                                                GoogleFonts.lato(fontSize: 10),
                                          ),
                                        ],
                                      ),
                                      Image.network(
                                        snapshot.data![index].image_url,
                                        height: 120,
                                        width: 120,
                                      ),
                                      Text(
                                        snapshot.data![index].name,
                                        style: GoogleFonts.lato(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        snapshot.data![index].description,
                                        style: productFonts.copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w200),
                                      ),
                                      PriceWidgets(
                                        productPrice:
                                            snapshot.data![index].price,
                                      ),
                                      MemberWidgets(),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.push(context,
                                                      MaterialPageRoute(
                                                          builder: ((context) {
                                                    return EditProductPage(
                                                      product:
                                                          snapshot.data![index],
                                                    );
                                                  })));
                                                },
                                                child: Icon(
                                                  Icons.edit,
                                                  size: 20,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  deleteProduct(snapshot
                                                          .data![index].id)
                                                      .then((value) {
                                                    setState(() {});
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                            content: Text(
                                                                "Berhasil dihapus")));
                                                  });
                                                },
                                                child: Icon(
                                                  Icons.delete,
                                                  size: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "Stok Terbatas",
                                            style: GoogleFonts.lato(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.yellow.shade700,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  );
                }
                return Text("amam");
              }))),
    );
  }
}

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;
// import 'package:online_shop_app/ui/add_product_page.dart';
// import 'package:online_shop_app/ui/edit_product_page.dart';
// import 'package:online_shop_app/ui/product_detail_page.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   String url = "http://10.0.2.2:8000/api/products";

//   Future<List<User>> getProducts() async {
//     var response = await http.get(Uri.parse(url));

//     var json = jsonDecode(response.body);

//     var jsonArray = json['data'];

//     List<User> userList = [];

//     for (var u in jsonArray) {
//       User user = User(
//         u['id'],
//         u['name'],
//         u['description'],
//         u['price'],
//         u['image_url'],
//       );
//       userList.add(user);
//     }

//     print(userList.length);

//     return userList;
//   }

//   Future deleteProduct(int productId) async {
//     String id = productId.toString();
//     var response = await http.delete(
//       Uri.parse("http://10.0.2.2:8000/api/products/$id"),
//     );

//     return jsonDecode(response.body);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: Text("Product Buy"),
//         centerTitle: true,
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 15.0),
//             child: Row(
//               children: [
//                 GestureDetector(
//                     onTap: () {
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: ((context) {
//                         return AddProductPage();
//                       })));
//                     },
//                     child: Icon(Icons.add)),
//               ],
//             ),
//           ),
//         ],
//       ),
//       body: Center(
//         child: FutureBuilder<List<User>>(
//           future: getProducts(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return ListView.builder(
//                   itemCount: snapshot.data!.length,
//                   itemBuilder: ((context, index) {
//                     return Container(
//                       height: 180,
//                       child: GestureDetector(
//                         onTap: () {
//                           Navigator.push(context,
//                               MaterialPageRoute(builder: ((context) {
//                             return ProductDetailPage(
//                               product: snapshot.data![index],
//                             );
//                           })));
//                         },
//                         child: Card(
//                           elevation: 5,
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Row(
//                               children: [
//                                 Image.network(
//                                   snapshot.data![index].image_url,
//                                   height: 100,
//                                   width: 100,
//                                 ),
//                                 Expanded(
//                                   child: Container(
//                                     padding: EdgeInsets.all(15),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceAround,
//                                       children: [
//                                         Text(
//                                           snapshot.data![index].name,
//                                           style: GoogleFonts.leagueGothic(
//                                               fontSize: 24,
//                                               fontWeight: FontWeight.bold,
//                                               letterSpacing: 2),
//                                         ),
//                                         Text(
//                                           snapshot.data![index].description,
//                                           style: GoogleFonts.abel(),
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Row(
//                                               children: [
//                                                 GestureDetector(
//                                                     onTap: () {
//                                                       Navigator.push(context,
//                                                           MaterialPageRoute(
//                                                               builder:
//                                                                   ((context) {
//                                                         return EditProductPage(
//                                                           product: snapshot
//                                                               .data![index],
//                                                         );
//                                                       })));
//                                                     },
//                                                     child: Icon(Icons.edit)),
//                                                 SizedBox(
//                                                   width: 10,
//                                                 ),
//                                                 GestureDetector(
//                                                   onTap: () {
//                                                     deleteProduct(snapshot
//                                                             .data![index].id)
//                                                         .then((value) {
//                                                       setState(() {});
//                                                       ScaffoldMessenger.of(
//                                                               context)
//                                                           .showSnackBar(SnackBar(
//                                                               content: Text(
//                                                                   "Berhasil dihapus")));
//                                                     });
//                                                   },
//                                                   child: Icon(Icons.delete),
//                                                 ),
//                                               ],
//                                             ),
//                                             Text(snapshot.data![index].price)
//                                           ],
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   }));
//             }
//             return Text("mama");
//           },
//         ),
//       ),
//     );
//   }
// }

// class User {
//   int id;
//   String name;
//   String description;
//   String price;
//   String image_url;

//   User(this.id, this.name, this.description, this.price, this.image_url);
// }

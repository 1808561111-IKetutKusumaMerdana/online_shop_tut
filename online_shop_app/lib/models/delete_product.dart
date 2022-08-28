import 'dart:convert';
import 'package:http/http.dart' as http;

Future deleteProduct(int productId) async {
  String id = productId.toString();
  var response = await http.delete(
    Uri.parse("http://10.0.2.2:8000/api/products/$id"),
  );

  return jsonDecode(response.body);
}

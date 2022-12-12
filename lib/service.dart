import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project/product_model.dart';

class ApiService {
  String url = "https://63387485937ea77bfdc06386.mockapi.io/product";
  String urlPost = "https://63387485937ea77bfdc06386.mockapi.io/users";

  Future<List<ProductModel>> getProduct() async {
    var apiUrl = Uri.parse(url);
    var response = await http.get(apiUrl);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body) as List;
      final data = json.map((e) => ProductModel.fromJson(e)).toList();
      return data;
    } else {
      throw Exception();
    }
  }

  Future addProduct({
    required String name,
    required String email,
    required String id,
    required String password,
  }) async {
    var apiUrl = Uri.parse(urlPost);
    var body = jsonEncode(
        {"name": name, "email": email, "password": password, "id": ""});
    var response = await http.post(apiUrl, body: body);
    // if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    return data;
    // } else {
    //   throw Exception();
    // }
  }
}

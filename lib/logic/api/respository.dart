import 'dart:convert';

import 'package:cart_example/logic/models/product.dart';
import 'package:http/http.dart';

class ApiRepository{
  String endpoint = "https://api.escuelajs.co/api/v1/products";
  getProducts() async {
    Response r = await get(Uri.parse(endpoint));
    if(r.statusCode == 200 ){
      final List result  = jsonDecode(r.body);
      return result.map((e) => Product.fromJson(e)).toList();
    }else{
      throw Exception(r.reasonPhrase);
    }
  }
}
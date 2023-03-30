import 'dart:convert';

import 'package:http/http.dart';

import '../model/item.dart';

class item_api{
  String url = 'https://fakestoreapi.com/products';
  Future<List?> fetchActivity() async {
    final response = await get(Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
    );
    //print(response.body);
    //print(response.statusCode);
    //print(response);
    if (response.statusCode == 200) {
      return Item.itemList(json.decode(response.body));
    } else {
      throw Exception('Failed to load');
    }
  }
}

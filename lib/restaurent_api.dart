import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flunkey/restaurant.dart';

class BooksApi {
  static Future<List<Restaurant>> getBooks(String query) async {
    String theUrl = "https://peclibrary.000webhostapp.com/getData.php";
    var response = await http.get(Uri.parse(theUrl), headers: {"Accept": "application/json"});

    if (response.statusCode == 200) {
      final List restaurants = json.decode(response.body);
      return restaurants.map((json) => Restaurant.fromJson(json)).where((Restaurant){
        final restaurentname= Restaurant.restaurantName.toLowerCase();
        final shortmessage= Restaurant.shortMessage.toLowerCase();
        final lowerQuery= query.toLowerCase();

        return restaurentname.contains(lowerQuery) || shortmessage.contains(lowerQuery) ;
      }
      ).toList();
    } else {
      throw Exception();
    }
  }
}
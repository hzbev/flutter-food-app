 import 'dart:convert';

import 'package:http/http.dart' as http;
 

class RecipeDataHome {
  final int? id;
  final String name;
  final String? description;
  final List<String>? ingredients;
  final bool? spicy;
  final bool? vegetarian;
  final double? price;
  final String? image;

  RecipeDataHome({
    this.id,
    required this.name,
    this.description,
    this.ingredients,
    this.spicy,
    this.vegetarian,
    this.price,
    this.image,
  });

    factory RecipeDataHome.fromJson(Map<String, dynamic> json) =>
      _locationFromJson(json);

}


RecipeDataHome _locationFromJson(Map<String, dynamic> json) {
  return RecipeDataHome(
    id: json['id'] as int?,
      name: json['name'] as String,
      description: json['description'] as String?,
      ingredients: (json['ingredients'] as List?)?.map((dynamic e) => e as String).toList(),
      spicy: json['spicy'] as bool?,
      vegetarian: json['vegetarian'] as bool?,
      price: json['price'] as double?,
      image: json['image'] as String?
  );
}

Future<List> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('http://192.168.1.20:3000/pizza/'));

  if (response.statusCode == 200) {

List<dynamic> list = jsonDecode(response.body);
// RecipeDataHome receivedData = RecipeDataHome.fromJson(list[1]);


    // print(response.body);
    // print(RecipeDataHome.fromJson(jsonDecode(response.body)));
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return list;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
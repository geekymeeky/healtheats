import 'dart:convert';

Recipe foodFromJson(String str) => Recipe.fromJson(json.decode(str));

String foodToJson(Recipe data) => json.encode(data.toJson());

class Recipe {
  String img;
  String name;
  String description;
  RecipeRating? rating;

  Recipe({
    required this.img,
    required this.name,
    required this.description,
    required this.rating,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        img: json["img"],
        name: json["name"],
        description: json["description"],
        rating: RecipeRating.fromJson(json['rating']),
      );

  Map<String, dynamic> toJson() => {
        "img": img,
        "name": name,
        "description": description,
        "rating": rating?.toJson(),
      };
}

class RecipeRating {
  double rating;
  int count;

  RecipeRating({
    required this.rating,
    required this.count,
  });

  factory RecipeRating.fromJson(Map<String, dynamic> json) => RecipeRating(
        rating: json["rating"]?.toDouble(),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "rating": rating,
        "count": count,
      };
}

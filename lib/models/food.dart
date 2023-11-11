import 'dart:convert';

Food foodFromJson(String str) => Food.fromJson(json.decode(str));

String foodToJson(Food data) => json.encode(data.toJson());

class Food {
  String img;
  String name;
  String description;
  FoodRating? rating;

  Food({
    required this.img,
    required this.name,
    required this.description,
    required this.rating,
  });

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        img: json["img"],
        name: json["name"],
        description: json["description"],
        rating: FoodRating.fromJson(json['rating']),
      );

  Map<String, dynamic> toJson() => {
        "img": img,
        "name": name,
        "description": description,
        "rating": rating?.toJson(),
      };
}

class FoodRating {
  double rating;
  int count;

  FoodRating({
    required this.rating,
    required this.count,
  });

  factory FoodRating.fromJson(Map<String, dynamic> json) => FoodRating(
        rating: json["rating"]?.toDouble(),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "rating": rating,
        "count": count,
      };
}

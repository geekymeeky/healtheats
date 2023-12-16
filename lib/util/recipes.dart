import 'package:healtheats/models/recipe.dart';

List<Recipe> recipes = [
  Recipe.fromJson({
    "img": "assets/food1.jpg",
    "name": "Spaghetti",
    "description": "Creamy pasta with bacon and eggs",
    "rating": {"rating": 4.5, "count": 120}
  }),
  Recipe.fromJson({
    "img": "assets/food2.jpg",
    "name": "Chicken Sandwich",
    "description": "Slow-cooked pulled chicken with BBQ sauce",
    "rating": {"rating": 4.4, "count": 115}
  }),
  Recipe.fromJson({
    "img": "assets/food3.jpg",
    "name": "Idli",
    "description": "South indian delecta served with fresh coconut sauce",
    "rating": {"rating": 4.2, "count": 90}
  }),
  Recipe.fromJson({
    "img": "assets/food4.jpg",
    "name": "Caesar Salad",
    "description": "Fresh romaine lettuce with Caesar dressing",
    "rating": {"rating": 4.6, "count": 130}
  }),
  Recipe.fromJson({
    "img": "assets/food5.jpg",
    "name": "Hamburger",
    "description": "Classic beef patty with lettuce and tomato",
    "rating": {"rating": 4.2, "count": 85}
  }),
  Recipe.fromJson({
    "img": "assets/food6.jpg",
    "name": "Eggplant Parmesan",
    "description": "Breaded eggplant with marinara and cheese",
    "rating": {"rating": 4.0, "count": 75}
  }),
];

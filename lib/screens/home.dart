import 'package:flutter/material.dart';
import 'package:healtheats/models/recipe.dart';
import 'package:healtheats/repositories/recipe.dart';
import 'package:healtheats/responses/get_all_response.dart';
import 'package:healtheats/screens/featured.dart';
import 'package:healtheats/util/categories.dart';
import 'package:healtheats/util/home_category.dart';
import 'package:healtheats/widgets/grid_product.dart';
import 'package:healtheats/widgets/slider_item.dart';
import 'package:healtheats/util/recipes.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  Future<List<RecipePrismicResponse>?> getPrismicResponse() async {
    RecipeRepository repo = RecipeRepository();

    return await repo.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      child: ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                "Featured",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w800,
                ),
              ),
              TextButton(
                child: Text(
                  "View More",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const DishesScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          CarouselSlider(
            items: map<Widget>(
              recipes,
              (index, i) {
                Recipe food = recipes[index];
                return SliderItem(
                  food: food,
                  isFav: false,
                  raters: 23,
                );
              },
            ).toList(),
            options: CarouselOptions(
                viewportFraction: 1.0,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  setState(() {});
                }),
          ),
          const SizedBox(height: 20.0),
          const Text(
            "Food Categories",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 10.0),
          SizedBox(
            height: 65.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                Map cat = categories[index];
                return HomeCategory(
                  icon: cat['icon'],
                  title: cat['name'],
                  items: cat['items'].toString(),
                  isHome: true,
                );
              },
            ),
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                "Popular Items",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w800,
                ),
              ),
              TextButton(
                child: Text(
                  "View More",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          GridView.builder(
            shrinkWrap: true,
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 1.25),
            ),
            itemCount: recipes.length,
            itemBuilder: (BuildContext context, int index) {
              return GridProduct(
                food: recipes[index],
                isFav: false,
                raters: 23,
              );
            },
          ),
          const SizedBox(height: 30),
          // FutureBuilder<List<RecipePrismicResponse>?>(
          //   future: getPrismicResponse(),
          //   builder: (context, snapshot) {
          //     switch (snapshot.connectionState) {
          //       case ConnectionState.waiting:
          //         return const Center(
          //           child: CircularProgressIndicator(),
          //         );
          //       case ConnectionState.done:
          //         if (snapshot.hasError) {
          //           return Text(snapshot.error.toString());
          //         } else {
          //           return Text(snapshot.data![0].toJson().toString());
          //         }

          //       default:
          //         return const Text('Unhandle State');
          //     }
          //   },
          // ),
        ],
      ),
    );
  }

  bool get wantKeepAlive => true;
}

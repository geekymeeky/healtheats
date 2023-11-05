import 'package:flutter/material.dart';
import 'package:healtheats/util/const.dart';
import 'package:healtheats/util/foods.dart';
import 'package:healtheats/widgets/rating.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.primary),
        surfaceTintColor: Theme.of(context).colorScheme.surfaceTint,
        foregroundColor: Theme.of(context).colorScheme.primary,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_backspace,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          "Item Details",
        ),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 10.0),
            Stack(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3.2,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      "${foods[1]['img']}",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  right: -10.0,
                  bottom: 3.0,
                  child: RawMaterialButton(
                    onPressed: () {},
                    fillColor: Theme.of(context).colorScheme.surfaceTint,
                    shape: const CircleBorder(),
                    elevation: 4.0,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Icon(
                        isFav ? Icons.favorite : Icons.favorite_border,
                        color: Theme.of(context).colorScheme.onInverseSurface,
                        size: 17,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Text(
              "${foods[1]['name']}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
              maxLines: 2,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0, top: 2.0),
              child: Row(
                children: <Widget>[
                  Rating(
                    starCount: 5,
                    color: Constants.ratingBG,
                    allowHalfRating: true,
                    rating: 5.0,
                    size: 10.0,
                  ),
                  const SizedBox(width: 10.0),
                  const Text(
                    "5.0 (23 Reviews)",
                    style: TextStyle(
                      fontSize: 11.0,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0, top: 2.0),
              child: Row(
                children: <Widget>[
                  const Text(
                    "20 Pieces",
                    style: TextStyle(
                      fontSize: 11.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Text(
                    r"$90",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w900,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              "Product Description",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 10.0),
            const Text(
              "Nulla quis lorem ut libero malesuada feugiat. Lorem ipsum dolor "
              "sit amet, consectetur adipiscing elit. Curabitur aliquet quam "
              "id dui posuere blandit. Pellentesque in ipsum id orci porta "
              "dapibus. Vestibulum ante ipsum primis in faucibus orci luctus "
              "et ultrices posuere cubilia Curae; Donec velit neque, auctor "
              "sit amet aliquam vel, ullamcorper sit amet ligula. Donec"
              " rutrum congue leo eget malesuada. Vivamus magna justo,"
              " lacinia eget consectetur sed, convallis at tellus."
              " Vivamus suscipit tortor eget felis porttitor volutpat."
              " Donec rutrum congue leo eget malesuada."
              " Pellentesque in ipsum id orci porta dapibus.",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:healtheats/screens/main_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Walkthrough extends StatefulWidget {
  const Walkthrough({super.key});

  @override
  State<Walkthrough> createState() => _WalkthroughState();
}

class _WalkthroughState extends State<Walkthrough> {
  List pageInfos = [
    {
      "title": "Nutritional Delights",
      "body":
          "Explore a wide range of delicious, nutritious recipes.Enjoy healthy eating without sacrificing flavor.",
      "img": "assets/on1.png",
    },
    {
      "title": "Personalized Nutrition",
      "body":
          "Tailor recipes and meal plans to your dietary preferences. Set and track your health and nutrition goals.",
      "img": "assets/on2.png",
    },
    {
      "title": "Informed Choices",
      "body":
          "Access detailed nutritional information for every recipe. Make healthier choices with calorie counts and macronutrient breakdowns.",
      "img": "assets/on3.png",
    },
  ];
  @override
  Widget build(BuildContext context) {
    List<PageViewModel> pages = [
      for (int i = 0; i < pageInfos.length; i++) _buildPageModel(pageInfos[i])
    ];

    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: IntroductionScreen(
            globalBackgroundColor: Theme.of(context).colorScheme.background,
            pages: pages,
            onDone: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const MainScreen();
                  },
                ),
              );
            },
            onSkip: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const MainScreen();
                  },
                ),
              );
            },
            showSkipButton: true,
            skip: const Text("Skip"),
            next: Text(
              "Next",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            done: Text(
              "Done",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildPageModel(Map item) {
    return PageViewModel(
      title: item['title'],
      body: item['body'],
      image: Image.asset(
        item['img'],
        height: 185.0,
      ),
      decoration: PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).colorScheme.onBackground,
        ),
        bodyTextStyle: const TextStyle(fontSize: 15.0),
        pageColor: Theme.of(context).colorScheme.background,
      ),
    );
  }
}

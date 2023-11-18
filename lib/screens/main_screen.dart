import 'package:flutter/material.dart';
import 'package:healtheats/screens/favorite_screen.dart';
import 'package:healtheats/screens/home.dart';
import 'package:healtheats/screens/profile.dart';
import 'package:healtheats/screens/search.dart';
import 'package:healtheats/util/const.dart';
import 'package:healtheats/widgets/cutom_bottom_navigation.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController _pageController;
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme:
              IconThemeData(color: Theme.of(context).colorScheme.primary),
          surfaceTintColor: Theme.of(context).colorScheme.surfaceTint,
          foregroundColor: Theme.of(context).colorScheme.primary,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            Constants.appName,
          ),
          elevation: 0.0,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return Profile();
                    },
                  ),
                );
              },
              icon: const Icon(
                Icons.settings,
              ),
            )
          ],
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: onPageChanged,
          children: const <Widget>[
            Home(),
            FavoriteScreen(),
            SearchScreen(),
          ],
        ),
        bottomNavigationBar: CustomBottomNavigation(
          page: _page,
          pageController: _pageController,
        ),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          elevation: 4.0,
          child: const Icon(
            Icons.search,
          ),
          onPressed: () => _pageController.jumpToPage(2),
        ),
      ),
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }
}

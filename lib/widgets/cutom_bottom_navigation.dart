import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({
    super.key,
    required int page,
    required PageController pageController,
  })  : _page = page,
        _pageController = pageController;

  final int _page;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Theme.of(context).colorScheme.surface,
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const SizedBox(width: 7),
          IconButton(
            icon: const Icon(
              Icons.home,
              size: 24.0,
            ),
            color: _page == 0
                ? Theme.of(context).colorScheme.onSurface
                : Theme.of(context).colorScheme.inverseSurface,
            onPressed: () => _pageController.jumpToPage(0),
          ),
          IconButton(
            icon: const Icon(
              Icons.favorite,
              size: 24.0,
            ),
            color: _page == 1
                ? Theme.of(context).colorScheme.onSurface
                : Theme.of(context).colorScheme.inverseSurface,
            onPressed: () => _pageController.jumpToPage(1),
          ),
          const SizedBox(width: 7),
        ],
      ),
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mobile_app/screen/onboarding_screen/indicator/indicator_widgets.dart';
import 'package:mobile_app/screen/onboarding_screen/widgets/onboarding_widgets.dart';

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  int _activePage = 0;

  void onNextPage() {
    if (_activePage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastEaseInToSlowEaseOut,
      );
    }
  }

  final List<Map<String, dynamic>> _pages = [
    {
      'color': '#ff8c00',
      'title': 'Streamlined Shipments',
      'image': 'assets/onboarding/logistics1.png',
      'description':
          "Efficient and organized shipment tracking. Keep an eye on your packages with real-time updates.",
      'skip': true
    },
    {
      'color': '#4caf50',
      'title': 'Reliable Delivery',
      'image': 'assets/onboarding/logistics2.png',
      'description':
          'Ensure timely and safe delivery of your goods. Our reliable network guarantees quick service.',
      'skip': true
    },
    {
      'color': '#2196f3',
      'title': 'Track Your Cargo',
      'image': 'assets/onboarding/logistics3.png',
      'description':
          'Stay informed with real-time tracking. Easily manage and monitor your shipments from start to finish.',
      'skip': false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _pages.length,
            scrollBehavior: AppScrollBehavior(),
            onPageChanged: (int page) {
              setState(() {
                _activePage = page;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return IntroWidgets(
                index: index,
                color: _pages[index]['color'],
                title: _pages[index]['title'],
                description: _pages[index]['description'],
                skip: _pages[index]['skip'],
                image: _pages[index]['image'],
                onTab: onNextPage,
              );
            },
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 1.75,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: buildIndicator(_activePage, _pages.length),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_app/components/banners/M/banner_m_style_2.dart';
import 'package:mobile_app/components/banners/M/banner_m_style_3.dart';
import 'package:mobile_app/components/banners/M/banner_m_style_4.dart';
import 'package:mobile_app/components/indicator/dot_indicators.dart';
import 'package:mobile_app/constants.dart';

import '../../../../components/banners/M/banner_m_style_1.dart';

class OffersCarousel extends StatefulWidget {
  const OffersCarousel({
    super.key,
  });

  @override
  State<OffersCarousel> createState() => _OffersCarouselState();
}

class _OffersCarouselState extends State<OffersCarousel> {
  int _selectedIndex = 0;
  late PageController _pageController;
  late Timer _timer;

  // Offers List
  List offers = [
    BannerMStyle1(
      text: "Fast Delivery  \nAcross the Country",
      press: () {},
    ),
    BannerMStyle2(
      title: "50% Off on \nFirst Shipment",
      subtitle: "Limited Time Offer",
      discountParcent: 50,
      press: () {},
    ),
    BannerMStyle3(
      title: "Secure and Reliable \nTransport",
      discountParcent: 20,
      press: () {},
    ),
    BannerMStyle4(
      title: "Free Pickup \nOn All Orders",
      subtitle: "No Hidden Fees",
      discountParcent: 100,
      press: () {},
    ),
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (_selectedIndex < offers.length - 1) {
        _selectedIndex++;
      } else {
        _selectedIndex = 0;
      }

      _pageController.animateToPage(
        _selectedIndex,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutCubic,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.87,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: offers.length,
            onPageChanged: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            itemBuilder: (context, index) => offers[index],
          ),
          FittedBox(
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: SizedBox(
                height: 16,
                child: Row(
                  children: List.generate(
                    offers.length,
                    (index) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(left: defaultPadding / 4),
                        child: DotIndicator(
                          isActive: index == _selectedIndex,
                          activeColor: Colors.white70,
                          inActiveColor: Colors.white54,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

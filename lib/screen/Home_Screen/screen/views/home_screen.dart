import 'package:flutter/material.dart';
import 'package:mobile_app/components/banners/S/banner_s_style_1.dart';
import 'package:mobile_app/components/banners/S/banner_s_style_5.dart';
import 'package:mobile_app/constants.dart';
import '../components/top_deliveries.dart';
import '../components/offers.dart';
import '../components/offer_carousel_and_services.dart';
import '../components/popular_services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: OffersCarouselAndCategories()),
            const SliverToBoxAdapter(child: PopularProducts()),
            const SliverPadding(
              padding: EdgeInsets.symmetric(vertical: defaultPadding * 1.5),
              sliver: SliverToBoxAdapter(child: FlashSale()),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  BannerSStyle1(
                    title: "Latest \nShipments",
                    subtitle: "UNBEATABLE RATES",
                    discountParcent: 50,
                    press: () {
                      Navigator.pushNamed(context, "");
                    },
                  ),
                  const SizedBox(height: defaultPadding / 4),
                ],
              ),
            ),
            const SliverToBoxAdapter(child: BestSellers()),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: defaultPadding * 1.5),
                  const SizedBox(height: defaultPadding / 4),
                  BannerSStyle5(
                    title: "Logistics \nDeals",
                    subtitle: "Up to 50% Off",
                    bottomText: "Explore Now".toUpperCase(),
                    press: () {},
                  ),
                  const SizedBox(height: defaultPadding / 4),
                ],
              ),
            ),
            // const SliverToBoxAdapter(child: BestSellers()),
          ],
        ),
      ),
    );
  }
}

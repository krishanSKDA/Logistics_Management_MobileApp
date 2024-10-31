import 'package:flutter/material.dart';
import 'package:mobile_app/components/banners/M/banner_m_with_counter.dart';
import 'package:mobile_app/components/models/discount.dart';
import 'package:mobile_app/constants.dart';

class FlashSale extends StatelessWidget {
  const FlashSale({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BannerMWithCounter(
          duration: const Duration(hours: 8),
          text: "Limited Time Shipping Discounts \nUp to 30% Off",
          press: () {},
        ),
        const SizedBox(height: defaultPadding / 2),
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Text(
            "Current Offers",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const DiscountBanner(),
      ],
    );
  }
}

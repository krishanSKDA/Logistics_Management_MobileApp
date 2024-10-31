import 'package:flutter/material.dart';
import 'package:mobile_app/constants.dart';
import 'all_shipments.dart';
import 'offers_carousel.dart';

class OffersCarouselAndCategories extends StatelessWidget {
  const OffersCarouselAndCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const OffersCarousel(),
        const SizedBox(height: defaultPadding / 2),
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Text(
            "Services",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        const Categories(),
      ],
    );
  }
}

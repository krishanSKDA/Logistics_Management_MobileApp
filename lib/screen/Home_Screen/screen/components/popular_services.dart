import 'package:flutter/material.dart';
import 'package:mobile_app/components/models/service_card.dart';
import 'package:mobile_app/constants.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: defaultPadding / 2),
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Text(
            "Popular Services",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        SizedBox(
          height: 220,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              ServiceCard(
                imageUrl: 'assets/images/fast_delivery_card.jpg',
                title: 'Fast Delivery',
                description: 'Get your packages delivered swiftly.',
              ),
              ServiceCard(
                imageUrl: 'assets/images/express.jpg',
                title: 'Express Shipping',
                description: 'Shipping in 24 hours or less.',
              ),
              ServiceCard(
                imageUrl: 'assets/images/one_day.jpg',
                title: 'Next Day Delivery',
                description: 'Get your package the very next day.',
              ),
              ServiceCard(
                imageUrl: 'assets/images/international.jpg',
                title: 'International Shipping',
                description: 'Shipping worldwide with tracking.',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

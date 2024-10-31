import 'package:flutter/material.dart';
import 'package:mobile_app/components/banner_discount_tag.dart';
import 'package:mobile_app/constants.dart';
import 'banner_m.dart';

class BannerMStyle2 extends StatelessWidget {
  const BannerMStyle2({
    super.key,
    this.image = "assets/images/first_shipment.jpg",
    required this.title,
    required this.press,
    this.subtitle,
    required this.discountParcent,
  });

  final String image;
  final String title;
  final String? subtitle;
  final int discountParcent;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: BannerM(
        image: image,
        press: press,
        children: [
          Positioned.fill(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  color: Colors.black.withOpacity(0.4),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title.toUpperCase(),
                        style: const TextStyle(
                          fontFamily: grandisExtendedFont,
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: defaultPadding / 4),
                      if (subtitle != null)
                        Text(
                          subtitle!.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: defaultPadding),
                const SizedBox(
                  height: 48,
                  width: 48,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: BannerDiscountTag(percentage: discountParcent),
          ),
        ],
      ),
    );
  }
}

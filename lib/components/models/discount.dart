import 'package:flutter/material.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 16, 13, 189),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.local_shipping,
            size: 40,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Text.rich(
              TextSpan(
                style: TextStyle(color: Color.fromARGB(255, 224, 248, 3)),
                children: [
                  TextSpan(text: "Exclusive Logistics Offer\n"),
                  TextSpan(
                    text: "Enjoy 20% Cashback on Shipping!",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

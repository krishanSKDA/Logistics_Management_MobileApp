import 'package:flutter/material.dart';

class NoNotificationScreen extends StatelessWidget {
  const NoNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "You have no notifications.",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

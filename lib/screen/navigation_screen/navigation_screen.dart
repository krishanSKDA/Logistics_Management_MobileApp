import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/screen/Home_Screen/screen/views/home_screen.dart';
import 'package:mobile_app/screen/Notification/notifications_screen.dart';
import 'package:mobile_app/screen/Order_History_Screen/order_history.dart';
import 'package:mobile_app/screen/Product_Screen/home/product_screen.dart';
import 'package:mobile_app/screen/Profile_screen/views/profile_screen.dart';
import 'package:mobile_app/screen/Search_Screen/search_screen.dart';
import 'package:mobile_app/screen/Shipment_screen/shipment_screen.dart';
import 'package:mobile_app/screen/navigation_screen/side_menu.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  // Define your navigation items here
  final List<Widget> _navigationItem = [
    const Icon(Icons.local_shipping),
    const Icon(Icons.history),
    const Icon(Icons.home),
    const Icon(Icons.shopping_bag),
    const Icon(Icons.person),
  ];

  // List of screens corresponding to each navigation item
  final List<Widget> _screens = [
    const ShipmentScreen(),
    const OrderHistoryScreen(),
    const HomeScreen(),
    const ProductScreen(),
    const ProfileScreen(),
  ];

  int _currentIndex = 2;
  Color bgColor = Colors.yellow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: AppBar(
        title: const Text(
          'BRIDGELOGIX',
        ),
        backgroundColor: Colors.blueAccent[300],
        elevation: 4,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_sharp),
            tooltip: 'Search',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SearchScreen()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications_active_sharp),
            tooltip: 'Notifications',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NotificationsScreen()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.person_add_alt_1),
            tooltip: 'Profile',
            onPressed: () {
              setState(() {
                _currentIndex = 3;
              });

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileScreen()));
            },
          ),
        ],
      ),
      body: _screens[_currentIndex], // Display the current screen
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: bgColor,
        items: _navigationItem,
        index: _currentIndex,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            if (index == 0) {
              bgColor = Colors.blue;
            } else if (index == 1) {
              bgColor = Colors.blue;
            } else if (index == 2) {
              bgColor = Colors.blue;
            } else if (index == 3) {
              bgColor = Colors.blue;
            } else if (index == 4) {
              bgColor = Colors.blue;
            }
          });
        },
      ),
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;
  final String text;

  const PlaceholderWidget(this.color, this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}

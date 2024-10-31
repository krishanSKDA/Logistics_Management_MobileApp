import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_app/screen/Login_Screen/splash_screen.dart';
import 'package:mobile_app/screen/navigation_screen/json/customer_support.dart';
import 'package:mobile_app/screen/navigation_screen/json/drivers_screen.dart';
import 'package:mobile_app/screen/navigation_screen/navigation_screen.dart';
import 'dart:convert';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  List _drivers = [];
  List _customerSupport = [];

  @override
  void initState() {
    super.initState();
    _loadDriversData();
    _loadCustomerSupportData();
  }

  Future<void> _loadDriversData() async {
    final String response = await rootBundle.loadString('assets/Drivers.json');
    final data = await json.decode(response);
    setState(() {
      _drivers = data['drivers'];
    });
  }

//Try  to find error
  // Future<void> _loadCustomerSupportData() async {
  //   final String response =
  //       await rootBundle.loadString('assets/CustomerSupport.json');
  //   final data = json.decode(response);
  //   setState(() {
  //     _customerSupport = data['support'];
  //   });

  // }
  Future<void> _loadCustomerSupportData() async {
    try {
      final String response =
          await rootBundle.loadString('assets/CustomerSupport.json');
      final data = json.decode(response);
      setState(() {
        _customerSupport = data['support'];
      });
      print("Customer support data loaded successfully.");
    } catch (e) {
      print("Error loading Customer Support data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(
              "Krishan Danushka",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            accountEmail: const Text(
              "danushkaaberathna0@gmail.com",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset("assets/images/Side_user.jpg"),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              image: DecorationImage(
                image:
                    const AssetImage("assets/images/background_sidemenu.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Dashboard"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NavigationScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.local_shipping),
            title: const Text("Shipments"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Drivers"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DriversScreen(drivers: _drivers),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.support_agent),
            title: const Text("Customer Support"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CustomerSupportScreen(support: _customerSupport),
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NavigationScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Log Out"),
            tileColor: Colors.red[50],
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SplashScreen()));
            },
          ),
        ],
      ),
    );
  }
}

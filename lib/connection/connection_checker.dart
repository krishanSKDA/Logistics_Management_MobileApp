import 'dart:async';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class ConnectionChecker extends StatefulWidget {
  final Widget child;

  const ConnectionChecker({required this.child, super.key});

  @override
  State<ConnectionChecker> createState() => _ConnectionCheckerState();
}

class _ConnectionCheckerState extends State<ConnectionChecker> {
  bool _isConnectedToInternet = true;
  bool _showRestoreScreen = false;

  StreamSubscription? _internetConnectionStreamSubscription;

  @override
  void initState() {
    super.initState();
    _internetConnectionStreamSubscription =
        InternetConnection().onStatusChange.listen((event) {
      print(event);
      switch (event) {
        case InternetStatus.connected:
          setState(() {
            _isConnectedToInternet = true;
            _showRestoreScreen = true;
          });

          // Hide the "Connection Restored" screen after 3 seconds
          Future.delayed(const Duration(seconds: 3), () {
            setState(() {
              _showRestoreScreen = false;
            });
          });
          break;

        case InternetStatus.disconnected:
          setState(() {
            _isConnectedToInternet = false;
            _showRestoreScreen = false;
          });
          _showConnectionLostDialog();
          break;

        default:
          setState(() {
            _isConnectedToInternet = false;
          });
          _showConnectionLostDialog();
          break;
      }
    });
  }

  @override
  void dispose() {
    _internetConnectionStreamSubscription?.cancel();
    super.dispose();
  }

  // Method to show a dialog when the connection is lost
  void _showConnectionLostDialog() {
    showDialog(
      context: context,
      barrierDismissible:
          false, // Prevents closing the dialog until connection is restored
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Connection Lost"),
          content: const Text("You have lost internet connection."),
          actions: <Widget>[
            ElevatedButton(
              child: const Text("Retry"),
              onPressed: () {
                if (_isConnectedToInternet) {
                  Navigator.of(context)
                      .pop(); // Close the dialog when connection is restored
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Main app content
        widget.child,

        // Show the "Connection Restored" screen
        if (_showRestoreScreen)
          Container(
            color: Colors.black.withOpacity(0.7),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.wifi, size: 80, color: Colors.green),
                  SizedBox(height: 20),
                  Text(
                    "Connection Restored",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

// Your main screen (home page)
class YourMainScreen extends StatelessWidget {
  const YourMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your App Home")),
      body: const Center(
        child: Text("Welcome to Your App!"),
      ),
    );
  }
}

// Another screen example
class OtherScreen extends StatelessWidget {
  const OtherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Other Screen")),
      body: const Center(
        child: Text("This is another screen in the app."),
      ),
    );
  }
}

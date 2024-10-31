import 'package:flutter/material.dart';

class NotificationOptionsScreen extends StatelessWidget {
  const NotificationOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SwitchListTile(
              title: const Text("Enable Notifications"),
              value: true,
              onChanged: (bool value) {
                // Handle enabling/disabling notifications
              },
            ),
            SwitchListTile(
              title: const Text("Enable Sound"),
              value: false,
              onChanged: (bool value) {},
            ),
          ],
        ),
      ),
    );
  }
}

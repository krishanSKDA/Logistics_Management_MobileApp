import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_app/screen/Notification/components/enable_notification_screen.dart';
import 'package:mobile_app/screen/Notification/components/no_notification_screen.dart';
import 'package:mobile_app/screen/Notification/components/notification_options_screen.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample notification data relevant to logistics
    final List<String> notifications = [
      "Your shipment #12345 has been dispatched.",
      "Delivery of shipment #67890 is delayed by 2 days.",
      "New updates on shipment #54321 are available.",
      "Reminder: Your package #98765 will be delivered tomorrow.",
      "Alert: Shipment #11223 requires your signature upon delivery.",
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationOptionsScreen(),
                ),
              );
            },
            icon: SvgPicture.asset(
              "assets/icons/DotsV.svg",
              colorFilter: ColorFilter.mode(
                Theme.of(context).iconTheme.color!,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
      body: notifications.isEmpty
          ? const NoNotificationScreen()
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    leading: const Icon(Icons.notifications),
                    title: Text(notifications[index]),
                    onTap: () {
                      // Handle notification tap (e.g., navigate to details screen)
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const EnableNotificationScreen(),
            ),
          );
        },
        child: const Icon(Icons.add_alert),
      ),
    );
  }
}

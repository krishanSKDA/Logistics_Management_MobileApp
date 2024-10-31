import 'package:flutter/material.dart';

class DriversScreen extends StatelessWidget {
  final List drivers;

  const DriversScreen({super.key, required this.drivers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drivers"),
      ),
      body: ListView.builder(
        itemCount: drivers.length,
        itemBuilder: (context, index) {
          final driver = drivers[index];

          // Logic to handle experience display
          final experience = driver['experience'] is int
              ? '${driver['experience']} years'
              : driver['experience'];

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            elevation: 3,
            child: ListTile(
              leading: const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.blueAccent,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              title: Text(
                driver['name'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Age: ${driver['age']}'),
                  Text('License: ${driver['license']}'),
                  Text('Experience: $experience'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomerSupportScreen extends StatelessWidget {
  final List support;

  const CustomerSupportScreen({super.key, required this.support});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer Support"),
      ),
      body: support.isEmpty
          ? const Center(child: Text("No customer support data available."))
          : ListView.builder(
              itemCount: support.length,
              itemBuilder: (context, index) {
                final supportItem = support[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  elevation: 3,
                  child: ListTile(
                    leading: const Icon(
                      Icons.support_agent,
                      color: Colors.blueAccent,
                      size: 40,
                    ),
                    title: Text(
                      supportItem['name'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Contact: ${supportItem['contact']}'),
                        Text('Email: ${supportItem['email']}'),
                        Text('Available: ${supportItem['available']}'),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

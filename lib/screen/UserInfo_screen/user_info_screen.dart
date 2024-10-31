import 'package:flutter/material.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Profile"),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text("Edit", style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("assets/images/man.png"),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Krishan Danushka",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "danusgkaabearathna0@gmail.com",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            buildUserInfoTile("Name", "krishan"),
            buildUserInfoTile("Date of birth", "Date of birth"),
            buildUserInfoTile("Phone number", "+94-76-357-2887"),
            buildUserInfoTile("Gender", "Male"),
            buildUserInfoTile("Email", "danusgkaabearathna0@gmail.com"),
            ListTile(
              title: const Text("Password"),
              trailing: TextButton(
                onPressed: () {},
                child: const Text(
                  "Change password",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildUserInfoTile(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(title),
          trailing: Text(value),
        ),
        const Divider(),
      ],
    );
  }
}

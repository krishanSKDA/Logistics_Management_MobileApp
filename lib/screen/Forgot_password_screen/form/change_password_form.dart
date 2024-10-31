import 'package:flutter/material.dart';

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({super.key});

  @override
  _ChangePasswordFormState createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Add prefix icon to Password field
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              hintText: 'Password',
              filled: true,
              fillColor: Color(0xFFF5FCF9),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.0 * 1.5, vertical: 16.0),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              // Add an icon
              prefixIcon: Icon(Icons.lock),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          const SizedBox(height: 16.0),
          // Add prefix icon to Confirm Password field
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              hintText: 'Confirm Password',
              filled: true,
              fillColor: Color(0xFFF5FCF9),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.0 * 1.5, vertical: 16.0),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              // Add an icon
              prefixIcon: Icon(Icons.lock_outline),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please confirm your password';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}

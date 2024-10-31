import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/screen/otp_screen/otp_screen.dart';
import 'package:mobile_app/utils/api_endpoint.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class RegisterationController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> registerWithEmail() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.registerEmail);

      Map body = {
        "name": nameController.text,
        "email": emailController.text.trim(),
        "password": passwordController.text
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      // Check for success response
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['status']) {
          var token = json['token'];

          // Store token in shared preferences
          final SharedPreferences prefs = await _prefs;
          await prefs.setString('token', token);

          nameController.clear();
          emailController.clear();
          passwordController.clear();

          FocusScope.of(Get.context!).unfocus();

          Get.offAll(() => const OtpScreen());
        } else {
          throw json['message'] ?? "Unknown Error Occurred";
        }
      } else {
        throw jsonDecode(response.body)["message"] ?? "Unknown Error Occurred";
      }
    } catch (e) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: const Text('Error'),
              contentPadding: const EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          });
    }
  }
}

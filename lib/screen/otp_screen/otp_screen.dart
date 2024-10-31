import 'package:flutter/material.dart';
import 'package:mobile_app/screen/otp_screen/form/otp_form.dart';

import 'service/otp_service.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  bool isLoading = false;

  void sendOtp() async {
    setState(() {
      isLoading = true;
    });

    bool otpSent = await OtpService.sendOtp();

    setState(() {
      isLoading = false;
    });

    if (otpSent) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('OTP has been sent successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to send OTP. Please try again.')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    sendOtp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    "OTP Verification",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "We sent your code to +94 **** *** \nThis code will expire in 00:30",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color.fromARGB(255, 58, 53, 53)),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  const OtpForm(),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                  isLoading
                      ? const CircularProgressIndicator()
                      : TextButton(
                          onPressed: sendOtp,
                          child: const Text(
                            "Resend OTP Code",
                            style: TextStyle(
                                color: Color.fromARGB(255, 21, 97, 211)),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

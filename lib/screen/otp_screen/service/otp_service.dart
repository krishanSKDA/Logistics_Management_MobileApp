import 'dart:async';

class OtpService {
  // Function to simulate sending the OTP
  static Future<bool> sendOtp() async {
    try {
      await Future.delayed(const Duration(seconds: 3));
      return true;
    } catch (e) {
      return false;
    }
  }
}

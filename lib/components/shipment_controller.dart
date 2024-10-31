import 'package:http/http.dart' as http;
import 'dart:convert';

const String apiUrl =
    'https://logistic.4gbxsolutions.com/api/orders'; // Your API URL

Future<void> sendOrderData(Map<String, dynamic> orderData) async {
  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer your_api_key',
      },
      body: json.encode(orderData),
    );

    if (response.statusCode == 200) {
      // Handle success
      print('Order submitted successfully');
    } else {
      // Handle failure
      print('Failed to submit order: ${response.body}');
    }
  } catch (e) {
    // Handle error
    print('Error: $e');
  }
}

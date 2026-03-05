import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiConfig {
  static const String baseUrl = 'https://app.pamtech.co.tz/api';

static Future<bool> createStation(
      Map<String, dynamic> data, String token) async {
    final url = Uri.parse('$baseUrl/stations');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token', // ✅ Include token if required
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      print('Failed to create station: ${response.body}');
      return false;
    }
  }
  // Auth endpoints
  static const String register = '$baseUrl/register';
  static const String login = '$baseUrl/login';
  static const String forgotPassword = '$baseUrl/forgot-password';

  // Other endpoints
  static String getStations = '$baseUrl/stations';
  static String createTank = '$baseUrl/fuel-tanks';
}

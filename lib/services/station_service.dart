import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fuelflow_app/config/api_config.dart';

class StationService {
  static Future<bool> createStation(
      Map<String, dynamic> data, String token) async {
    final url = Uri.parse('${ApiConfig.baseUrl}/stations');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      final Map<String, dynamic> errorResponse = jsonDecode(response.body);
      final errorMessage = errorResponse['message'] ?? 'Unknown error';
      print('Station creation failed: $errorMessage');
      return false;
    }
  }
}

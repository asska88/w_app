import 'package:w_app/constants.dart';
import 'package:w_app/weathermodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherApi {
  final String baseUrl = "http://api.weatherapi.com/v1/current.json";

  Future<ApiResponse> getCurrentWeather(String location) async {
    String apiUrl = "$baseUrl?key=$apiKey&q=$location";
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        return ApiResponse.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Gagal memuat cuaca. Status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Gagal memuat cuaca. Error: $e");
    }
  }
}

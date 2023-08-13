import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

//Sperate the logic from the maim code
class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '74ee67e4d69b43fab05223552231208';
  WeatherModel? weather;
  Future<WeatherModel?> getWeather({required String cityName}) async {
    try {
      Uri url =
          Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
      // ignore: unused_local_variable
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);

      //obj for weather model variables
       weather = WeatherModel.fromJson(data);
    // ignore: empty_catches
    } catch (e) {}
    return weather;
  }
}

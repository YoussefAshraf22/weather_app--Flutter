import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

//Sperate the logic from the maim code
class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = 'd7d336d7d785480fa6d234139230508';

  Future<WeatherModel> getWeather({required String cityName}) async {
    Uri url =
        Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
    // ignore: unused_local_variable
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);

    //obj for weather model variables
    WeatherModel weather = WeatherModel.fromJson(data);

    return weather;
  }
}

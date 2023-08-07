import 'package:flutter/material.dart';
import 'package:weather_app/services/weather_service.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Search Page'), backgroundColor: Colors.amber),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter City Name',
                label: Text(
                  'Seacrh',
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                suffixIcon: Icon(Icons.search)),
            onSubmitted: (data) {
              cityName = data;

              WeatherService weather = WeatherService();
              weather.getWeather(cityName: cityName!);
            },
          ),
        ),
      ),
    );
  }
}

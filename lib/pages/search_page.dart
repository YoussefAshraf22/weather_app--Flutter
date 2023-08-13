import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';

import '../models/weather_model.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  String? cityName;
  @override
  Widget build(BuildContext context) {
    Provider.of<WeatherProvider>(context, listen: true).weatherData;

    return Scaffold(
      appBar: AppBar(
          title: const Text('Search Page'), backgroundColor: const Color.fromARGB(255, 255, 202, 43)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: TextField(
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Enter City Name',
                label:const Text(
                  'Seacrh',
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                contentPadding:
                   const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                suffixIcon: IconButton(
                  icon:const Icon(Icons.search),
                  onPressed: () async {
                    WeatherService service = WeatherService();
                    WeatherModel? weather =
                        await service.getWeather(cityName: cityName!);
                    //provider of weather model
                    Provider.of<WeatherProvider>(context, listen: false)
                        .weatherData = weather;
                    Provider.of<WeatherProvider>(context, listen: false)
                        .cityName = cityName;
                    Navigator.pop(context);
                    
                  },
                )),
            onChanged: (data) {
              cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;

              WeatherService service = WeatherService();
              WeatherModel? weather =
                  await service.getWeather(cityName: cityName!);
              //provider of weather model
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;
              Provider.of<WeatherProvider>(context, listen: false).cityName = cityName;
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}

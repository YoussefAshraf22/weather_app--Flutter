import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/weather_model.dart';
import '../providers/weather_provider.dart';

class SearchDetails extends StatelessWidget {
  const SearchDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherData =
        Provider.of<WeatherProvider>(context, listen: true).weatherData;
    String? cityName =
        Provider.of<WeatherProvider>(context, listen: true).cityName;

    return Container(
      padding:const EdgeInsets.symmetric(vertical: 100),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        weatherData!.gitTeamColor(),
        weatherData.gitTeamColor()[400]!,
        weatherData.gitTeamColor()[300]!,
        weatherData.gitTeamColor()[200]!,
        weatherData.gitTeamColor()[100]!,
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "$cityName",
            style:const TextStyle(
                fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Updated At: ${weatherData.date}",
            style: const TextStyle(fontSize: 20, color: Colors.black),
          ),
          const SizedBox(
            height: 80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(
                weatherData.weatherIcon,
              ),
              Text(
                "Temp: ${weatherData.temp.toInt()}",
                style:const TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Max Temp: ${weatherData.maxTemp.toInt()}",
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Min Temp: ${weatherData.minTemp.toInt()}",
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Text(weatherData.weatherStateName,
              style:const TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}

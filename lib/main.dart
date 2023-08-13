import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/providers/weather_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => WeatherProvider(),
      child: const WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var weatherColor = Provider.of<WeatherProvider>(context).weatherData;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        theme: ThemeData(
            primarySwatch: weatherColor == null
                ? Colors.blue
                : weatherColor.gitTeamColor()),
        home: const SafeArea(
          child: HomePage(),
        ));
  }
}

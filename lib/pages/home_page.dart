import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_details.dart';

import '../providers/weather_provider.dart';
import 'search_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherData = Provider.of<WeatherProvider>(context, listen: true).weatherData;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchPage(),
                      ));
                },
                icon: const Icon(Icons.search))
          ],
        ),
        body: weatherData == null ? const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'There is no weather 😔',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Start searching now 🔍',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    )
                  ],
                ),
              )
            : const SearchDetails()
            );
  }
}

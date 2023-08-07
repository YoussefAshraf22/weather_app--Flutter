class WeatherModel {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;
  String weatherIcon;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName,
      required this.weatherIcon});

//Named Constractour to git data form API directly
  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0];

    return WeatherModel(
      date: data["location"]['localtime'],
      temp: jsonData['avgtemp_c '],
      maxTemp: jsonData['maxtemp_c']['value'],
      minTemp: jsonData['mintemp_c'],
      weatherStateName: jsonData['condition']['text'],
      weatherIcon: jsonData['condition']['icon'],
    );
  }
}

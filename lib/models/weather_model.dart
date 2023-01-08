import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class WeatherModel {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;
  String? iconImage;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName,
      required this.iconImage});

  factory WeatherModel.fromJson(data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];

    return WeatherModel(
      date: data['location']['localtime'],
      temp: jsonData['avgtemp_c'],
      maxTemp: jsonData['maxtemp_c'],
      minTemp: jsonData['mintemp_c'],
      weatherStateName: data['current']['condition']['text'],
      iconImage: data['current']['condition']['icon'],
    );
  }

  @override
  String toString() {
    return 'temp= $temp    maxTemp= $maxTemp   minTemp= $minTemp  date= $date';
  }

  String getImage() {
    if (weatherStateName == 'Clear') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'Partly cloudy' ||
        weatherStateName == 'Cloudy') {
      return 'assets/images/cloudy.png';
    } else if (weatherStateName == 'Mist' ||
        weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Patchy light rain' ||
        weatherStateName == 'light rain') {
      return 'assets/images/rainy.png';
    } else {
      return 'assets/images/snow.png';
    }
  }

  MaterialColor getTheme() {
    if (weatherStateName == 'Clear') {
      return Colors.orange;
    } else if (weatherStateName == 'Partly cloudy' ||
        weatherStateName == 'Cloudy') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Mist' ||
        weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Patchy light rain' ||
        weatherStateName == 'light rain') {
      return Colors.blueGrey;
    } else {
      return Colors.blue;
    }
  }
}

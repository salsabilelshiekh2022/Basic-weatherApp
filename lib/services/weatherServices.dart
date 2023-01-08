import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherServices {
  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weather;
    try {
      String baseUri = 'http://api.weatherapi.com/v1';
      String apiKey = '01dccb4a7e9b45bd88e201705230601';
      Uri url =
          Uri.parse('$baseUri/forecast.json?key=$apiKey&q=$cityName&days=7');
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      weather = WeatherModel.fromJson(data);
    } catch (e) {
      print(e);
    }

    return weather;
  }
}

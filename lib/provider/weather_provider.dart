import 'package:flutter/cupertino.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:provider/provider.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherData;
  String? cityName;

  set weatherData(WeatherModel? weather) {
    _weatherData = weather;
    notifyListeners();
  }

  WeatherModel? get weatherData => _weatherData;
}

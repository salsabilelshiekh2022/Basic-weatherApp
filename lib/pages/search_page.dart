import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/services/weatherServices.dart';

class SearchPage extends StatelessWidget {
  String? cityName;
  VoidCallback? updateUi;
  SearchPage({this.updateUi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            onChanged: (data) {
              cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;
              WeatherServices services = WeatherServices();
              WeatherModel? weather =
                  await services.getWeather(cityName: cityName!);

              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;
              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  cityName;

              Navigator.pop(context);
            },
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              label: const Text('Search'),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
              hintText: 'Search for a city',
              suffixIcon: IconButton(
                  onPressed: () async {
                    WeatherServices services = WeatherServices();
                    WeatherModel? weather =
                        await services.getWeather(cityName: cityName!);

                    Provider.of<WeatherProvider>(context, listen: false)
                        .weatherData = weather;
                    Provider.of<WeatherProvider>(context, listen: false)
                        .cityName = cityName;

                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.search)),
            ),
          ),
        ),
      ),
    );
  }
}

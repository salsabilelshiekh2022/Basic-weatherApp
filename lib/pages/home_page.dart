import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/provider/weather_provider.dart';

import '../models/weather_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void updateUi() {
    setState(() {});
  }

  WeatherModel? weatherData;
  String? cityName;

  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    cityName = Provider.of<WeatherProvider>(context).cityName;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SearchPage(
                              updateUi: updateUi,
                            )));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: weatherData == null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    'there is no weather 😔 start',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  weatherData?.getTheme() ?? Colors.blue,
                  weatherData?.getTheme()[400] ?? Colors.lightBlue,
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(flex: 3),
                    Text(
                      cityName ?? '',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 32),
                    ),
                    Text(
                      'updated: ${weatherData!.date}',
                      style: const TextStyle(fontSize: 24),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image(image: AssetImage(weatherData!.getImage())),
                        Text(
                          '${weatherData!.temp.toInt()}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 32),
                        ),
                        Column(
                          children: [
                            Text('maxTemp = ${weatherData!.maxTemp.toInt()}'),
                            const SizedBox(
                              height: 10,
                            ),
                            Text('mixTemp = ${weatherData!.minTemp.toInt()}'),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      weatherData!.weatherStateName,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 32),
                    ),
                    const Spacer(flex: 5),
                  ]),
            ),
    );
  }
}

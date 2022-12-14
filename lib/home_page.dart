import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_project/weather.dart';
import 'package:weather_project/weather_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherService weatherService = WeatherService();

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  void getWeather() async {
    await weatherService.getWeatherData();

    Navigator.push(context, await MaterialPageRoute(builder: (context) {
      return WeatherPage(weatherService: weatherService);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitRipple(color: Colors.white, size: 50),
    );
  }
}

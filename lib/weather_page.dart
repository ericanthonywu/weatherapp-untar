import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_project/weather.dart';

class WeatherPage extends StatefulWidget {
  WeatherPage({required this.weatherService});

  final WeatherService weatherService;

  @override
  State<WeatherPage> createState() => _WeatherPageeState();
}

class _WeatherPageeState extends State<WeatherPage> {
  late String temperature = "";
  late String weatherIcon = "";
  late String cityName = "";
  late bool isLoading = true;

  @override
  void initState() {
    super.initState();
    updateUI();
  }

  void updateUI() async {
    WeatherService data = await widget.weatherService.getWeatherData();
    setState(() {
      temperature = (data.temperature - 273.15).toStringAsFixed(2);
      weatherIcon = data.weatherIcon;
      cityName = data.cityName;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Image(
                  image: NetworkImage(
                      'https://openweathermap.org/themes/openweathermap/assets/img/logo_white_cropped.png')),
              Text(!isLoading ? cityName : "loading ... ", style: GoogleFonts.redressed(fontSize: 40)),
              Text(!isLoading ? '$temperature Celcius': "loading ... ", style: TextStyle(fontSize: 40))
            ],
          ),
        ),
      ),
    );
  }
}

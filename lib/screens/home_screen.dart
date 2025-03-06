import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/weather_controller.dart';

class HomeScreen extends StatelessWidget {
  final WeatherController weatherController = Get.put(WeatherController());
  final TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: cityController,
              decoration: InputDecoration(
                labelText: 'Enter city name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                weatherController.fetchWeather(cityController.text);
              },
              child: Text('Get Weather'),
            ),
            SizedBox(height: 20),
            Obx(() => weatherController.isLoading.value
                ? CircularProgressIndicator()
                : Column(
                    children: [
                      Text(
                        weatherController.weather.value.city,
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${weatherController.weather.value.temperature}°C',
                        style: TextStyle(fontSize: 22),
                      ),
                      Text(weatherController.weather.value.condition),
                    ],
                  )),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WeatherController extends GetxController {
  var city = ''.obs;
  var condition = ''.obs;

  void setWeather(String cityName, String weatherCondition) {
    city.value = cityName;
    condition.value = weatherCondition;
  }
}

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
                weatherController.setWeather(cityController.text, "Soleado");
              },
              child: Text('Confirm City'),
            ),
            SizedBox(height: 20),
            Obx(() => weatherController.city.value.isEmpty
                ? Text("No city selected")
                : Column(
                    children: [
                      Text(
                        weatherController.city.value,
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      DropdownButton<String>(
                        value: weatherController.condition.value.isEmpty
                            ? null
                            : weatherController.condition.value,
                        hint: Text("Select Weather"),
                        items: ["Soleado", "Lluvioso"].map((String weather) {
                          return DropdownMenuItem<String>(
                            value: weather,
                            child: Text(weather),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            weatherController.setWeather(
                                weatherController.city.value, value);
                          }
                        },
                      ),
                      if (weatherController.condition.value.isNotEmpty)
                        Text("Clima: ${weatherController.condition.value}"),
                    ],
                  )),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(GetMaterialApp(home: HomeScreen()));
}

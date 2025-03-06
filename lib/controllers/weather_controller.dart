import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WeatherController extends GetxController {
  var cities = ["Bogotá", "Medellín", "Cali", "Barranquilla", "Cartagena"].obs;
  var selectedWeather = {}.obs;

  void setWeather(String city, String condition) {
    selectedWeather[city] = condition;
  }
}

class HomeScreen extends StatelessWidget {
  final WeatherController weatherController = Get.put(WeatherController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Clima')),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ListView(
                  children: weatherController.cities
                      .map((city) => ListTile(
                            title: Text(city),
                            trailing: DropdownButton<String>(
                              value: weatherController.selectedWeather[city],
                              items: ["Soleado", "Lluvioso"]
                                  .map((weather) => DropdownMenuItem(
                                        value: weather,
                                        child: Text(weather),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                if (value != null) {
                                  weatherController.setWeather(city, value);
                                }
                              },
                            ),
                          ))
                      .toList(),
                )),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(GetMaterialApp(home: HomeScreen()));
}

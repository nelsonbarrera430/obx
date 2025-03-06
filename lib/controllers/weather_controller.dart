import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WeatherController extends GetxController {
  var cities = ["Bogotá", "Medellín", "Cali", "Barranquilla", "Cartagena"].obs;
  var weatherConditions = <String>[].obs;

  WeatherController() {
    weatherConditions.assignAll(List.generate(cities.length, (index) => "Soleado"));
  }

  void setWeather(int index, String condition) {
    weatherConditions[index] = condition;
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
            child: Obx(() => ListView.builder(
                  itemCount: weatherController.cities.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(weatherController.cities[index]),
                      trailing: DropdownButton<String>(
                        value: weatherController.weatherConditions[index],
                        items: ["Soleado", "Lluvioso"]
                            .map((weather) => DropdownMenuItem(
                                  value: weather,
                                  child: Text(weather),
                                ))
                            .toList(),
                        onChanged: (value) {
                          if (value != null) {
                            weatherController.setWeather(index, value);
                          }
                        },
                      ),
                    );
                  },
                )),
          ),
          Divider(),
          Text("Resumen del Clima", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Expanded(
            child: Obx(() => ListView.builder(
                  itemCount: weatherController.cities.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("${weatherController.cities[index]}: ${weatherController.weatherConditions[index]}"),
                    );
                  },
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

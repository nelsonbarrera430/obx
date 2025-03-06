// lib/controllers/weather_controller.dart
import 'package:get/get.dart';
import '../models/weather.dart';
import 'dart:math';

class WeatherController extends GetxController {
  var weather = Weather().obs;
  var isLoading = false.obs;

  Future<void> fetchWeather(String city) async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2)); // Simula un retraso de red

    try {
      // Simulamos datos de clima aleatorios
      var random = Random();
      weather.value = Weather(
        city: city,
        temperature: 15 + random.nextInt(15) + random.nextDouble(), // Entre 15°C y 30°C
        condition: _getRandomCondition(),
      );
    } catch (e) {
      Get.snackbar('Error', 'No se pudo obtener el clima');
    }

    isLoading.value = false;
  }

  String _getRandomCondition() {
    List<String> conditions = ['Soleado', 'Nublado', 'Lluvioso', 'Tormentoso', 'Nevado'];
    return conditions[Random().nextInt(conditions.length)];
  }
}

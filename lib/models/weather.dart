class Weather {
  String city;
  double temperature;
  String condition;

  Weather({this.city = '', this.temperature = 0.0, this.condition = ''});

  void updateWeather(String newCity, double newTemperature, String newCondition) {
    city = newCity;
    temperature = newTemperature;
    condition = newCondition;
  }
}

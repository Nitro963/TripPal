class WeatherInfo {
  String cityName;
  double temperature;
  double windSpeed;
  int cloudiness;
  int humidity;
  int timeZoneShift;
  String weatherMainCondition;
  String weatherIcon;

  WeatherInfo(
      {this.cityName = 'London',
      this.temperature = 24,
      this.windSpeed = 1,
      this.cloudiness = 13,
      this.humidity = 6,
      this.timeZoneShift = 0,
      this.weatherMainCondition = 'Clear',
      this.weatherIcon = '01n'});

  static WeatherInfo fromOpenWeatherMapJson(dynamic json) {
    return WeatherInfo(
      cityName: json['name'],
      // OpenWeatherMap sends whole numbers as ints (e.g. "temp": 24)
      temperature: (json['main']['temp'] as num).toDouble(),
      humidity: (json['main']['humidity'] as num).toInt(),
      cloudiness: (json['clouds']['all'] as num).toInt(),
      timeZoneShift: (json['timezone'] as num).toInt(),
      windSpeed: (json['wind']['speed'] as num).toDouble(),
      weatherMainCondition: json['weather'][0]['main'],
      weatherIcon: json['weather'][0]['icon'],
    );
  }
}

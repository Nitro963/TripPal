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

  factory WeatherInfo.fromOpenWeatherMapJson(Map<String, dynamic> json) {
    return WeatherInfo(
      cityName: json['name'],
      temperature: json['main']['temp'],
      humidity: json['main']['humidity'],
      cloudiness: json['clouds']['all'],
      timeZoneShift: json['timezone'],
      windSpeed: json['wind']['speed'],
      weatherMainCondition: json['weather'][0]['main'],
      weatherIcon: json['weather'][0]['icon'],
    );
  }
}

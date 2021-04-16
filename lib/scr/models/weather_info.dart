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

  WeatherInfo.fromOpenWeatherMapJson(json) {
    this.cityName = json['name'];
    this.temperature = json['main']['temp'];
    this.humidity = json['main']['humidity'];
    this.cloudiness = json['clouds']['all'];
    this.timeZoneShift = json['timezone'];
    this.windSpeed = json['wind']['speed'];
    this.weatherMainCondition = json['weather'][0]['main'];
    this.weatherIcon = json['weather'][0]['icon'];
  }
}

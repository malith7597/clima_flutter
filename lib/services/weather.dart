import 'package:clima_flutter/services/networking.dart';
import 'package:clima_flutter/services/location.dart';

class WeatherModel {




  Future<dynamic> getCityWeather(String cityName) async{

    String url= "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=035ec7ce0d55384e002da38fe28aac30&units=metric";
    var networkingHelper= NetworkHelper(url);
    var weatherData= await networkingHelper.getData();
    // Wait for the Future to complete before accessing the data
    return weatherData;// Access the "main" value of the returned data
  }







  Future<dynamic> getLocationWeather() async{
    var location = Location();
    await  location.getCurrentLocation();
    String url= "https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=035ec7ce0d55384e002da38fe28aac30&units=metric";
    var networkingHelper= NetworkHelper(url);
    var weatherData= await networkingHelper.getData();
    // Wait for the Future to complete before accessing the data
    return weatherData;// Access the "main" value of the returned data
  }






  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:encrypt/encrypt.dart';

final key = Key.fromUtf8('wsGhjRTiDzSjp7jWyWVbcVG7cpOqBOQ=');
final b64key = Key.fromUtf8(base64Url.encode(key.bytes));
final fernet = Fernet(b64key);
final encrypter = Encrypter(fernet);

class Main {
  final double temp;

  Main({
    this.temp,
  });

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      temp: double.parse(json['temp'].toString()),
    );
  }
}

class WeatherModel {
  final Main main;

  WeatherModel({
    this.main,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      main: Main.fromJson(json['main']),
    );
  }
}

Future<WeatherModel> getWeather() async {
  final response = await http.get(
      'https://api.openweathermap.org/data/2.5/weather?lat=28.4667&lon=77.0333&appid=77580a3797c4f2efd008403c9faf5e22&units=metric');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (response.statusCode == 200) {
    var result = json.decode(response.body);
    var model = WeatherModel.fromJson(result);
    prefs.setDouble('temp', model.main.temp);
    return model;
  } else
    throw Exception('Failed to load Weather Information');
}

Future<Day> fetchDay() async {
  final response1 =
      await http.get('https://tumulrankypanky.pythonanywhere.com');
  var result = Day.fromJson(jsonDecode(response1.body));
  return result;
}

class Day {
  final int day1;
  final int day2;
  final int day3;

  Day({this.day1, this.day2, this.day3});

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
        day1: int.parse(encrypter.decrypt(json["hummer"])),
        day2: int.parse(encrypter.decrypt(json["pudding"])),
        day3: int.parse(encrypter.decrypt(json["tomato"])));
  }
}

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:encrypt/encrypt.dart';

final b64key = Key.fromBase64('TuzAS6ZJqkDPwsGhjRTiDzSjp7jWyWVbcVG7cpOqBOQ=');
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

Future<DayDecrypted> fetchDay() async {
  final response1 =
      await http.get('https://tumulrankypanky.pythonanywhere.com');
  var result = Day.fromJson(jsonDecode(response1.body));
  var q = DayDecrypted();
  q.day1 = int.parse((encrypter.decrypt(Encrypted.fromBase64(result.day1))));
  q.day2 = int.parse((encrypter.decrypt(Encrypted.fromBase64(result.day2))));
  q.day3 = int.parse((encrypter.decrypt(Encrypted.fromBase64(result.day3))));
  return q;
}

class Day {
  String day1;
  final String day2;
  final String day3;

  Day({this.day1, this.day2, this.day3});

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
        day1: json["hummer"], day2: json["pudding"], day3: json["tomato"]);
  }
}

class DayDecrypted {
  int day1;
  int day2;
  int day3;
  DayDecrypted({this.day1, this.day2, this.day3});
}

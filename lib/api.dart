import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:encrypt/encrypt.dart';

final encrypter = Encrypter(
    Fernet(Key.fromBase64('TuzAS6ZJqkDPwsGhjRTiDzSjp7jWyWVbcVG7cpOqBOQ=')));

class Main {
  final double? temp;
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
  final Main? main;
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
  final response = await http.get(Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?lat=28.4667&lon=77.0333&appid=77580a3797c4f2efd008403c9faf5e22&units=metric'));
  if (response.statusCode == 200) {
    dynamic result = json.decode(response.body);
    WeatherModel model = WeatherModel.fromJson(result);
    return model;
  } else
    throw Exception('Failed to load Weather Information');
}

Future<Day> fetchDay() async {
  final response1 =
      await http.get(Uri.parse('https://tumulrankypanky.pythonanywhere.com/day'));
  if (response1.statusCode == 200) {
    Day result = Day.fromJson(jsonDecode(response1.body));
    return result;
  } else
    throw Exception('Failed to load Day Order Information');
}

class Day {
  final int? day1, day2, day3;
  final Map<String, dynamic>? timetable, timetabletom;

  Day({this.day1, this.day2, this.day3, this.timetable, this.timetabletom});

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
      day1:
          int.parse((encrypter.decrypt(Encrypted.fromBase64(json["hummer"])))),
      day3:
          int.parse((encrypter.decrypt(Encrypted.fromBase64(json["pudding"])))),
      day2:
          int.parse((encrypter.decrypt(Encrypted.fromBase64(json["tomato"])))),
      // timetable: json['potato'][0],
      // timetabletom: json['aloo'][0],
    );
  }
}

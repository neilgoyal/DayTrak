import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:encrypt/encrypt.dart';
import 'package:schoolcalendar/globals.dart' as globals;

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
  } else {
    throw Exception('Failed to load Weather Information');
  }
}

Future<Timetable> timetable() async {
  final response1 = await http.get(Uri.parse(
      'https://tumulrankypanky.pythonanywhere.com/g${globals.valueOfGrade}'));
  if (response1.statusCode == 200) {
    Timetable result = Timetable.fromJson(jsonDecode(response1.body));
    return result;
  } else
    throw Exception('Failed to load Day Order Information');
}

Future<Day> fetchDay() async {
  final response1 = await http
      .get(Uri.parse('https://tumulrankypanky.pythonanywhere.com/binod'));
  if (response1.statusCode == 200) {
    Day result = Day.fromJson(jsonDecode(response1.body));
    return result;
  } else
    throw Exception('Failed to load Day Order Information');
}

class Timetable {
  final Map<String, dynamic>? timetable_0,
      timetable_1,
      timetable_2,
      timetable_3,
      timetable_4,
      timetable_5,
      timetable_6;

  Timetable({
    this.timetable_0,
    this.timetable_1,
    this.timetable_2,
    this.timetable_3,
    this.timetable_4,
    this.timetable_5,
    this.timetable_6,
  });

  factory Timetable.fromJson(Map<String, dynamic> json) {
    return Timetable(
      timetable_0: json['0'][0],
      timetable_1: json['1'][0],
      timetable_2: json['2'][0],
      timetable_3: json['3'][0],
      timetable_4: json['4'][0],
      timetable_5: json['5'][0],
      timetable_6: json['6'][0],
    );
  }
}

class Day {
  final int? day1, day2, day3, day4, day5, day6, day7;

  Day(
      {this.day1,
      this.day2,
      this.day3,
      this.day4,
      this.day5,
      this.day6,
      this.day7});

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
      day1: int.parse((encrypter.decrypt(Encrypted.fromBase64(json["0"])))),
      day2: int.parse((encrypter.decrypt(Encrypted.fromBase64(json["1"])))),
      day3: int.parse((encrypter.decrypt(Encrypted.fromBase64(json["2"])))),
      day4: int.parse((encrypter.decrypt(Encrypted.fromBase64(json["3"])))),
      day5: int.parse((encrypter.decrypt(Encrypted.fromBase64(json["4"])))),
      day6: int.parse((encrypter.decrypt(Encrypted.fromBase64(json["5"])))),
      day7: int.parse((encrypter.decrypt(Encrypted.fromBase64(json["6"])))),
    );
  }
}

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:encrypt/encrypt.dart';

final encrypter = Encrypter(
    Fernet(Key.fromBase64('TuzAS6ZJqkDPwsGhjRTiDzSjp7jWyWVbcVG7cpOqBOQ=')));

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
  // ignore: non_constant_identifier_names
  final int day1;
  final int day2;
  final int day3;
  final String twelve_1;
  // ignore: non_constant_identifier_names
  final String twelve_1_time;
  final String twelve_2;
  // ignore: non_constant_identifier_names
  final String twelve_2_time;
  final String twelve_3;
  // ignore: non_constant_identifier_names
  final String twelve_3_time;
  final String twelve_4;
  // ignore: non_constant_identifier_names
  final String twelve_4_time;
  final String twelve_5;
  // ignore: non_constant_identifier_names
  final String twelve_5_time;
  // ignore: non_constant_identifier_names
  final String twelve_6;
  // ignore: non_constant_identifier_names
  final String twelve_6_time;
  final String eleven_1;
  // ignore: non_constant_identifier_names
  final String eleven_1_time;
  final String eleven_2;
  // ignore: non_constant_identifier_names
  final String eleven_2_time;
  final String eleven_3;
  // ignore: non_constant_identifier_names
  final String eleven_3_time;
  final String eleven_4;
  // ignore: non_constant_identifier_names
  final String eleven_4_time;
  final String eleven_5;
  // ignore: non_constant_identifier_names
  final String eleven_5_time;
  final String eleven_6;
  // ignore: non_constant_identifier_names
  final String eleven_6_time;
  final String tenth_1;
  // ignore: non_constant_identifier_names
  final String tenth_1_time;
  final String tenth_2;
  // ignore: non_constant_identifier_names
  final String tenth_2_time;
  final String tenth_3;
  // ignore: non_constant_identifier_names
  final String tenth_4_time;
  final String tenth_5;
  // ignore: non_constant_identifier_names
  final String tenth_5_time;
  final String tenth_6;
  // ignore: non_constant_identifier_names
  final String tenth_6_time;
  final String ninth_1;
  // ignore: non_constant_identifier_names
  final String ninth_1_time;
  final String ninth_2;
  // ignore: non_constant_identifier_names
  final String ninth_2_time;
  final String ninth_3;
  // ignore: non_constant_identifier_names
  final String ninth_3_time;
  final String ninth_4;
  // ignore: non_constant_identifier_names
  final String ninth_4_time;
  final String ninth_5;
  // ignore: non_constant_identifier_names
  final String ninth_5_time;
  final String ninth_6;
  // ignore: non_constant_identifier_names
  final String ninth_6_time;
  final String eighth_1;
  // ignore: non_constant_identifier_names
  final String eighth_1_time;
  final String eighth_2;
  // ignore: non_constant_identifier_names
  final String eighth_2_time;
  final String eighth_3;
  // ignore: non_constant_identifier_names
  final String eighth_3_time;
  final String eighth_4;
  // ignore: non_constant_identifier_names
  final String eighth_4_time;
  final String eighth_5;
  // ignore: non_constant_identifier_names
  final String eighth_5_time;
  final String eighth_6;
  // ignore: non_constant_identifier_names
  final String eighth_6_time;
  final String seventh_1;
  // ignore: non_constant_identifier_names
  final String seventh_1_time;
  final String seventh_2;
  // ignore: non_constant_identifier_names
  final String seventh_2_time;
  final String seventh_3;
  // ignore: non_constant_identifier_names
  final String seventh_3_time;
  final String seventh_4;
  // ignore: non_constant_identifier_names
  final String seventh_4_time;
  final String seventh_5;
  // ignore: non_constant_identifier_names
  final String seventh_5_time;
  final String seventh_6;
  // ignore: non_constant_identifier_names
  final String seventh_6_time;
  final String sixth_1;
  // ignore: non_constant_identifier_names
  final String sixth_1_time;
  final String sixth_2;
  // ignore: non_constant_identifier_names
  final String sixth_2_time;
  final String sixth_3;
  // ignore: non_constant_identifier_names
  final String sixth_3_time;
  final String sixth_4;
  // ignore: non_constant_identifier_names
  final String sixth_4_time;
  final String sixth_5;
  // ignore: non_constant_identifier_names
  final String sixth_5_time;
  final String sixth_6;
  // ignore: non_constant_identifier_names
  final String sixth_6_time;
  final String fifth_1;
  // ignore: non_constant_identifier_names
  final String fifth_1_time;
  final String fifth_2;
  // ignore: non_constant_identifier_names
  final String fifth_2_time;
  final String fifth_3;
  // ignore: non_constant_identifier_names
  final String fifth_3_time;
  final String fifth_4;
  // ignore: non_constant_identifier_names
  final String fifth_4_time;
  final String fifth_5;
  // ignore: non_constant_identifier_names
  final String fifth_5_time;
  final String fifth_6;
  // ignore: non_constant_identifier_names
  final String fifth_6_time;
  final Map<String, dynamic> timetable;

  Day({
    this.twelve_1,
    // ignore: non_constant_identifier_names
    this.twelve_1_time,
    this.twelve_2,
    // ignore: non_constant_identifier_names
    this.twelve_2_time,
    this.twelve_3,
    // ignore: non_constant_identifier_names
    this.twelve_3_time,
    this.twelve_4,
    // ignore: non_constant_identifier_names
    this.twelve_4_time,
    this.twelve_5,
    // ignore: non_constant_identifier_names
    this.twelve_5_time,
    this.twelve_6,
    // ignore: non_constant_identifier_names
    this.twelve_6_time,
    this.eleven_1,
    // ignore: non_constant_identifier_names
    this.eleven_1_time,
    this.eleven_2,
    // ignore: non_constant_identifier_names
    this.eleven_2_time,
    this.eleven_3,
    // ignore: non_constant_identifier_names
    this.eleven_3_time,
    this.eleven_4,
    // ignore: non_constant_identifier_names
    this.eleven_4_time,
    this.eleven_5,
    // ignore: non_constant_identifier_names
    this.eleven_5_time,
    this.eleven_6,
    // ignore: non_constant_identifier_names
    this.eleven_6_time,
    this.tenth_1,
    // ignore: non_constant_identifier_names
    this.tenth_1_time,
    this.tenth_2,
    // ignore: non_constant_identifier_names
    this.tenth_2_time,
    this.tenth_3,
    // ignore: non_constant_identifier_names
    this.tenth_4_time,
    this.tenth_5,
    // ignore: non_constant_identifier_names
    this.tenth_5_time,
    this.tenth_6,
    // ignore: non_constant_identifier_names
    this.tenth_6_time,
    this.ninth_1,
    // ignore: non_constant_identifier_names
    this.ninth_1_time,
    this.ninth_2,
    // ignore: non_constant_identifier_names
    this.ninth_2_time,
    this.ninth_3,
    // ignore: non_constant_identifier_names
    this.ninth_3_time,
    this.ninth_4,
    // ignore: non_constant_identifier_names
    this.ninth_4_time,
    this.ninth_5,
    // ignore: non_constant_identifier_names
    this.ninth_5_time,
    this.ninth_6,
    // ignore: non_constant_identifier_names
    this.ninth_6_time,
    this.eighth_1,
    // ignore: non_constant_identifier_names
    this.eighth_1_time,
    this.eighth_2,
    // ignore: non_constant_identifier_names
    this.eighth_2_time,
    this.eighth_3,
    // ignore: non_constant_identifier_names
    this.eighth_3_time,
    this.eighth_4,
    // ignore: non_constant_identifier_names
    this.eighth_4_time,
    this.eighth_5,
    // ignore: non_constant_identifier_names
    this.eighth_5_time,
    this.eighth_6,
    // ignore: non_constant_identifier_names
    this.eighth_6_time,
    this.seventh_1,
    // ignore: non_constant_identifier_names
    this.seventh_1_time,
    this.seventh_2,
    // ignore: non_constant_identifier_names
    this.seventh_2_time,
    this.seventh_3,
    // ignore: non_constant_identifier_names
    this.seventh_3_time,
    this.seventh_4,
    // ignore: non_constant_identifier_names
    this.seventh_4_time,
    this.seventh_5,
    // ignore: non_constant_identifier_names
    this.seventh_5_time,
    this.seventh_6,
    // ignore: non_constant_identifier_names
    this.seventh_6_time,
    this.sixth_1,
    // ignore: non_constant_identifier_names
    this.sixth_1_time,
    this.sixth_2,
    // ignore: non_constant_identifier_names
    this.sixth_2_time,
    this.sixth_3,
    // ignore: non_constant_identifier_names
    this.sixth_3_time,
    this.sixth_4,
    // ignore: non_constant_identifier_names
    this.sixth_4_time,
    this.sixth_5,
    // ignore: non_constant_identifier_names
    this.sixth_5_time,
    this.sixth_6,
    // ignore: non_constant_identifier_names
    this.sixth_6_time,
    this.fifth_1,
    // ignore: non_constant_identifier_names
    this.fifth_1_time,
    this.fifth_2,
    // ignore: non_constant_identifier_names
    this.fifth_2_time,
    this.fifth_3,
    // ignore: non_constant_identifier_names
    this.fifth_3_time,
    this.fifth_4,
    // ignore: non_constant_identifier_names
    this.fifth_4_time,
    this.fifth_5,
    // ignore: non_constant_identifier_names
    this.fifth_5_time,
    this.fifth_6,
    // ignore: non_constant_identifier_names
    this.fifth_6_time,
    this.day1,
    this.day2,
    this.day3,
    this.timetable,
  });

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
      day1:
          int.parse((encrypter.decrypt(Encrypted.fromBase64(json["hummer"])))),
      day3:
          int.parse((encrypter.decrypt(Encrypted.fromBase64(json["pudding"])))),
      day2:
          int.parse((encrypter.decrypt(Encrypted.fromBase64(json["tomato"])))),
      timetable: json['potato'][0],
    );
  }
}

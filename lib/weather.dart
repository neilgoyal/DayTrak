import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Coord {
  final double lon;
  final double lat;

  Coord({this.lat, this.lon});

  factory Coord.fromJson(Map<String, dynamic> json) {
    return Coord(lon: json['lon'], lat: json['lat']);
  }
}

class Weather {
  final int id;
  final String main;
  final String description;
  final String icon;

  Weather({this.id, this.description, this.icon, this.main});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        id: json['id'],
        main: json['main'],
        description: json['description'],
        icon: json['icon']);
  }
}

class Main {
  final double temp;
  // ignore: non_constant_identifier_names
  final double feels_like;
  // ignore: non_constant_identifier_names
  final double temp_min;
  // ignore: non_constant_identifier_names
  final double temp_max;
  final double pressure;
  final int humidity;

  Main(
      {this.temp,
      this.pressure,
      this.humidity,
      // ignore: non_constant_identifier_names
      this.feels_like,
      // ignore: non_constant_identifier_names
      this.temp_max,
      // ignore: non_constant_identifier_names
      this.temp_min});

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
        temp: double.parse(json['temp'].toString()),
        temp_min: double.parse(json['temp_min'].toString()),
        temp_max: double.parse(json['temp_max'].toString()),
        pressure: double.parse(json['pressure'].toString()),
        humidity: json['humidity']);
  }
}

class Wind {
  final double speed;
  final double deg;

  Wind({this.speed, this.deg});

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
        speed: double.parse(json['speed'].toString()),
        deg: double.parse(json['deg'].toString()));
  }
}

class Clouds {
  final int all;

  Clouds({this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) {
    return Clouds(all: json['all']);
  }
}

class Sys {
  final String country;
  final int sunrise;
  final int sunset;

  Sys({this.country, this.sunrise, this.sunset});

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
        country: json['country'],
        sunrise: json['sunrise'],
        sunset: json['sunset']);
  }
}

class WeatherModel {
  final Coord coord;
  final List<Weather> weather;
  final String base;
  final Main main;
  final int visibility;
  final Wind wind;
  final Clouds clouds;
  final int dt;
  final Sys sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  WeatherModel(
      {this.timezone,
      this.coord,
      this.weather,
      this.base,
      this.main,
      this.visibility,
      this.wind,
      this.clouds,
      this.dt,
      this.sys,
      this.id,
      this.name,
      this.cod});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      coord: Coord.fromJson(json['coord']),
      weather: (json['weather'] as List)
          .map((item) => Weather.fromJson(item))
          .toList(),
      base: json['base'],
      main: Main.fromJson(json['main']),
      wind: Wind.fromJson(json['wind']),
      clouds: Clouds.fromJson(json['clouds']),
      dt: json['dt'],
      sys: Sys.fromJson(json['sys']),
      id: json['id'],
      name: json['name'],
      cod: json['cod'],
    );
  }
}

Future<WeatherModel> getWeather() async {
  final response = await http.get(
      'https://api.openweathermap.org/data/2.5/weather?lat=28.4667&lon=77.0333&appid=77580a3797c4f2efd008403c9faf5e22&units=metric');

  if (response.statusCode == 200) {
    var result = json.decode(response.body);
    var model = WeatherModel.fromJson(result);
    return model;
  } else
    throw Exception('Failed to load Weather Information');
}

Widget build(BuildContext context) {
  return Scaffold(
    body: Container(
      child: FutureBuilder<WeatherModel>(
        future: getWeather(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            WeatherModel model = snapshot.data;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${model.main.temp.round()} ˚C',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                )
              ],
            );
          } else if (snapshot.hasError)
            return Text(
              '${snapshot.error}',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.red,
                  fontFamily: 'Protipo Compact'),
            );
          return CircularProgressIndicator();
        },
      ),
    ),
  );
}

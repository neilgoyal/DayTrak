import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather/weather.dart';
import 'dart:async';
import 'package:schoolcalendar/addtask.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

var dt = DateTime.now();
String newDt = DateFormat.MMMd().format(dt);
String newDt1 = DateFormat.EEEE().format(dt);
final double toolbarHeight = 100.0;
String key = '77580a3797c4f2efd008403c9faf5e22';
String cityName = 'Gurgaon';
double lat = 28.466667;
double lon = 77.033333;
WeatherFactory wf = WeatherFactory(key);
List<Weather> _data = [];
double celsius = 0.0;
const fiveSeconds = const Duration(seconds: 100);
List todos = List();

class _HomePageState extends State<HomePage> {
  void queryWeather() async {
    Weather weather = await wf.currentWeatherByLocation(lat, lon);
    setState(() {
      _data = [weather];
    });
    double celsius = weather.temperature.celsius;
  }

  @override
  Widget build(BuildContext context) {
    Timer.periodic(fiveSeconds, (Timer t) => queryWeather());
    return Addtask();
  }
}

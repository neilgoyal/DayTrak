import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:schoolcalendar/weather.dart';
import 'package:http/http.dart' as http;

Future<WeatherModel> getWeather(String lat, String lng) async {
  final response = await http.get(
      'http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lng&appid=77580a3797c4f2efd008403c9faf5e22&units=metric');

  if (response.statusCode == 200) {
    var result = json.decode(response.body);
    var model = WeatherModel.fromJson(result);
    return model;
  } else
    throw Exception('Failed to load Weather Information');
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tempyurtatur'),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: FutureBuilder<WeatherModel>(
            future: getWeather('77.0333', '28.4667'),
            builder: (context, snapshot) {
              if (snapshot.hasData)
                return Text(
                  '${snapshot.data.name}',
                  style: TextStyle(fontSize: 30),
                );
              else if (snapshot.hasError)
                return Text(
                  '${snapshot.error}',
                  style: TextStyle(fontSize: 30, color: Colors.red),
                );
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

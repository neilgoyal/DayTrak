import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:schoolcalendar/weather.dart';
import 'package:http/http.dart' as http;

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

class SettingsPage extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<SettingsPage> {
  @override
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
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
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
}

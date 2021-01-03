import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather/weather.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

var dt = DateTime.now();
String newDt = DateFormat.MMMd().format(dt);
String newDt1 = DateFormat.E().format(dt);
String locationApiUrl = 'https://www.metaweather.com/api/location/28743736/';
int temperature = 0;
final double toolbarHeight = 100.0;
String key = '08db457a80710989d8f16885583c808f';
String cityName = 'Gurgaon';
double lat = 28.466667;
double lon = 77.033333;
WeatherFactory wf = WeatherFactory(key);
List<Weather> _data = [];
double celsius = 0.0;

class _HomePageState extends State<HomePage> {
  void queryWeather() async {
    Weather weather = await wf.currentWeatherByLocation(lat, lon);
    setState(() {
      _data = [weather];
    });
    double celsius = weather.temperature.celsius;
  }

  void fetchLocation() async {
    var locationResult = await http.get(locationApiUrl);
    var result = json.decode(locationResult.body);
    var consolidated_weather = result["consolidated_weather"];
    var data = consolidated_weather[0];

    setState(() {
      temperature = data["the_temp"].round();
    });
  }

  void onTextFieldSubmitted() {
    fetchLocation();
  }

  @override
  Widget build(BuildContext context) {
    queryWeather();
    onTextFieldSubmitted();
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.0),
            child: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          newDt,
                          style: TextStyle(
                            fontFamily: 'Protipo Compact',
                            fontSize: 40,
                            color: const Color(0xff9b8fb1),
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text("Day 1",
                            style: TextStyle(
                              fontFamily: 'Protipo Compact',
                              fontSize: 40,
                              color: const Color(0xff9b8fb1),
                              fontWeight: FontWeight.w300,
                            ))
                      ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(newDt1,
                          style: TextStyle(
                            fontFamily: 'Protipo Compact',
                            fontSize: 30,
                            color: const Color(0xff9b8fb1),
                            fontWeight: FontWeight.w100,
                          )),
                      Text(temperature.toString() + ' °C',
                          style: TextStyle(
                            fontFamily: 'Protipo Compact',
                            fontSize: 30,
                            color: const Color(0xff9b8fb1),
                            fontWeight: FontWeight.w100,
                          ))
                    ],
                  )
                ],
              ),
              toolbarHeight: toolbarHeight,
            )));
  }
}

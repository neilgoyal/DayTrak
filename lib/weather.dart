class Main {
  final double temp;
  final double feels_like;
  final double temp_min;
  final double temp_max;
  final double pressure;
  final int humidity;

  Main({this.temp, this.pressure, this.humidity, this.feels_like, this.temp_max,
      this.temp_min});

      factory Main.fromJson(Map<String, dynamic> json)
      {
        return Main(
        temp: double.parse(json['temp']),
        temp_min: double.parse(json['temp_min']),
        temp_max: double.parse(json['temp_max']),
        
        )
      }

}

class Wind {
  final double speed;
  final double deg;

  Wind({this.speed, this.deg});

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
        speed: double.parse(json['speed']), deg: double.parse(json['deg']));
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
      {this.coord,
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

  // factory WeatherModel.fromJson(Map<String,dynamic> json)
  // {
  //   return WeatherModel(coord: )
  // }
}

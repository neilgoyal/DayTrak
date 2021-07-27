import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:schoolcalendar/globals.dart' as globals;

Future<Timetable> timetable() async {
  final response1 = await http.get(Uri.parse(
      'https://tumulrankypanky.pythonanywhere.com/g${globals.valueOfGrade}'));
  if (response1.statusCode == 200) {
    Timetable result = Timetable.fromJson(jsonDecode(response1.body));
    return result;
  } else
    throw Exception('Failed to load Day Order Information');
}

Future<Map<String, dynamic>> personalizedTT() async {
  final response1 = await http.get(Uri.parse(
      'https://tumulrankypanky.pythonanywhere.com/g${globals.valueOfGrade}pers'));
  if (response1.statusCode == 200) {
    Map<String, dynamic> result = jsonDecode(response1.body)[0];
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

showcorrectday(result) {
  if (result == '7') {
    result = 'Break';
  } else if (result == '8') {
    result = 'Error';
  } else {
    result = "Day $result";
  }
  return result;
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
      day1: int.parse(json["0"]),
      day2: int.parse(json["1"]),
      day3: int.parse(json["2"]),
      day4: int.parse(json["3"]),
      day5: int.parse(json["4"]),
      day6: int.parse(json["5"]),
      day7: int.parse(json["6"]),
    );
  }
}

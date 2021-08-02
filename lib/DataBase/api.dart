import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:schoolcalendar/DataBase/globals.dart' as globals;
import 'package:schoolcalendar/pages/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? b1, b2, b3, b4, b5, b6, b7, b8, b9;

blocktoprefrence(userinput) {
  if (userinput == 'B1') {
    return (b1 == "Block 1") ? b1 : "B1 $b1";
  } else if (userinput == 'B2') {
    return (b2 == "Block 2") ? b2 : "B2 $b2";
  } else if (userinput == 'B3') {
    return (b3 == "Block 3") ? b3 : "B3 $b3";
  } else if (userinput == 'B4') {
    return (b4 == "Block 4") ? b4 : "B4 $b4";
  } else if (userinput == 'B5') {
    return (b5 == "Block 5") ? b5 : "B5 $b5";
  } else if (userinput == 'B6') {
    return (b6 == "Block 6") ? b6 : "B6 $b6";
  } else if (userinput == 'B7') {
    return (b7 == "Block 7") ? b7 : "B7 $b7";
  } else if (userinput == 'B8') {
    return (b8 == "Block 8") ? b8 : "B8 $b8";
  } else if (userinput == 'B9') {
    return (b9 == "Block 9") ? b9 : "B9 $b9";
  } else if (userinput == "English/Math" || userinput == "Math/English") {
    return userinput.split("/")[batch];
  } else if (userinput == "History/Geography") {
    return userinput.split("/")[histgeo];
  } else if (userinput == "Hindi/Spanish/French") {
    return userinput.split("/")[thirdlange];
  } else if (userinput == "Spanish/French") {
    return userinput.split("/")[thirdlang];
  } else {
    return userinput;
  }
}

defaultsvals() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  b1 = prefs.getString('B1') ?? "Block 1";
  b2 = prefs.getString('B2') ?? "Block 2";
  b3 = prefs.getString('B3') ?? "Block 3";
  b4 = prefs.getString('B4') ?? "Block 4";
  b5 = prefs.getString('B5') ?? "Block 5";
  b6 = prefs.getString('B6') ?? "Block 6";
  b7 = prefs.getString('B7') ?? "Block 7";
  b8 = prefs.getString('B8') ?? "Block 8";
  b9 = prefs.getString('B9') ?? "Block 9";
}

Future<Timetable> timetable() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  globals.valueOfGrade = prefs.getInt('Value') ?? 12;
  batch = prefs.getInt('8batchPref') ?? 0;
  histgeo = prefs.getInt('histgeo') ?? 0;
  thirdlange = prefs.getInt('thirdlang8') ?? 0;
  thirdlang = prefs.getInt('thirdlang6and7') ?? 0;
  final response1 = await http.get(Uri.parse(
      'https://tumulrankypanky.pythonanywhere.com/g${globals.valueOfGrade}'));
  if (response1.statusCode == 200) {
    Timetable result = Timetable.fromJson(jsonDecode(response1.body));
    return result;
  } else
    throw Exception('Failed to load Timetable Information');
}

Future<Map<String, dynamic>> personalizedTT() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  globals.valueOfGrade = prefs.getInt('Value') ?? 12;
  batch = prefs.getInt('8batchPref') ?? 0;
  histgeo = prefs.getInt('histgeo') ?? 0;
  thirdlange = prefs.getInt('thirdlang8') ?? 0;
  thirdlang = prefs.getInt('thirdlang6and7') ?? 0;
  final response1 = await http.get(Uri.parse(
      'https://tumulrankypanky.pythonanywhere.com/g${globals.valueOfGrade}pers'));
  if (response1.statusCode == 200) {
    Map<String, dynamic> result = jsonDecode(response1.body)[0];
    return result;
  } else
    throw Exception('Failed to load Personal Timetable Information');
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

  Day({
    this.day1,
    this.day2,
    this.day3,
    this.day4,
    this.day5,
    this.day6,
    this.day7,
  });

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

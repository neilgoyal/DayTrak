import 'dart:io';
import 'dart:async';
import 'dart:convert';

main(List arguments) {
  final File file = new File(
      "/Users/vinayak/Developer/School_Calendar_project/Practice_Logic_31days.csv");

  Stream<List> inputStream = file.openRead();

  inputStream
      .transform(utf8.decoder) // Decode bytes to UTF-8.
      .transform(new LineSplitter()) // Convert stream to individual lines.
      .listen((String line) {});
}

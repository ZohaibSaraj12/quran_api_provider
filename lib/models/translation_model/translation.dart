import 'package:flutter/material.dart';


class Translation {
  int numberInSurah;
  String text;

  Translation(this.numberInSurah, this.text);

  factory Translation.fromJson(json) {
    return Translation(
    json['numberInSurah'],
      json['text'],
    );
  }
}
import 'package:flutter/material.dart';

class Ayah {
  int numberInSurah;
  String text;

  Ayah(this.numberInSurah, this.text);


  factory Ayah.fromJson(json) {
    return Ayah(
      json['numberInSurah'],
      json['text'],
    );
  }
}
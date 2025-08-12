import 'package:flutter/material.dart';



class Surah {
  String surahName;
  String surahNameArabic;
  String revelationPlace;
  int totalAyah;



  Surah(this.surahName, this.surahNameArabic, this.revelationPlace, this.totalAyah);

  factory Surah.fromJson(json) {
    return Surah(
      json['surahName'],
      json['surahNameArabic'],
      json['revelationPlace'],
      json['totalAyah']
    );
  }


}
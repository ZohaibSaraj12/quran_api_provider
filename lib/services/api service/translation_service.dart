import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/translation_model/translation.dart';


class TranslationService {
  final baseUrl = "https://api.alquran.cloud/v1";
  
  Future<List<Translation>> fetchTranslation(int surahNumber) async {
    final response = await http.get(Uri.parse("$baseUrl/surah/$surahNumber/en.asad"),
        headers: {
          "User-Agent":
          "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (HTML, like Gecko) Chrome/115.0 Safari/537.36",
          "Accept": "application/json",
        });
    if (response.statusCode == 200) {
      Map translation = jsonDecode(response.body);
      List translationData = translation['data']['ayahs'] as List;
      return translationData.map((translation) => Translation.fromJson(translation)).toList();
    }
    else {
      throw Exception("Error with ${response.statusCode}");
    }
  } 
}
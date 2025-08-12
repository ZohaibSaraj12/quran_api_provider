import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quran_api_provider/models/ayah_model/ayah.dart';

class AyahService {
  final baseUrl = "https://api.alquran.cloud/v1";
  Future<List<Ayah>> fetchAyahs(int surahNumber) async {
    final response = await http.get(Uri.parse("$baseUrl/surah/$surahNumber"),
        headers: {
          "User-Agent":
          "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (HTML, like Gecko) Chrome/115.0 Safari/537.36",
          "Accept": "application/json",

        }
    );

    if (response.statusCode == 200) {
      final ayah = jsonDecode(response.body);
      List data = ayah['data']['ayahs'] as List;
      return data.map((ayah) => Ayah.fromJson(ayah)).toList();

    }
    else {
      throw Exception("Error Fetching data...");
    }

  }
}
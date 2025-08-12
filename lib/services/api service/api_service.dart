import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../models/surah model/surah.dart';
class ApiService {


  Future<List<Surah>> fetchData() async {
    final response = await http.get(Uri.parse("https://quranapi.pages.dev/api/surah.json"),
        headers: {
          "User-Agent":
          "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (HTML, like Gecko) Chrome/115.0 Safari/537.36",
          "Accept": "application/json",

        }
    );


      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);
        return data.map((surah) => Surah.fromJson(surah)).toList();
      } else {
        throw Exception(
          "Error with ${response.statusCode}",
        );
      }

  }
}
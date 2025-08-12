import 'package:flutter/material.dart';
import 'package:quran_api_provider/services/api%20service/ayah_service.dart';

import '../../models/ayah_model/ayah.dart';

class VerseProvider extends ChangeNotifier {


  final AyahService _apiService = AyahService();
  bool _isLoading = false;
  String? _error;
  List<Ayah> _ayahs = [];

  bool get isLoading => _isLoading;
  String? get error => _error;
  List<Ayah> get ayahs => _ayahs;

  VerseProvider(int surahNumber) {
    getVerses(surahNumber);
  }
  Future<void> getVerses(int surahNumber) async {

  _isLoading = true;
  notifyListeners();

  try {
  _ayahs = await _apiService.fetchAyahs(surahNumber);
  _error = null;
  } catch (e) {
  _error = e.toString();
  }

  _isLoading = false;
  notifyListeners();
  }

}
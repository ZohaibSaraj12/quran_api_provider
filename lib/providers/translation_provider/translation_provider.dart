import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_api_provider/services/api%20service/translation_service.dart';

import '../../models/translation_model/translation.dart';


class TranslationProvider extends ChangeNotifier {
  final TranslationService _translationService = TranslationService();
  String? _error;
  List<Translation> _translation = [];
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  List<Translation> get translation => _translation;
  String? get error => _error;
  int get length => _translation.length;
  TranslationProvider(int surahNumber) {
    fetchData(surahNumber);
  }

  Future<void> fetchData(int surahNumber) async {
    _isLoading = true;
    notifyListeners();

    try {
      _translation = await _translationService.fetchTranslation(surahNumber);
      _error = null;
    } catch (error) {
      _error = error.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}
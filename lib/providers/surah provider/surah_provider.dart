import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:quran_api_provider/services/api%20service/api_service.dart';

import '../../models/surah model/surah.dart';


class SurahProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  bool _isLoading = false;
  List<Surah> _surahs = [];
  String? _error;



   // ye haye constructor ka jadooo,
  SurahProvider(){

    getData();
  }

  List<Surah> get surahs => _surahs;
  bool get isLoading => _isLoading;
  String? get error => _error;



  Future<void> getData() async {
    _isLoading = true;
    notifyListeners();


    try {
      _surahs = await _apiService.fetchData();
      _error = null;
    }
    catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }


  }


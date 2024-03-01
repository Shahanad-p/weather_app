import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_response_model.dart';
import 'package:weather_app/secrets/api_file.dart';

class WeatherServiceProvider extends ChangeNotifier {
  WeatherModel? _weather;
  WeatherModel? get weather => _weather;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _error = '';
  String get error => _error;

  Future<void> fetchWeatherDataByCity(String city) async {
    _isLoading = true;
    _error = '';

    try {
      final String apiUrl =
          '${APIEndpoints().cityUrl}${city}&appid=${APIEndpoints().apikey}${APIEndpoints().units}';
      print(apiUrl);
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data);

        _weather = WeatherModel.fromJson(data);
        print(_weather!.name);
        notifyListeners();
      } else {
        _error = 'Failed to load data';
      }
    } catch (e) {
      _error = 'Falied to load to data $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

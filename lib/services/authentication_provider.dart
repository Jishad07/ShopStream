import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../confiq/api_confiq.dart';



class AuthProvider with ChangeNotifier {
  String? _status; // Change this to store the status

  String? get status => _status;

  Future<bool> login(String username, String password) async {
    final url = Uri.parse('$baseUrl$loginEndPoint'); 

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'login': username, 
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      
      _status = data['status']; // Check for the status field in the response
      notifyListeners();

      if (_status == 'ok') {
        print("Login successful");
        return true;
      } else {
        print("Login failed: status is not ok");
        return false;
      }
    } else {
      print('Login failed: ${response.statusCode} ${response.reasonPhrase}');
      return false; 
    }
  }

  Future<void> fetchStatus() async {
    final prefs = await SharedPreferences.getInstance();
    _status = prefs.getString('auth_status') ?? null; 
    notifyListeners();
  }

  void logout() async {
    _status = null; 
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_status'); 
    notifyListeners();
  }
}

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:sayurinaja/App/shared/models/auth/login_request.dart';
import 'package:sayurinaja/App/shared/models/auth/register_request.dart';
import 'package:sayurinaja/App/shared/models/auth/user_response.dart';

class UserService {
  final String baseAndroidUrl = "http://10.0.2.2:8000"; // Android Emulator

  final String baseUrl = "http://localhost:8000"; // IOS Emulator

  // REGISTER COK
  Future<UserResponse> registerAPI(RegisterRequest request) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/signup"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(request.toJson()),
      );

      debugPrint("Backend response body: ${response.body}");
      debugPrint("Backend status code: ${response.statusCode}");

      if (response.statusCode == 200) {
        // mengembalikan UserResponse yang sudah berisi succeed dan message
        return UserResponse.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Failed register: ${response.body}");
      }
    } catch (e) {
      debugPrint("Error during register: $e");
      throw Exception("Error during register: $e");
    }
  }

  // LOGIN COKK
  Future<UserResponse> loginAPI(LoginRequest request) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/Login"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(request.toJson()),
      );

      if (response.statusCode == 200) {
        return UserResponse.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Failed login: ${response.body}");
      }
    } catch (e) {
      throw Exception("Error during login: $e");
    }
  }
}

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:sayurinaja/App/shared/models/auth/login_request.dart';
import 'package:sayurinaja/App/shared/models/auth/register_request.dart';
import 'package:sayurinaja/App/shared/models/auth/user_response.dart';

class UserService {
  final String baseAndroidUrl = "http://10.0.2.2:8000";
  final String baseUrl = "http://localhost:8000";

  // REGISTER API - Updated
  Future<UserResponse> registerAPI(RegisterRequest request) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/signup"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(request.toJson()),
      );

      debugPrint("Backend response body: ${response.body}");
      debugPrint("Backend status code: ${response.statusCode}");

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // Success response with OTP
        return UserResponse.fromJson(responseData);
      } else {
        return UserResponse.fromJson(responseData);
      }
    } catch (e) {
      debugPrint("Error during register: $e");
      throw Exception("Error during register: $e");
    }
  }

  // Method untuk verify OTP
  Future<UserResponse> verifyOTP(String otp) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/verify-otp"), 
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"otp": otp}),
      );

      debugPrint("VerifyOTP response body: ${response.body}");
      debugPrint("VerifyOTP status code: ${response.statusCode}");

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return UserResponse.fromJson(responseData);
      } else {
        return UserResponse.fromJson(responseData);
      }
    } catch (e) {
      debugPrint("Error during OTP verification: $e");
      throw Exception("Error during OTP verification: $e");
    }
  }

  // LOGIN API
  Future<UserResponse> loginAPI(LoginRequest request) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/Login"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(request.toJson()),
      );

      debugPrint("Login response body: ${response.body}");
      debugPrint("Login status code: ${response.statusCode}");

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return UserResponse.fromJson(responseData);
      } else {
        return UserResponse.fromJson(responseData);
      }
    } catch (e) {
      debugPrint("Error during login: $e");
      throw Exception("Network error: $e");
    }
  }
}

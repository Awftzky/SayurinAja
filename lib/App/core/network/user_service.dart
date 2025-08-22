import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sayurinaja/App/features/auth/models/login_request.dart';
import 'package:sayurinaja/App/features/auth/models/register_request.dart';
import 'package:sayurinaja/App/features/auth/models/user_response.dart';

class UserService {
  final String baseUrl = "localhost:8000";

  // REGISTER COKK
  Future<UserResponse> registerAPI(RegisterRequest request) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/signup"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(request.toJson()),
      );

      if (response.statusCode == 200) {
        return UserResponse.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Failed register: ${response.body}");
      }
    } catch (e) {
      throw Exception("Error during register: $e");
    }
  }

  // LOGIN COKK
  Future<UserResponse> loginAPI(LoginRequest request) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/login"),
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

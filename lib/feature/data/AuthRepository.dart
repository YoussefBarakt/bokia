import 'package:bokia/core/helper/DioServices.dart';
import 'package:bokia/core/helper/localServices.dart';
import 'package:bokia/feature/data/models/Register_RequestModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class AuthRepository {
  static Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await DioServices.dio!.post(
        "/login",
        data: {"email": email, "password": password},
      );

      if (response.statusCode == 200 && response.data["data"] != null) {
        final token = response.data["data"]["token"]?.toString() ?? "";
        debugPrint("Token: $token");

        await LocalServices.sharedPreferences?.setString("userToken", token);
        return response.data;
      } else {
        final message = response.data["message"] ?? "Login failed";
        throw Exception(message);
      }
    } on DioException catch (e) {
      final errorMsg = e.response?.data["message"] ?? "Login failed";
      throw Exception(errorMsg);
    } catch (e) {
      throw Exception("Something went wrong: $e");
    }
  }

  static Future<Map<String, dynamic>> register(RegisterRequestmodel registerModel) async {
    try {
      final response = await DioServices.dio!.post(
        "/register",
        data: registerModel.toMap(),
      );

      if (response.statusCode == 201 && response.data["data"] != null) {
        final token = response.data["data"]["token"]?.toString() ?? "";
        await LocalServices.sharedPreferences?.setString("userToken", token);
        return response.data;
      } else {
        final message = response.data["message"] ?? "Registration failed";
        throw Exception(message);
      }
    } on DioException catch (e) {
      final errorMsg = e.response?.data["message"] ?? "Something went wrong";
      throw Exception(errorMsg);
    } catch (e) {
      throw Exception("Something went wrong: $e");
    }
  }
}

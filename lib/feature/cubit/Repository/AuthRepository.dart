import 'package:dio/dio.dart';

class AuthRepository {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://codingarabic.online/api",
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
    ),
  );

  static login({required String email, required String password}) async {
    try {
      final response = await dio.post(
        "/login",
        data: {"email": email, "password": password},
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception("Login failed: ${response.statusMessage}");
      }
    } catch (e) {
      print("Error: $e");
      throw Exception("Something went wrong, please try again later.");
    }
  }

}

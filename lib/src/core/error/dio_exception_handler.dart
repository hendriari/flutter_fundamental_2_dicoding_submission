import 'package:dio/dio.dart';

class DioExceptionHandler {
  String dioErrorHandler(e) {
    if (e == null) return "Unknown Error";
    if (e.runtimeType != DioException) {
      return e is String ? "Error: $e" : "Unknown Error";
    }

    if (e.response == null) return "Error: ${e.message}";

    String response = "Unknown Error";
    Map<String, dynamic>? data = e.response?.data;

    if (data != null) {
      if (data.containsKey("message") && data["message"] != null) {
        response = data["message"];
      } else if (data.containsKey("error") && data["error"] != null) {
        response = data["error"];
      } else {
        response = 'Unknown Error';
      }
    }

    return response;
  }
}

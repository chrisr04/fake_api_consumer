import 'dart:convert';
import 'package:fake_api_consumer/core/errors/network_exception/network_exception.dart';
import 'package:http/http.dart';

class ErrorHandler {
  static Future<NetworkException> getError(Response response) async {
    final error = await ErrorHandler.getErrorMessage(response);
    switch (response.statusCode) {
      case 400:
        return BadRequestException(error);
      case 404:
        return NotFoundException(error);
      case 401:
        return UnauthorizedException(error);
      case 500:
        return ServerErrorException(error);
      case 503:
        return ServiceUnavailableException(error);
      default:
        return NetworkException('NetworkException', error);
    }
  }

  static Future<String> getErrorMessage(Response response) async {
    final body = response.body;
    try {
      final error = jsonDecode(body);
      if (error is Map<String, dynamic> && error.containsKey('message')) {
        return error['message'] as String;
      }
    } catch (_) {}
    return body;
  }
}

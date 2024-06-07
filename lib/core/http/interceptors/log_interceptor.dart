import 'package:http/http.dart';
import 'package:fake_api_consumer/core/errors/errors.dart';
import 'package:fake_api_consumer/core/http/interceptors/http_interceptor.dart';

class LogInterceptor extends HttpInterceptor {
  @override
  Future<Request> onRequest(Request request) async {
    print('*** REQUEST ***');
    print('uri: ${request.url}');
    print('method: ${request.method}');
    print('headers: {');
    for (final key in request.headers.keys) {
      print(' $key: ${request.headers[key]}');
    }
    print('}');
    print('body: ${request.body}\n');
    return request;
  }

  @override
  Future<Response> onResponse(Response response) async {
    print('*** RESPONSE ***');
    print('uri: ${response.request?.url}');
    print('method: ${response.request?.method}');
    print('statusCode: ${response.statusCode} ${response.reasonPhrase}');
    if (response.request != null) {
      print('headers: {');
      for (final key in response.headers.keys) {
        print(' $key: ${response.request?.headers[key]}');
      }
      print('}');
    }
    print('response: ${response.body}\n');
    return response;
  }

  @override
  Future<void> onError(
    NetworkException error,
    Response response,
  ) async {
    print('*** HTTP ERROR ***');
    print('uri: ${response.request?.url}');
    print('method: ${response.request?.method}');
    print('statusCode: ${response.statusCode} ${response.reasonPhrase}');
    if (response.request != null) {
      print('headers: {');
      for (final key in response.headers.keys) {
        print(' $key: ${response.request?.headers[key]}');
      }
      print('}');
    }
    print('error: ${error.message}\n');
  }
}

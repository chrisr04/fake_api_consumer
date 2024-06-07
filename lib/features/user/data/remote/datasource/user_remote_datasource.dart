import 'dart:convert';

import 'package:fake_api_consumer/core/http/http_client.dart';
import 'package:fake_api_consumer/features/user/data/remote/model/user.dart';

class UserRemoteDataSource {
  const UserRemoteDataSource(this._http);

  final HttpClient _http;

  Future<List<UserModel>> getAllUsers() async {
    final url = _http.url('/users/');
    final response = await _http.get(url);
    final body = jsonDecode(response.body) as List;
    final users = body.map((e) => UserModel.fromJson(e)).toList();
    return users;
  }
}

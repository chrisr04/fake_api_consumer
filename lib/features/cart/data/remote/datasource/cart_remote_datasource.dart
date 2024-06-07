import 'dart:convert';
import 'package:fake_api_consumer/core/http/http_client.dart';
import 'package:fake_api_consumer/features/cart/data/remote/model/cart_model.dart';

class CartRemoteDataSource {
  const CartRemoteDataSource(this._http);

  final HttpClient _http;

  Future<List<CartModel>> getAllCarts() async {
    final url = _http.url('/carts');
    final response = await _http.get(url);
    final body = jsonDecode(response.body) as List;
    final carts = body.map((e) => CartModel.fromJson(e)).toList();
    return carts;
  }
}

import 'dart:convert';
import 'package:fake_api_consumer/core/http/http_client.dart';
import 'package:fake_api_consumer/features/product/data/remote/model/product_model.dart';

class ProductRemoteDataSource {
  const ProductRemoteDataSource(this._http);

  final HttpClient _http;

  Future<List<ProductModel>> getAllProducts() async {
    final url = _http.url('/products');
    final response = await _http.get(url);
    final body = jsonDecode(response.body) as List;
    final products = body.map((e) => ProductModel.fromJson(e)).toList();
    return products;
  }
}

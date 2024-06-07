import 'package:http/http.dart';
import 'package:fake_api_consumer/fake_api_consumer.dart';

void main(List<String> arguments) async {
  final http = HttpClient(
    Client(),
    baseUrl: 'https://fakestoreapi.com',
  );

  final productDataSource = ProductRemoteDataSource(http);
  final productRepository = ProductRepositoryImpl(productDataSource);
  final productController = ProductController(productRepository);
  await productController.showProducts();

  final userDataSource = UserRemoteDataSource(http);
  final userRepository = UserRepositoryImpl(userDataSource);
  final userController = UserController(userRepository);
  await userController.showUsers();

  final cartDataSource = CartRemoteDataSource(http);
  final cartRepository = CartRepositoryImpl(cartDataSource);
  final cartController = CartController(cartRepository);
  await cartController.showCarts();

  http.close();
}

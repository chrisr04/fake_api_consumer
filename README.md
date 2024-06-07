# Fake Api Consumer
Fake Api Consumer es un aplicación creada en Dart que sirve para consumir los servicios de la [Fake Api Store](https://fakestoreapi.com/) utilizando el paquete [http](https://pub.dev/packages/http) para realizar las peticiones de red y [dartz](https://pub.dev/packages/dartz) para el manejo de errores. Además, utiliza una implementación sencilla del patron MVC que nos permite mostrar la información obtenida por consola y un enfoque de Clean Architecture para garantizar la escalabilidad del código.

## Construido con

- Dart (v3.3.4)

## Instrucciones de uso

**Paso 1**

Descarga o clona este repositorio con el siguiente link:

```
https://github.com/chrisr04/fake_api_consumer.git
```

**Paso 2**

Ve a la raiz del proyecto y ejecuta el siguiente comando para descargar las dependencias necesarias: 

```
dart pub get 
```

**Paso 3**

Luego ejecuta el siguiente comando para correr la aplicación:

```
dart run
```

## Modelos principales

**Modelo Product**

```
class Product {
  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating rating;
}
```

**Modelo Cart**

```
class Cart {
  const Cart({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
  });

  final int id;
  final int userId;
  final DateTime date;
  final List<CartProduct> products;
}
```

**Modelo User**

```
class User {
  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
  });

  final int id;
  final UserName name;
  final String email;
  final String phone;
  final Address address;
}
```

## Manejo de peticiones
Para realizar las solicitudes a la API se realizó una clase llamada HttpClient que extiende de la clase abstracta BaseClient que nos proporciona el paquete http, con el propósito de centralizar algunas configuraciones comunes (url base, headers, interceptors) para que pudieran usarse al realizar cualquier petición de red sin necesidad de volver a agregarlas. Otra ventaja de esta implementación es que nos permite lanzar errores específicos basandonos en el statusCode de la respuesta, evitando agregar comprobaciones repetitivas al momento de utilizar cualquiera de los métodos que dispone para realizar peticiones.

```
final http = HttpClient(
  Client(),
  baseUrl: 'https://fakestoreapi.com',
  baseHeaders: {
    'Content-Type': 'application/json',
  },
  interceptors: [
    LogInterceptor(),
  ],
);

Future<List<ProductModel>> getAllProducts() async {
  final url = http.url('/products');
  final response = await http.get(url);
  final body = jsonDecode(response.body) as List;
  final products = body.map((e) => ProductModel.fromJson(e)).toList();
  return products;
}
```

## Manejo de errores
Para el manejo de errores se utilizó el tipo de dato Either proporcionado por el paquete de programación funcional dartz que nos ayuda a comprobar si nuestra petición fue exitosa o hubo algun fallo que debamos manejar. en caso de que todo haya salido bien retornaremos un Right con la información que definimos previamente en el Either del lado derecho o un Left si ha ocurrido un fallo que debamos controlar. Cuando queramos comprobar si ha sucedido un caso u otro podemos utilizar la funcion fold que nos proporciona un callback para cada situación.

```
@override
Future<Either<Failure, List<User>>> getAllUsers() async {
  try {
    final users = await _remoteDataSource.getAllUsers();
    return Right(users);
  } on SocketException {
    return Left(NoInternetFailure());
  } on FormatException {
    return Left(InvalidResponseFailure());
  } catch (e) {
    return Left(FetchDataFailure(e.toString()));
  }
}

Future<void> showUsers() async {
  final failureOrUsers = await _repository.getAllUsers();
  failureOrUsers.fold(
    (failure) => print(failure.message),
    (users) => _printUsers(users),
  );
}
```


class CoffeeFailure implements Exception {
  final String? _message;

  CoffeeFailure(this._message);

  String? get message => _message;
}

class CoffeeRepositoryError extends CoffeeFailure {
  CoffeeRepositoryError(String? message) : super(message);
}

class CoffeeDatasourceError extends CoffeeRepositoryError {
  CoffeeDatasourceError(String? message) : super(message);
}

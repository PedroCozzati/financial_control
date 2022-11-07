import 'package:dartz/dartz.dart';

import '../entities/default.entity.dart';
import '../errors/default.failure.dart';
import '../repositories/coffee.repository.dart';

abstract class ICoffeeUseCase {
  Future<Either<CoffeeFailure, CoffeeEntity>> call();
}

class CoffeeUseCase implements ICoffeeUseCase {
  final ICoffeeRepository _repository;

  CoffeeUseCase(this._repository);

  @override
  Future<Either<CoffeeFailure, CoffeeEntity>> call() async {
    return _repository.getCoffee();
  }
}

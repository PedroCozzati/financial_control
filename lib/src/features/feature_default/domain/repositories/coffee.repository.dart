import 'package:dartz/dartz.dart';

import '../entities/default.entity.dart';
import '../errors/default.failure.dart';

abstract class ICoffeeRepository {
  Future<Either<CoffeeFailure, CoffeeEntity>> getCoffee();
}

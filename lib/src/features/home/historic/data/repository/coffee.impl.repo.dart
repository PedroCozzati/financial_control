// import 'package:dartz/dartz.dart';
//
// import '../../domain/entities/default.entity.dart';
// import '../../domain/errors/default.failure.dart';
// import '../../domain/repositories/coffee.repository.dart';
// import '../datasource/coffee.datasource.dart';
//
// class CoffeeRepositoryImp implements ICoffeeRepository {
//   final ICoffeeDataSource coffeeDatasource;
//
//  CoffeeRepositoryImp({required this.coffeeDatasource});
//
//   @override
//   Future<Either<CoffeeFailure, CoffeeEntity>>
//   getCoffee() async {
//     try {
//       final result = await coffeeDatasource.getCoffee();
//       return Right(result);
//     } on Exception {
//       return Left(
//         CoffeeDatasourceError(
//           'Erro no datasource',
//         ),
//       );
//     }
//   }
// }

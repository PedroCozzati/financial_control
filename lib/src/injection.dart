
import 'package:get_it/get_it.dart';

import 'features/feature_default/data/datasource/coffee.datasource.dart';
import 'features/feature_default/data/repository/coffee.impl.repo.dart';
import 'features/feature_default/domain/repositories/coffee.repository.dart';
import 'features/feature_default/domain/usecases/coffee.usecase.dart';
import 'features/feature_default/external/datasources/coffee.impl.datasource.dart';
import 'package:http/http.dart' as http;

import 'features/feature_default/presentation/controllers/coffee.bloc.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerLazySingleton<ICoffeeDataSource>(
        () => CoffeeDatasourceImpl(),
  );
  getIt.registerLazySingleton<ICoffeeRepository>(
        () => CoffeeRepositoryImp(
        coffeeDatasource: getIt.get<ICoffeeDataSource>()),
  );
  getIt.registerLazySingleton<ICoffeeUseCase>(
        () => CoffeeUseCase(getIt.get<ICoffeeRepository>()),
  );
  getIt.registerFactory<CoffeeBloc>(
        () => CoffeeBloc(
        coffeeUseCase: getIt.get<ICoffeeUseCase>()),
  );
}



import '../models/coffee.model.dart';

abstract class ICoffeeDataSource {
  Future<CoffeeModel> getCoffee();
}

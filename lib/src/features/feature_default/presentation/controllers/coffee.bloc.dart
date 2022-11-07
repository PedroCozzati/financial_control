
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/coffee.usecase.dart';
import 'coffee.event.dart';
import 'coffee.state.dart';

class CoffeeBloc extends Bloc<CoffeeEvent,
    CoffeeState> {
  final ICoffeeUseCase coffeeUseCase;


  CoffeeBloc({
    required this.coffeeUseCase,
  }): super(const CoffeeState.initialState());

  @override
  Stream<CoffeeState> mapEventToState(
      CoffeeEvent event) async* {
    yield* event.when(
      getCoffee: getCoffee,
    );
  }

  @override
  get initialState => CoffeeState.initialState();

  Stream<CoffeeState> getCoffee() async* {
    yield CoffeeState.initialState();

    final response = await coffeeUseCase();

    yield response.fold(
            (l) => CoffeeState.getCoffeeFailure(),
            (r) => CoffeeState.getCoffeeSuccess(
          coffee: r,

        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection.dart';
import '../../domain/usecases/coffee.usecase.dart';
import '../controllers/coffee.bloc.dart';
import 'coffee_page.dart';

class CoffeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CoffeeBloc>(
            create: (BuildContext context) => CoffeeBloc(
                  coffeeUseCase: getIt.get<ICoffeeUseCase>(),
                )),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Coffee',
        home:  CoffeeHomeScreen(),
        theme: ThemeData(primaryColor: Colors.brown),
      ),
    );
  }
}
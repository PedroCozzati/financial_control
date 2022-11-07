import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controllers/coffee.bloc.dart';
import '../controllers/coffee.event.dart';
import '../controllers/coffee.state.dart';
import '../widget/bottom_bar_ui.dart';
import '../widget/coffee_error.page.dart';
import '../widget/coffee_loading.dart';
import '../widget/coffee_row.dart';
import '../widget/coffee_success.page.dart';


class CoffeeHomeScreen extends StatefulWidget {
  static const String route = 'coffee';

  const CoffeeHomeScreen({Key? key}) : super(key: key);

  @override
  _CoffeeHomeScreenState createState() => _CoffeeHomeScreenState();
}

class _CoffeeHomeScreenState extends State<CoffeeHomeScreen> {
  late CoffeeBloc _coffeeBloc;

  @override
  void initState() {
    _coffeeBloc = BlocProvider.of<CoffeeBloc>(context);
    _orderCoffee();
    super.initState();
  }

  @override
  void dispose() {
    _coffeeBloc.close();
    super.dispose();
  }

  _orderCoffee() {
   _coffeeBloc.add(
      const CoffeeEvent.getCoffee(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: Colors.brown.shade50,
        appBar: AppBar(
          backgroundColor: Colors.brown,
          centerTitle: true,
          title: const Text("Grab a coffee"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.only(bottom: 30,left: 20,right:20 ),
              height: MediaQuery.of(context).size.height / 10,
              child: const CoffeeRowTop(),
            ),
            BlocBuilder<CoffeeBloc, CoffeeState>(
              cubit: _coffeeBloc,
              builder: (BuildContext context, CoffeeState state) {
                return state.maybeMap(
                  getCoffeeSuccess: (state) => CoffeeSuccess(
                    coffee: state.coffee,
                  ),
                  getCoffeeLoading: (state) => CoffeeLoadingWidget(),
                  getCoffeeFailure: (state) => const CoffeeErrorWidget(),
                  orElse: () => CoffeeLoadingWidget(),
                );
              },
            ),
            Container(
              padding: const EdgeInsets.only(top: 30,left: 20,right:20 ),
              height: MediaQuery.of(context).size.height / 10,
              child: const CoffeeRowBottom(),
            ),
          ],
        ),
        bottomNavigationBar: BottomBar(
          onTap: () => _orderCoffee(),
        ),
      );

  }
}

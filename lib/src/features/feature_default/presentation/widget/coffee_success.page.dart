import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/default.entity.dart';
import '../controllers/coffee.bloc.dart';
import '../controllers/coffee.event.dart';
import '../controllers/coffee.state.dart';

class CoffeeSuccess extends StatelessWidget {
  final CoffeeEntity coffee;


  CoffeeSuccess({required this.coffee});


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            child: Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 2.5,
                child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(coffee.file),
                )),
          ),
        ],
      ),
    );
  }
}




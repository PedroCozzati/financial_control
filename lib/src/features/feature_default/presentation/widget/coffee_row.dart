import 'dart:math';

import 'package:flutter/material.dart';

class CoffeeRowTop extends StatelessWidget {
  const CoffeeRowTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset('lib/assets/coffee6.png'),
        Image.asset('lib/assets/coffee4.png'),
        Image.asset('lib/assets/coffee3.png'),
        Image.asset('lib/assets/coffee2.png'),
      ],
    );
  }
}

class CoffeeRowBottom extends StatelessWidget {
  const CoffeeRowBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset('lib/assets/coffee2.png'),
        Image.asset('lib/assets/coffee3.png'),
        Image.asset('lib/assets/coffee4.png'),
        Image.asset('lib/assets/coffee6.png'),
      ],
    );
  }
}